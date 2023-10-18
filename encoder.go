package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"path/filepath"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/build"
	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/token"
	"cuelang.org/go/encoding/openapi"
	"cuelang.org/go/encoding/protobuf/jsonpb"
	"cuelang.org/go/encoding/protobuf/textproto"
	"cuelang.org/go/pkg/encoding/yaml"
)

// An encoder converts CUE to various file formats, including CUE itself.
type encoder struct {
	cfg          *config
	close        func() error
	interpret    func(cue.Value) (*ast.File, error)
	encFile      func(*ast.File) error
	encValue     func(cue.Value) error
	autoSimplify bool
	concrete     bool
	instance     *cue.Instance
}

// newEncoder writes content to the file with the given specification.
func newEncoder(f *build.File, cfg *config) (*encoder, error) {
	w, close, err := writer(f, cfg)
	if err != nil {
		return nil, err
	}
	e := &encoder{
		cfg:   cfg,
		close: close,
	}

	switch f.Interpretation {
	case "":
	case build.OpenAPI:
		// TODO: get encoding options
		cfg := &openapi.Config{}
		e.interpret = func(v cue.Value) (*ast.File, error) {
			i := e.instance
			if i == nil {
				i = makeInstance(v).(*cue.Instance)
			}
			return openapi.Generate(i, cfg)
		}
	case build.ProtobufJSON:
		e.interpret = func(v cue.Value) (*ast.File, error) {
			f, err := valueToFile(v)
			if err != nil {
				return f, err
			}
			return f, jsonpb.NewEncoder(v).RewriteFile(f)
		}

	// case build.JSONSchema:
	// 	// TODO: get encoding options
	// 	cfg := openapi.config{}
	// 	i.interpret = func(inst *cue.Instance) (*ast.File, error) {
	// 		return jsonschmea.Generate(inst, cfg)
	// 	}
	default:
		return nil, fmt.Errorf("unsupported interpretation %q", f.Interpretation)
	}

	switch f.Encoding {
	case build.CUE:
		fi, err := fromFile(f, cfg.Mode)
		if err != nil {
			return nil, err
		}
		e.concrete = !fi.Incomplete

		synOpts := []cue.Option{}
		if !fi.KeepDefaults || !fi.Incomplete {
			synOpts = append(synOpts, cue.Final())
		}

		synOpts = append(synOpts,
			cue.Docs(fi.Docs),
			cue.Attributes(fi.Attributes),
			cue.Optional(fi.Optional),
			cue.Concrete(!fi.Incomplete),
			cue.Definitions(fi.Definitions),
			cue.ResolveReferences(!fi.References),
			cue.DisallowCycles(!fi.Cycles),
			cue.InlineImports(cfg.InlineImports),
		)

		opts := []format.Option{}
		opts = append(opts, cfg.Format...)

		useSep := false
		format := func(name string, n ast.Node) error {
			if name != "" && cfg.Stream {
				// TODO: make this relative to DIR
				fmt.Fprintf(w, "// %s\n", filepath.Base(name))
			} else if useSep {
				fmt.Println("// ---")
			}
			useSep = true

			opts := opts
			if e.autoSimplify {
				opts = append(opts, format.Simplify())
			}

			// Casting an ast.Expr to an ast.File ensures that it always ends
			// with a newline.
			f, err := astToFile(n)
			if err != nil {
				return err
			}

			b, err := format.Node(f, opts...)
			if err != nil {
				return err
			}
			_, err = w.Write(b)
			return err
		}
		e.encValue = func(v cue.Value) error {
			return format("", v.Syntax(synOpts...))
		}
		e.encFile = func(f *ast.File) error { return format(f.Filename, f) }

	case build.JSON, build.JSONL:
		e.concrete = true
		d := json.NewEncoder(w)
		d.SetIndent("", "    ")
		d.SetEscapeHTML(cfg.EscapeHTML)
		e.encValue = func(v cue.Value) error {
			err := d.Encode(v)
			if x, ok := err.(*json.MarshalerError); ok {
				err = x.Err
			}
			return err
		}

	case build.YAML:
		e.concrete = true
		streamed := false
		e.encValue = func(v cue.Value) error {
			if streamed {
				fmt.Fprintln(w, "---")
			}
			streamed = true

			str, err := yaml.Marshal(v)
			if err != nil {
				return err
			}
			_, err = fmt.Fprint(w, str)
			return err
		}

	case build.TextProto:
		// TODO: verify that the schema is given. Otherwise err out.
		e.concrete = true
		e.encValue = func(v cue.Value) error {
			v = v.Unify(cfg.Schema)
			b, err := textproto.NewEncoder().Encode(v)
			if err != nil {
				return err
			}

			_, err = w.Write(b)
			return err
		}

	case build.Text:
		e.concrete = true
		e.encValue = func(v cue.Value) error {
			s, err := v.String()
			if err != nil {
				return err
			}
			_, err = fmt.Fprint(w, s)
			if err != nil {
				return err
			}
			_, err = fmt.Fprintln(w)
			return err
		}

	case build.Binary:
		e.concrete = true
		e.encValue = func(v cue.Value) error {
			b, err := v.Bytes()
			if err != nil {
				return err
			}
			_, err = w.Write(b)
			return err
		}

	default:
		return nil, fmt.Errorf("unsupported encoding %q", f.Encoding)
	}

	return e, nil
}

// makeInstance makes a new instance from a value.
var makeInstance func(value interface{}) (instance interface{})

func writer(f *build.File, cfg *config) (_ io.Writer, close func() error, err error) {
	if cfg.Out != nil {
		return cfg.Out, nil, nil
	}
	path := f.Filename
	if path == "-" {
		if cfg.Stdout == nil {
			return os.Stdout, nil, nil
		}
		return cfg.Stdout, nil, nil
	}
	if !cfg.Force {
		if _, err := os.Stat(path); err == nil {
			return nil, nil, errors.Wrapf(os.ErrExist, token.NoPos, "error writing %q", path)
		}
	}
	// Delay opening the file until we can write it to completion. This will
	// prevent clobbering the file in case of a crash.
	b := &bytes.Buffer{}
	fn := func() error {
		return os.WriteFile(path, b.Bytes(), 0644)
	}
	return b, fn, nil
}

type config struct {
	Mode Mode

	// Out specifies an overwrite destination.
	Out    io.Writer
	Stdin  io.Reader
	Stdout io.Writer

	PkgName string // package name for files to generate

	Force     bool // overwrite existing files
	Strict    bool
	Stream    bool // potentially write more than one document per file
	AllErrors bool

	Schema cue.Value // used for schema-based decoding

	EscapeHTML    bool
	InlineImports bool // expand references to non-core imports
	ProtoPath     []string
	Format        []format.Option
	ParseFile     func(name string, src interface{}) (*ast.File, error)
	Expressions   []ast.Expr
}

func (e *encoder) encodeFile(f *ast.File, interpret func(cue.Value) (*ast.File, error)) error {
	if interpret == nil && e.encFile != nil {
		return e.encFile(f)
	}
	e.autoSimplify = true
	var r cue.Runtime
	inst, err := r.CompileFile(f)
	if err != nil {
		return err
	}
	if interpret != nil {
		return e.Encode(inst.Value())
	}
	v := inst.Value()
	if err := v.Validate(cue.Concrete(e.concrete)); err != nil {
		return err
	}
	return e.encValue(v)
}

func (e *encoder) Encode(v cue.Value) error {
	e.autoSimplify = true
	if err := v.Validate(cue.Concrete(e.concrete)); err != nil {
		return err
	}
	if e.interpret != nil {
		f, err := e.interpret(v)
		if err != nil {
			return err
		}
		return e.encodeFile(f, nil)
	}
	if e.encValue != nil {
		return e.encValue(v)
	}

	f, err := valueToFile(v)
	if err != nil {
		return err
	}
	return e.encFile(f)
}

func valueToFile(v cue.Value) (*ast.File, error) {
	return astToFile(v.Syntax())
}

// astToFile converts an expression to a file.
//
// Adjusts the spacing of x when needed.
func astToFile(n ast.Node) (*ast.File, error) {
	switch x := n.(type) {
	case nil:
		return nil, nil
	case *ast.StructLit:
		return &ast.File{Decls: x.Elts}, nil
	case ast.Expr:
		ast.SetRelPos(x, token.NoSpace)
		return &ast.File{Decls: []ast.Decl{&ast.EmbedDecl{Expr: x}}}, nil
	case *ast.File:
		return x, nil
	default:
		return &ast.File{}, fmt.Errorf("Unsupported node type %T", x)
	}
}

// Mode indicate the base mode of operation and indicates a different set of
// defaults.
type Mode int

const (
	Input Mode = iota // The default
	Export
	Def
	Eval
)

func (m Mode) String() string {
	switch m {
	default:
		return "input"
	case Eval:
		return "eval"
	case Export:
		return "export"
	case Def:
		return "def"
	}
}