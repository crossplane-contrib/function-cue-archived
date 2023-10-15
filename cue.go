package main

import (
	"bytes"
	"fmt"
	"path/filepath"
	"strings"

	"github.com/Mitsuwa/function-cue/input/v1beta1"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/build"
	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"
)

type cueFunction string

const (
	functionExport cueFunction = "export"
	functionDef    cueFunction = "def"
)

type cueInputFmt string

const (
	inputCUE  cueInputFmt = "cue"
	inputJSON cueInputFmt = "json"
	inputYAML cueInputFmt = "yaml"
	inputTXT  cueInputFmt = "text"
)

type cueOutputFmt string

const (
	outputCUE  cueOutputFmt = cueOutputFmt(inputCUE)
	outputJSON cueOutputFmt = cueOutputFmt(inputJSON)
	outputYAML cueOutputFmt = cueOutputFmt(inputYAML)
	outputTXT  cueOutputFmt = cueOutputFmt(inputTXT)
)

// cueCompile compiles a CUE template depending on the configuration
// Passed in input and defined by the cueOutputFmt, cueFunction and cueInputFmt
func cueCompile(in cueInputFmt, fn cueFunction, out cueOutputFmt, input v1beta1.CUEInput) (string, error) {
	exprs, err := buildExpr(input)
	if err != nil {
		return "", fmt.Errorf("failed to build expressions: %w", err)
	}

	loadCfg := &load.Config{
		Stdin:      strings.NewReader(input.Export.Value),
		Dir:        "/",
		ModuleRoot: "/",
		Overlay: map[string]load.Source{
			"/cue.mod/module.cue": load.FromString(`module: "nobu.dev"`),
		},
	}
	builds := load.Instances([]string{string(in) + ":", "-"}, loadCfg)
	if len(builds) < 1 {
		return "", fmt.Errorf("cannot load instances: %s", string(in))
	} else if err = builds[0].Err; err != nil {
		return "", fmt.Errorf("failed to load: %w", err)
	}

	insts := cue.Build(builds)
	if len(insts) < 1 {
		return "", fmt.Errorf("cannot build instances: %+v", *builds[0])
	}
	inst := insts[0]
	if err := inst.Err; err != nil {
		return "", fmt.Errorf("failed to build: %w", err)
	}
	concrete := true
	switch out {
	case outputCUE:
		concrete = false
	case outputJSON, outputYAML, outputTXT:
	default:
		return "", fmt.Errorf("unsupported output format %q", out)
	}
	v := exprVal(inst.Value(), exprs)
	if err := v.Validate(cue.Concrete(concrete)); err != nil {
		return "", fmt.Errorf("failed to validate: %w", err)
	}

	f, err := parseFile(string(out)+":-", Export)
	if err != nil {
		var buf bytes.Buffer
		return "", fmt.Errorf("failed to parse file from %v: %s", string(out)+":-", buf.Bytes())
	}
	var outBuf bytes.Buffer
	encConf := &Config{
		Out:    &outBuf,
		Stdin:  loadCfg.Stdin,
		Mode:   Export,
		Schema: v,
	}
	e, err := NewEncoder(f, encConf)
	if err != nil {
		return "", fmt.Errorf("failed to build encoder: %w", err)
	}

	if err := e.Encode(v); err != nil {
		return "", fmt.Errorf("failed to encode: %w", err)
	}
	return outBuf.String(), nil
}

// ParseFile parses a single-argument file specifier, such as when a file is
// passed to a command line argument.
//
// Example:
//
//	cue eval -o yaml:foo.data
func parseFile(s string, mode Mode) (*build.File, error) {
	scope := ""
	file := s

	if p := strings.LastIndexByte(s, ':'); p >= 0 {
		scope = s[:p]
		file = s[p+1:]
		if scope == "" {
			return nil, errors.Newf(token.NoPos, "unsupported file name %q: may not have ':", s)
		}
	}

	if file == "" {
		return nil, errors.Newf(token.NoPos, "empty file name in %q", s)
	}

	inst, val, err := parseType(scope, mode)
	if err != nil {
		return nil, err
	}
	return toFile(inst, val, file)
}

func toFile(i, v cue.Value, filename string) (*build.File, error) {
	v = v.Fill(filename, "filename")

	if concrete, hasDefault := hasEncoding(v); !concrete {
		if filename == "-" {
			if !hasDefault {
				v = v.Unify(i.LookupDef("Default"))
			}
		} else if ext := fileExt(filename); ext != "" {
			if x := i.Lookup("extensions", ext); x.Exists() || !hasDefault {
				v = v.Unify(x)
				if err := v.Err(); err != nil {
					return nil, errors.Newf(token.NoPos,
						"unknown file extension %s", ext)
				}
			}
		} else if !hasDefault {
			return nil, errors.Newf(token.NoPos,
				"no encoding specified for file %q", filename)
		}
	}

	f := &build.File{}
	if err := v.Decode(&f); err != nil {
		return nil, errors.Wrapf(err, token.NoPos,
			"could not determine file type")
	}
	return f, nil
}

func buildExpr(input v1beta1.CUEInput) (exprs []ast.Expr, err error) {
	for _, expr := range input.Export.Options.Expressions {
		if expr != "" {
			var parsed ast.Expr
			parsed, err = parser.ParseExpr("--expression", expr)
			if err != nil {
				err = fmt.Errorf("failed to parse expression: %w", err)
				return
			}
			exprs = append(exprs, parsed)
		}
	}
	return
}

func hasEncoding(v cue.Value) (concrete, hasDefault bool) {
	enc := v.Lookup("encoding")
	d, _ := enc.Default()
	return enc.IsConcrete(), d.IsConcrete()
}

// fileExt is like filepath.Ext except we don't treat file names starting with "." as having an extension
// unless there's also another . in the name.
func fileExt(f string) string {
	e := filepath.Ext(f)
	if e == "" || e == filepath.Base(f) {
		return ""
	}
	return e
}

func parseType(s string, mode Mode) (inst, val cue.Value, err error) {
	i := cuegenValue
	i = i.Unify(i.Lookup("modes", mode.String()))
	v := i.LookupDef("File")

	if s != "" {
		for _, t := range strings.Split(s, "+") {
			if p := strings.IndexByte(t, '='); p >= 0 {
				v = v.Fill(t[p+1:], "tags", t[:p])
			} else {
				info := i.Lookup("tags", t)
				if !info.Exists() {
					return inst, val, errors.Newf(token.NoPos,
						"unknown filetype %s", t)
				}
				v = v.Unify(info)
			}
		}
	}

	return i, v, nil
}

func update(errs errors.Error, v, i cue.Value, field, value string) (cue.Value, errors.Error) {
	v = v.Unify(i.Lookup(field, value))
	if err := v.Err(); err != nil {
		errs = errors.Append(errs,
			errors.Newf(token.NoPos, "unknown %s %s", field, value))
	}
	return v, errs
}