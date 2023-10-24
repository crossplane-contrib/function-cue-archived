package main

import (
	"fmt"
	"testing"

	"github.com/crossplane-contrib/function-cue/input/v1beta1"

	"github.com/stretchr/testify/assert"
)

var testTable = []struct {
	Out         cueOutputFmt
	InVal       string
	OutVal      string
	Expressions []string
	Injects     []string
}{
	{outputCUE, "", "\n", []string{}, []string{}},
	{outputCUE, "a: b: 5\na: c: 4", "a: {\n\tb: 5\n\tc: 4\n}\n", []string{}, []string{}},
	{outputJSON, "test: 5", "{\n    \"test\": 5\n}\n", []string{}, []string{}},
	{outputJSON, "out: 5 + 6", "{\n    \"out\": 11\n}\n", []string{}, []string{}},
	{outputJSON, "out: 18 - 22", "{\n    \"out\": -4\n}\n", []string{}, []string{}},
	{outputJSON, "out: 20 / 4", "{\n    \"out\": 5.0\n}\n", []string{}, []string{}},
	{outputJSON, "out: 3 / 2", "{\n    \"out\": 1.5\n}\n", []string{}, []string{}},
	{outputJSON, "out: 3 div 2", "{\n    \"out\": 1\n}\n", []string{}, []string{}},
	{outputJSON, "out: 3 * \"blah\"", "{\n    \"out\": \"blahblahblah\"\n}\n", []string{}, []string{}},
	{outputJSON, "out: 3 * [1, 2, 3]", "{\n    \"out\": [\n        1,\n        2,\n        3,\n        1,\n        2,\n        3,\n        1,\n        2,\n        3\n    ]\n}\n", []string{}, []string{}},
	{outputJSON, "out: 3 > 8", "{\n    \"out\": false\n}\n", []string{}, []string{}},
	{outputJSON, "x: \"\\(y._y)-bar\"\nlet y = {\n\t_y: \"foo\"\n}\n", "{\n    \"x\": \"foo-bar\"\n}\n", []string{}, []string{}},
	{outputJSON, "q: quo(-5, 2)", "{\n    \"q\": -2\n}\n", []string{}, []string{}},
	{outputJSON, "r: rem(-5, 2)", "{\n    \"r\": -1\n}\n", []string{}, []string{}},
	{outputJSON, "m: mod(-5, 2)", "{\n    \"m\": 1\n}\n", []string{}, []string{}},
	{outputJSON, "#out: \"test\"", "{}\n", []string{}, []string{}},
	{outputJSON, "#test: \"somestring\"\n\nout: \"this-is-concatting-\\(#test)\"\n", "{\n    \"out\": \"this-is-concatting-somestring\"\n}\n", []string{}, []string{}},
	{outputJSON, "val: number @tag(val,type=int)\n", "{\n    \"val\": 3.14\n}\n", []string{}, []string{"val=3.14"}},
	{outputJSON, "env: string @tag(env,short=prod|staging)", "{\n    \"env\": \"prod\"\n}\n", []string{}, []string{"prod"}},
	{outputJSON, "package main\n\nenv:  string | *\"dev\" @tag(env)\nhost: \"\\(env).domain.com\"\n", "{\n    \"env\": \"prod\",\n    \"host\": \"prod.domain.com\"\n}\n", []string{}, []string{"env=prod"}},
	{outputJSON, "package main\n\nenv:  string | *\"dev\" @tag(env)\nhost: \"\\(env).domain.com\"\n", "{\n    \"env\": \"dev\",\n    \"host\": \"dev.domain.com\"\n}\n", []string{}, []string{}},
	{outputJSON, "#A: {\n\tx: int @protobuf(1,int64)\n\ty: int @protobuf(2,int64)\n}\n\na: #A\na: {\n\tx: 1\n\ty: x // propagation here\n}", "{\n    \"a\": {\n        \"x\": 1,\n        \"y\": 1\n    }\n}\n", []string{}, []string{}},
	{outputJSON, "x: 0\n\nresult: [\n\tif x < 0 {\"negative\"},\n\tif x > 0 {\"positive\"},\n\t\"zero\",\n][0]\n", "{\n    \"x\": 0,\n    \"result\": \"zero\"\n}\n", []string{}, []string{}},
	{outputJSON, "[ for x in #items if __rem(x, 2) == 0 {x * x}]\n\n#items: [ 1, 2, 3, 4, 5, 6, 7, 8, 9]\n", "[\n    4,\n    16,\n    36,\n    64\n]\n", []string{}, []string{}},
	{outputJSON, "list: [ \"Cat\", \"Mouse\", \"Dog\" ]\n\na: *list[0] | \"None\"\nb: *list[5] | \"None\"\n\nn: [null]\nv: *(n[0]&string) | \"default\"", "{\n    \"list\": [\n        \"Cat\",\n        \"Mouse\",\n        \"Dog\"\n    ],\n    \"a\": \"Cat\",\n    \"b\": \"None\",\n    \"n\": [\n        null\n    ],\n    \"v\": \"default\"\n}\n", []string{}, []string{}},
	{outputJSON, "import \"strings\"\n\n#a: [ \"Barcelona\", \"Shanghai\", \"Munich\"]\n\nfor k, v in #a {\n\t\"\\( strings.ToLower(v) )\": {\n\t\tpos:     k + 1\n\t\tname:    v\n\t\tnameLen: len(v)\n\t}\n}\n", "{\n    \"barcelona\": {\n        \"pos\": 1,\n        \"name\": \"Barcelona\",\n        \"nameLen\": 9\n    },\n    \"shanghai\": {\n        \"pos\": 2,\n        \"name\": \"Shanghai\",\n        \"nameLen\": 8\n    },\n    \"munich\": {\n        \"pos\": 3,\n        \"name\": \"Munich\",\n        \"nameLen\": 6\n    }\n}\n", []string{}, []string{}},
	{outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Abs(-100)\n", "{\n    \"out\": 100\n}\n", []string{}, []string{}},
	{outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Dim(-100.01, 59)\n", "{\n    \"out\": 0\n}\n", []string{}, []string{}},
	{outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Dim(50, 45)\n", "{\n    \"out\": 5\n}\n", []string{}, []string{}},
	{outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Floor(3.14)\n", "{\n    \"out\": 3\n}\n", []string{}, []string{}},
	{outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Log(100.2)\n", "{\n    \"out\": 4.607168188650764424054236680441117\n}\n", []string{}, []string{}},
	{outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Tan(1.0)\n", "{\n    \"out\": 1.557407724654902\n}\n", []string{}, []string{}},
	{outputJSON, "#elem: {\n\tkey: string\n\tval: _\n}\n\nelems: [...#elem] & [\n\t{key: \"a\", val: 1},\n\t{key: \"b\", val: 1},\n\t{key: \"b\", val: 1},\n]\n\nset: [string]: #elem\nset: {\n\tfor e in elems {\n\t\t\"\\(e.key)\": e\n\t}\n}\n\nuniq: [ for s in set {s}]\n",
		"{\n    \"elems\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ],\n    \"set\": {\n        \"a\": {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        \"b\": {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    },\n    \"uniq\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ]\n}\n", []string{}, []string{}},
	{outputYAML, "import \"strconv\"\n\n#portI: uint16 & >1024\n\n#portS: S={\n\tstring & =~\"^[0-9]{4,5}$\"\n\t_i:     strconv.Atoi(S)\n\t#valid: uint16 & >1024 & _i\n}\n\n#port: #portI | #portS\n\npi: #port\npi: 8080\n\nps: #portS\nps: \"1313\"\n", "pi: 8080\nps: \"1313\"\n", []string{}, []string{}},
	{outputJSON, "import \"list\"\n\n#elem: {\n\tkey: string\n\tval: _\n}\n\nelems: [...#elem] & [\n\t{key: \"a\", val: 1},\n\t{key: \"b\", val: 1},\n\t{key: \"a\", val: 2},\n\t{key: \"b\", val: 1},\n]\n\nuniq: [ for i, x in elems if !list.Contains(list.Drop(elems, i+1), x) {x}]\n", "{\n    \"elems\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"a\",\n            \"val\": 2\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ],\n    \"uniq\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"a\",\n            \"val\": 2\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ]\n}\n", []string{}, []string{}},
	{outputYAML, "import \"strings\"\n\n#compare: {\n\ta: string\n\tb: string\n\tl: [\n\t\tif strings.HasPrefix(b, a) {\"prefix\"},\n\t\tif a == b {\"same\"},\n\t\t\"none\",\n\t]\n\tresult: l[0]\n}\n\nex1: (#compare & {a: \"a\", b:   \"abc\"})\nex2: (#compare & {a: \"abc\", b: \"abc\"})\n", "ex1:\n  a: a\n  b: abc\n  l:\n    - prefix\n    - none\n  result: prefix\nex2:\n  a: abc\n  b: abc\n  l:\n    - prefix\n    - same\n    - none\n  result: prefix\n", []string{}, []string{}},
	{outputYAML, "\nimport \"strconv\"\n\n#portI: uint16 & >1024\n\n#portS: S={\n\tstring & =~\"^[0-9]{4,5}$\"\n\t_i:     strconv.Atoi(S)\n\t#valid: uint16 & >1024 & _i\n}\n\n#port: #portI | #portS\n\npi: #port\npi: 8080\n\nps: #portS\nps: \"1313\"\n", "pi: 8080\nps: \"1313\"\n", []string{}, []string{}},
	{outputYAML, "package function\n\nimport \"strings\"\n\n// An input schema\n#Input: {\n\tcount: int\n\tmsg:   string\n}\n\n// An output schema\n#Output: {\n\tval: string\n}\n\n#Transform: {\n\t// Input for the caller\n\tX1=\"in\": #Input\n\t// output for the caller\n\tout: #Output\n\n\t// intermediate fields\n\t_upper: strings.ToUpper(X1.msg)\n\t_msg:   strings.Join([_upper]*X1.count, \" \")\n\n\t// set output\n\tout: val: _msg\n}\n\n// Call transform\nresult: #Transform & {in: {msg: \"ra\", count: 3}}\n", "result:\n  in:\n    count: 3\n    msg: ra\n  out:\n    val: RA RA RA\n", []string{}, []string{}},
	{outputYAML, "a: {\n\tp?: int\n}\n\n// if b is concrete, add config\nif a.b != _|_ {\n\tb: \"found\"\n}\n\n// you can also check optional fields\nif a.p != _|_ {\n\tp: a.p & >1024\n}\n\n// if c is not concrete, add config\nif a.c == _|_ {\n\tc: \"missing\"\n}\n\n// use preference marks (defaults) for that instead\na: {\n\td: _ | *\"default\"\n}\n", "c: missing\na:\n  d: default\n", []string{}, []string{}},
	{outputYAML, "test: \"20h\"\n", "true\n", []string{"time.Duration(test)"}, []string{}},
	{outputYAML, "package inject\n\n// @tag() is how we inject data\nenv:      *\"dev\" | string @tag(env)      // env has a default\ndatabase: string          @tag(database) // database is \"required\"\n\n// A schema for DBs with some defaults\n#DB: {\n\thost: #hosts[env]\n\tport: string | *\"5432\"\n\tdb:   database\n\n\t// interpolate the fields into the connection string\n\tconn: \"postgres://\\(host):\\(port)/\\(db)\"\n}\n\n// setup our database host mapping\n#hosts: [string]: string\n#hosts: {\n\tdev: \"postgres.dev\"\n\tstg: \"postgres.stg\"\n\tprd: \"postgres.prd\"\n}\n", "env: dev\ndatabase: foo\n", []string{}, []string{"database=foo"}},
	{outputYAML, "old: [...{min: int, max: int}]\nold: [{'min': 3, 'max': 12}, {'min': 7, 'max': 144}]\nnew: [ for e in old {min: e.min}]\n", "- min: 3\n- min: 7\n", []string{"new"}, []string{}},
}

// TestCUECompile for str output, do not attempt to parse data in these tests
// This allows for more simple cue compilation tests without needing to produce output that parses into map[string]interface{}
func TestCUECompile(t *testing.T) {
	for _, tv := range testTable {
		desc := fmt.Sprintf("CUECompile(%q, %q)", tv.Out, tv.InVal)
		in := v1beta1.CUEInput{
			Export: v1beta1.Export{
				Options: v1beta1.ExportOptions{
					Expressions: tv.Expressions,
				},
				Value: tv.InVal,
			},
		}
		out, err := cueCompile(tv.Out, in, compileOpts{
			parseData: false,
			tags:      tv.Injects,
		})
		assert.Nil(t, err, "%s: received unexpected error", desc)
		assert.Equal(t, tv.OutVal, out.string, "%s: expected output %q: got %q", desc, tv.OutVal, out)
	}
}

var testFailTable = []struct {
	Out         cueOutputFmt
	InVal       string
	Err         string
	Expressions []string
}{
	{outputCUE, "#Test: {\n\tName: string\n}\n\nitem: #Test & {\n\tName: 1\n}\n", "failed creating cue compiler: failed to validate: item.Name: conflicting values string and 1 (mismatched types string and int)", []string{}},
	{outputCUE, "import (\n\t\"noname\"\n)\n", "failed creating cue compiler: failed to build: builtin package \"noname\" undefined", []string{}},
	{outputJSON, "#out: test", "failed creating cue compiler: failed to build: reference \"test\" not found", []string{}},
	{outputJSON, "price: number\n\n// Require a justification if price is too high\nif price > 100 {\n\tjustification: string\n}\n\nprice: 200\n", "failed creating cue compiler: failed to validate: justification: incomplete value string", []string{}},
	{outputJSON, "a: \"foo bar\" =~ \"foo [a-z]{3}\"\nb: \"maze\" !~ \"^[a-z]{3}$\"\n\nc: =~\"^[a-z]{3}$\" // any string with lowercase ASCII of length 3\n\nd: c\nd: \"foo\"\n\ne: c\ne: \"foo bar\"\n", "failed creating cue compiler: failed to validate: e: invalid value \"foo bar\" (out of bound =~\"^[a-z]{3}$\")", []string{}},
	{outputJSON, "list: [ \"Cat\", \"Mouse\", \"Dog\"\n", "failed creating cue compiler: failed to load: missing ',' before newline in list literal", []string{}},
	{outputJSON, "list: {\n\ttest: \"things\"\n\tare: \"notok\"\n", "failed creating cue compiler: failed to load: expected '}', found 'EOF'", []string{}},
	{outputJSON, "X: [1, 2, 4]\n\n#X: {\n\tfor x in X {\n\t\t\"\\(x)\": x\n\t}\n}\n\n#MustHave: [3]\n\n#Xcheck: #X & {for x in #MustHave {\"\\(x)\": x}}\n", "failed creating cue compiler: failed to validate: #Xcheck.\"3\": field not allowed", []string{}},
	{outputJSON, "x: 0\n\nresult: [\n\tif x < 0 {\"negative\"},\n\tif x > 0 {\"positive\"},\n][0]\n", "failed creating cue compiler: failed to validate: result: index out of range [0] with length 0", []string{}},
	{outputJSON, "l: []\n\nresult: [\n\tif len(l) == 0 {\"empty\"},\n\tif l[0] {\"starts with true\"},\n][0]\n", "failed creating cue compiler: failed to validate: index out of range [0] with length 0 (and 1 more errors)", []string{}},
	{outputJSON, "test: lower: level: \"output\"\n", "failed creating cue compiler: failed to validate: reference \"lower\" not found", []string{"lower"}},
	{outputJSON, "package inject\n\n// @tag() is how we inject data\nenv:      *\"dev\" | string @tag(env)      // env has a default\ndatabase: string          @tag(database) // database is \"required\"\n\n// A schema for DBs with some defaults\n#DB: {\n\thost: #hosts[env]\n\tport: string | *\"5432\"\n\tdb:   database\n\n\t// interpolate the fields into the connection string\n\tconn: \"postgres://\\(host):\\(port)/\\(db)\"\n}\n\n// setup our database host mapping\n#hosts: [string]: string\n#hosts: {\n\tdev: \"postgres.dev\"\n\tstg: \"postgres.stg\"\n\tprd: \"postgres.prd\"\n}\n", "failed creating cue compiler: failed to validate: database: incomplete value string", []string{}},
	{outputJSON, "val: number @tag(val,type=int)\n", "failed creating cue compiler: failed to validate: val: incomplete value number", []string{}},
	{outputJSON, "env: string @tag(env,short=prod|staging)", "failed creating cue compiler: failed to validate: env: incomplete value string", []string{}},
	{outputJSON, "x: \"\\(_y)-bar\"\n{\n\t_y: \"foo\"\n}\n", "failed creating cue compiler: failed to build: reference \"_y\" not found", []string{}},
}

// TestCUECompileFailures for failure strings, do not attempt to parse data in these tests
// This allows for more simple cue compilation tests without needing to produce output that parses into map[string]interface{}
func TestCUECompileFailures(t *testing.T) {
	for _, tv := range testFailTable {
		desc := fmt.Sprintf("CueCompile(%q, %q)", tv.Out, tv.InVal)
		in := v1beta1.CUEInput{
			Export: v1beta1.Export{
				Options: v1beta1.ExportOptions{
					Expressions: tv.Expressions,
				},
				Value: tv.InVal,
			},
		}
		out, err := cueCompile(tv.Out, in, compileOpts{parseData: false})
		assert.NotNil(t, err, "%s: expected error, but did not receive one, output was %s", desc, out.string)
		assert.Equal(t, tv.Err, err.Error(), "%s: expected error %q: got %q", desc, tv.Err, err.Error())
	}
}
