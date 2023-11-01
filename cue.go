package main

import (
	"bufio"
	"bytes"
	"encoding/json"
	"fmt"
	"path/filepath"
	"strings"

	"github.com/crossplane-contrib/function-cue/input/v1beta1"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/build"
	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"

	"github.com/crossplane/crossplane-runtime/pkg/fieldpath"
	"github.com/crossplane/function-sdk-go/resource"
	"github.com/ghodss/yaml"

	"k8s.io/apimachinery/pkg/runtime"
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

type compiler struct {
	encoder *encoder
	data    []cueOutputData
	strData []string
	outBuf  *bytes.Buffer
	outFmt  cueOutputFmt
	value   cue.Value
}

// newCompiler creates a new cue compiler based off the input/output formats, tags and expressions
// a cue api config is created and cue Instances are built off of the input template
// the cue instance value is wrapped with the expression if it is passed
// validation on the cue template is also run during this step
func newCompiler(input string, inputFmt cueInputFmt, outputFmt cueOutputFmt, expr *ast.Expr, tags []string) (*compiler, error) {
	loadCfg := &load.Config{
		Stdin:      strings.NewReader(input),
		Dir:        "/",
		ModuleRoot: "/",
		Overlay: map[string]load.Source{
			"/cue.mod/module.cue": load.FromString(`module: "nobu.dev"`),
		},
		Tags: tags,
	}
	builds := load.Instances([]string{string(inputFmt) + ":", "-"}, loadCfg)
	if len(builds) < 1 {
		return &compiler{}, fmt.Errorf("cannot load instances: %s", string(inputFmt))
	} else if err := builds[0].Err; err != nil {
		return &compiler{}, fmt.Errorf("failed to load: %w", err)
	}

	insts := cue.Build(builds)
	if len(insts) < 1 {
		return &compiler{}, fmt.Errorf("cannot build instances: %+v", *builds[0])
	}
	inst := insts[0]
	if err := inst.Err; err != nil {
		return &compiler{}, fmt.Errorf("failed to build: %w", err)
	}
	concrete := true
	switch outputFmt {
	case outputCUE:
		concrete = false
	case outputJSON, outputYAML, outputTXT:
	default:
		return &compiler{}, fmt.Errorf("unsupported output format: %q", outputFmt)
	}

	v := inst.Value()
	if expr != nil {
		v = v.Context().BuildExpr(*expr,
			cue.Scope(v),
			cue.InferBuiltins(true),
		)
	}
	if err := v.Validate(cue.Concrete(concrete)); err != nil {
		return &compiler{}, fmt.Errorf("failed to validate: %w", err)
	}

	f, err := parseFile(string(outputFmt)+":-", exportMode)
	if err != nil {
		var buf bytes.Buffer
		return &compiler{}, fmt.Errorf("failed to parse file from %v: %s", string(outputFmt)+":-", buf.Bytes())
	}
	var outBuf bytes.Buffer
	encConf := &config{
		Out:    &outBuf,
		Stdin:  loadCfg.Stdin,
		Mode:   exportMode,
		Schema: v,
	}
	e, err := newEncoder(f, encConf)
	if err != nil {
		return &compiler{}, fmt.Errorf("failed to build encoder: %w", err)
	}

	return &compiler{
		encoder: e,
		outBuf:  &outBuf,
		outFmt:  outputFmt,
		value:   v,
	}, nil
}

func (c *compiler) Compile() error {
	return c.encoder.Encode(c.value)
}

// String of the compiled cue template
func (c compiler) String() string {
	return c.outBuf.String()
}

// Bytes of the compiled cue template
func (c compiler) Bytes() []byte {
	return c.outBuf.Bytes()
}

type cueOutputData struct {
	// Name is a unique identifier for this entry
	Name string `json:"name"`
	// Base is the managed resource output from the provided cue template
	Base map[string]interface{} `json:"base,required"`
	// ConnectionDetails to propagate to the XR
	ConnectionDetails []connectionDetail `json:"connectionDetails,omitempty"`
	// ReadinessCheck to propagate to the XR
	RedinessChecks []readinessCheck `json:"readinessChecks,omitempty"`
}

// Parse parses the compiled cue template output stored in c.outBuf
// Into an array of map[string]interface{}
// It is necessary to compile into a map[string]interface{} so that it can be applied into
// An unstructured.Unstructured{Object: map[string]interface{}}
func (c *compiler) Parse() ([]cueOutputData, error) {
	var (
		data cueOutputData
	)

	// If the current data set is not empty, return that
	if len(c.data) != 0 {
		return c.data, nil
	}

	// If there is no data, return an empty data list
	if len(c.outBuf.Bytes()) == 0 {
		return c.data, nil
	}

	// Otherwise parse the data
	// If there are no expressions, expect a JSON object
	if c.outFmt == outputJSON {
		if err := json.Unmarshal(c.Bytes(), &data); err != nil {
			return c.data, errors.Wrapf(err, token.NoPos, "failed unmarshalling JSON:\n%s", c.String())
		}
		c.data = append(c.data, data)
	} else {
		// If there are MarshalStream expressions, the output will be 'text'
		// The streamType will determine the document formats
		scanner := bufio.NewScanner(bytes.NewReader(c.Bytes()))
		var (
			document string

			streamType = outputYAML
		)
		for scanner.Scan() {
			line := scanner.Text()
			// Determine the type of document needed ot be parsed
			// document will be "" on initialization of a new yaml or json document
			if document == "" && strings.HasPrefix(line, "{") {
				streamType = outputJSON
			}

			// Check if there are multiple documents
			if streamType == outputYAML {
				if line == "---" {
					// End of document
					if err := yaml.Unmarshal([]byte(document), &data); err != nil {
						return c.data, errors.Wrapf(err, token.NoPos, "failed unmarshalling YAML to JSON:\n%s", document)
					}
					c.data = append(c.data, data)

					// Reset document and data
					document = ""
					data = cueOutputData{}
				} else {
					document += fmt.Sprintln(line)
				}
			} else if streamType == outputJSON {
				// If the line is empty skip it
				if strings.TrimSuffix(line, "\n") == "" {
					continue
				}

				// JSON Documents come out line by line
				if err := json.Unmarshal([]byte(line), &data); err != nil {
					return c.data, errors.Wrapf(err, token.NoPos, "failed unmarshalling JSON:\n%s", line)
				}
				c.data = append(c.data, data)

				document = ""
				data = cueOutputData{}
			} else {
				return c.data, fmt.Errorf("unknown stream type %s", streamType)
			}
		}

		// Check if there is a document left over
		// this is only necessary for yaml documents since they are multiline and sepaarated by ---
		// If the multiline yaml ends with --- the document will get set to "" on sucess
		if document != "" && streamType == outputYAML {
			// End of document
			if err := yaml.Unmarshal([]byte(document), &data); err != nil {
				return c.data, errors.Wrapf(err, token.NoPos, "failed unmarshalling YAML to JSON:\n%s", document)
			}
			c.data = append(c.data, data)
		}
	}
	return c.data, nil
}

// compileOpts informs the compiler weather or not to parse the data into []map[string]interface
// or to only return the output, this is really only used during cue_test.go as fn_test.go covers the parsing
// this allows for cue_tests to output any type of data format, allowing easier test coverage of general
// cue functionality, the supplied tags are injected into the build
type compileOpts struct {
	parseData bool
	tags      []string
}

type compileOutput struct {
	// Data is the parsed output data, excluding configuration expressions
	data   []cueOutputData
	string string
}

// cueCompile starting point for cue compilation
// Compiles a CUE template depending on the CUEInput configuration
// Passed in input and defined by the cueOutputFmt
// Returns both an array of parsed maps of the data and string representations of the data
//
// #connectionDetails is injected into the expressionList in order to allow the user to provider
// connectionDetails per document
// This will probably need to be refactored if more information is passed to the compiler this way
func cueCompile(out cueOutputFmt, input v1beta1.CUEInput, opts compileOpts) (compileOutput, error) {
	var (
		output compileOutput
	)
	// Build list of expressions from input
	exprs, err := buildExprs(input)
	if err != nil {
		return output, fmt.Errorf("failed building expression(s): %w", err)
	}

	// Run compilation per expression
	// Output is appended to outputData
	// Compile string output is added to cmpStr
	// connection details is output to connectionData
	for _, expr := range exprs {
		c, err := newCompiler(input.Export.Value, inputCUE, out, expr, opts.tags)
		if err != nil {
			return output, fmt.Errorf("failed creating cue compiler: %w", err)
		}
		if err = c.Compile(); err != nil {
			return output, fmt.Errorf("failed compiling cue template: %w", err)
		}

		// only attempt to parse data if specified
		if opts.parseData == true {
			data, err := c.Parse()
			if err != nil {
				return output, fmt.Errorf("failed parsing cue output: %w", err)
			}

			output.data = append(output.data, data...)
		}

		// If there are multiple yaml documents, then separate them by ---
		if out == outputTXT || out == outputYAML {
			if output.string == "" {
				output.string += c.String()
			} else {
				output.string += fmt.Sprintf("---\n%s", c.String())
			}
		} else if out == outputJSON || out == outputCUE {
			// Multiple json documents do not need to be separated
			output.string += c.String()
		}
	}

	return output, nil
}

// ParseFile parses a single-argument file specifier, such as when a file is
// passed to a command line argument.
//
// Example:
//
//	cue eval -o yaml:foo.data
func parseFile(s string, mode mode) (*build.File, error) {
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

// buildTags builds the tags to be injected into the cue template
// Values are gathered from the Observed XR
func buildTags(tags []v1beta1.Tag, xr *resource.Composite) ([]string, error) {
	res := make([]string, len(tags))
	for i, t := range tags {
		fromMap, err := runtime.DefaultUnstructuredConverter.ToUnstructured(xr.Resource)
		if err != nil {
			return res, errors.Wrapf(err, token.NoPos, "cannot convert xr %q to unstructured", xr.Resource.GetName())
		}

		in, err := fieldpath.Pave(fromMap).GetValue(t.Path)
		if err != nil {
			return res, errors.Wrapf(err, token.NoPos, "cannot get value from path %q", t.Path)
		}

		res[i] = fmt.Sprintf("%s=%s", t.Name, in)
	}
	return res, nil
}

// buildExprs takes input from the CUEInput and builds cue compatible expressions to be passed to the cue compiler
func buildExprs(input v1beta1.CUEInput) (exprs []*ast.Expr, err error) {
	// #connectionDetails is always added to the end, whether it exists or not
	// RunFunction will take these details and add them to the XR if found
	for _, expr := range input.Export.Options.Expressions {
		if expr != "" {
			var parsed ast.Expr
			parsed, err = parser.ParseExpr("--expression", expr)
			if err != nil {
				err = fmt.Errorf("failed to parse expression: %w", err)
				return
			}
			exprs = append(exprs, &parsed)
		}
	}

	// If there were no expressions built, add a nil default expression to the front
	if len(exprs) == 0 {
		// add a nil expression to the beginning
		exprs = append([]*ast.Expr{nil}, exprs...)
	}

	return
}

// hasEncoding determines if a cue value is concrete or has a default concrete setting
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

func parseType(s string, mode mode) (inst, val cue.Value, err error) {
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
