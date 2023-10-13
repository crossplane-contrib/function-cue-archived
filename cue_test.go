package main

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
)

var testTable = []struct {
	In     cueInputFmt
	Fn     cueFunction
	Out    cueOutputFmt
	InVal  string
	OutVal string
}{
	{inputCUE, functionExport, outputCUE, "", "\n"},
	{inputCUE, functionExport, outputCUE, "a: b: 5\na: c: 4", "a: {\n\tb: 5\n\tc: 4\n}\n"},
	{inputCUE, functionExport, outputJSON, "test: 5", "{\n    \"test\": 5\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 5 + 6", "{\n    \"out\": 11\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 18 - 22", "{\n    \"out\": -4\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 20 / 4", "{\n    \"out\": 5.0\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 3 / 2", "{\n    \"out\": 1.5\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 3 div 2", "{\n    \"out\": 1\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 3 * \"blah\"", "{\n    \"out\": \"blahblahblah\"\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 3 * [1, 2, 3]", "{\n    \"out\": [\n        1,\n        2,\n        3,\n        1,\n        2,\n        3,\n        1,\n        2,\n        3\n    ]\n}\n"},
	{inputCUE, functionExport, outputJSON, "out: 3 > 8", "{\n    \"out\": false\n}\n"},
	{inputCUE, functionExport, outputJSON, "#out: \"test\"", "{}\n"},
	{inputCUE, functionExport, outputJSON, "x: 0\n\nresult: [\n\tif x < 0 {\"negative\"},\n\tif x > 0 {\"positive\"},\n\t\"zero\",\n][0]\n", "{\n    \"x\": 0,\n    \"result\": \"zero\"\n}\n"},
	{inputCUE, functionExport, outputJSON, "[ for x in #items if __rem(x, 2) == 0 {x * x}]\n\n#items: [ 1, 2, 3, 4, 5, 6, 7, 8, 9]\n", "[\n    4,\n    16,\n    36,\n    64\n]\n"},
	{inputCUE, functionExport, outputJSON, "list: [ \"Cat\", \"Mouse\", \"Dog\" ]\n\na: *list[0] | \"None\"\nb: *list[5] | \"None\"\n\nn: [null]\nv: *(n[0]&string) | \"default\"", "{\n    \"list\": [\n        \"Cat\",\n        \"Mouse\",\n        \"Dog\"\n    ],\n    \"a\": \"Cat\",\n    \"b\": \"None\",\n    \"n\": [\n        null\n    ],\n    \"v\": \"default\"\n}\n"},
	{inputCUE, functionExport, outputJSON, "import \"strings\"\n\n#a: [ \"Barcelona\", \"Shanghai\", \"Munich\"]\n\nfor k, v in #a {\n\t\"\\( strings.ToLower(v) )\": {\n\t\tpos:     k + 1\n\t\tname:    v\n\t\tnameLen: len(v)\n\t}\n}\n", "{\n    \"barcelona\": {\n        \"pos\": 1,\n        \"name\": \"Barcelona\",\n        \"nameLen\": 9\n    },\n    \"shanghai\": {\n        \"pos\": 2,\n        \"name\": \"Shanghai\",\n        \"nameLen\": 8\n    },\n    \"munich\": {\n        \"pos\": 3,\n        \"name\": \"Munich\",\n        \"nameLen\": 6\n    }\n}\n"},
	{inputCUE, functionExport, outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Abs(-100)\n", "{\n    \"out\": 100\n}\n"},
	{inputCUE, functionExport, outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Dim(-100.01, 59)\n", "{\n    \"out\": 0\n}\n"},
	{inputCUE, functionExport, outputJSON, "import (\n\t\"math\"\n)\n\nout: math.Dim(50, 45)\n", "{\n    \"out\": 5\n}\n"},
	{inputCUE, functionExport, outputJSON, "#elem: {\n\tkey: string\n\tval: _\n}\n\nelems: [...#elem] & [\n\t{key: \"a\", val: 1},\n\t{key: \"b\", val: 1},\n\t{key: \"b\", val: 1},\n]\n\nset: [string]: #elem\nset: {\n\tfor e in elems {\n\t\t\"\\(e.key)\": e\n\t}\n}\n\nuniq: [ for s in set {s}]\n",
		"{\n    \"elems\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ],\n    \"set\": {\n        \"a\": {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        \"b\": {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    },\n    \"uniq\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ]\n}\n"},
	{inputCUE, functionExport, outputYAML, "import \"strconv\"\n\n#portI: uint16 & >1024\n\n#portS: S={\n\tstring & =~\"^[0-9]{4,5}$\"\n\t_i:     strconv.Atoi(S)\n\t#valid: uint16 & >1024 & _i\n}\n\n#port: #portI | #portS\n\npi: #port\npi: 8080\n\nps: #portS\nps: \"1313\"\n", "pi: 8080\nps: \"1313\"\n"},
	{inputCUE, functionExport, outputJSON, "import \"list\"\n\n#elem: {\n\tkey: string\n\tval: _\n}\n\nelems: [...#elem] & [\n\t{key: \"a\", val: 1},\n\t{key: \"b\", val: 1},\n\t{key: \"a\", val: 2},\n\t{key: \"b\", val: 1},\n]\n\nuniq: [ for i, x in elems if !list.Contains(list.Drop(elems, i+1), x) {x}]\n", "{\n    \"elems\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"a\",\n            \"val\": 2\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ],\n    \"uniq\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"a\",\n            \"val\": 2\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ]\n}\n"},
	{inputCUE, functionExport, outputYAML, "import \"strings\"\n\n#compare: {\n\ta: string\n\tb: string\n\tl: [\n\t\tif strings.HasPrefix(b, a) {\"prefix\"},\n\t\tif a == b {\"same\"},\n\t\t\"none\",\n\t]\n\tresult: l[0]\n}\n\nex1: (#compare & {a: \"a\", b:   \"abc\"})\nex2: (#compare & {a: \"abc\", b: \"abc\"})\n", "ex1:\n  a: a\n  b: abc\n  l:\n    - prefix\n    - none\n  result: prefix\nex2:\n  a: abc\n  b: abc\n  l:\n    - prefix\n    - same\n    - none\n  result: prefix\n"},
	{inputCUE, functionExport, outputYAML, "\nimport \"strconv\"\n\n#portI: uint16 & >1024\n\n#portS: S={\n\tstring & =~\"^[0-9]{4,5}$\"\n\t_i:     strconv.Atoi(S)\n\t#valid: uint16 & >1024 & _i\n}\n\n#port: #portI | #portS\n\npi: #port\npi: 8080\n\nps: #portS\nps: \"1313\"\n", "pi: 8080\nps: \"1313\"\n"},
	{inputCUE, functionExport, outputYAML, "package function\n\nimport \"strings\"\n\n// An input schema\n#Input: {\n\tcount: int\n\tmsg:   string\n}\n\n// An output schema\n#Output: {\n\tval: string\n}\n\n#Transform: {\n\t// Input for the caller\n\tX1=\"in\": #Input\n\t// output for the caller\n\tout: #Output\n\n\t// intermediate fields\n\t_upper: strings.ToUpper(X1.msg)\n\t_msg:   strings.Join([_upper]*X1.count, \" \")\n\n\t// set output\n\tout: val: _msg\n}\n\n// Call transform\nresult: #Transform & {in: {msg: \"ra\", count: 3}}\n", "result:\n  in:\n    count: 3\n    msg: ra\n  out:\n    val: RA RA RA\n"},
	{inputCUE, functionExport, outputYAML, "a: {\n\tp?: int\n}\n\n// if b is concrete, add config\nif a.b != _|_ {\n\tb: \"found\"\n}\n\n// you can also check optional fields\nif a.p != _|_ {\n\tp: a.p & >1024\n}\n\n// if c is not concrete, add config\nif a.c == _|_ {\n\tc: \"missing\"\n}\n\n// use preference marks (defaults) for that instead\na: {\n\td: _ | *\"default\"\n}\n", "c: missing\na:\n  d: default\n"},
}

func TestCUECompile(t *testing.T) {
	for _, tv := range testTable {
		desc := fmt.Sprintf("CUECompile(%q, %q, %q, %q)", tv.In, tv.Fn, tv.Out, tv.InVal)
		out, err := cueCompile(tv.In, tv.Fn, tv.Out, tv.InVal)
		assert.Nil(t, err, "%s: received unexpected error", desc)
		assert.Equal(t, tv.OutVal, out, "%s: expected output %q: got %q", desc, tv.OutVal, out)
	}
}

var testFailTable = []struct {
	In    cueInputFmt
	Fn    cueFunction
	Out   cueOutputFmt
	InVal string
	Err   string
}{
	{inputCUE, functionExport, outputCUE, "#Test: {\n\tName: string\n}\n\nitem: #Test & {\n\tName: 1\n}\n", "failed to validate: item.Name: conflicting values string and 1 (mismatched types string and int)"},
	{inputCUE, functionExport, outputCUE, "import (\n\t\"noname\"\n)\n", "failed to build: builtin package \"noname\" undefined"},
	{inputCUE, functionExport, outputJSON, "#out: test", "failed to build: reference \"test\" not found"},
	{inputCUE, functionExport, outputJSON, "price: number\n\n// Require a justification if price is too high\nif price > 100 {\n\tjustification: string\n}\n\nprice: 200\n", "failed to validate: justification: incomplete value string"},
	{inputCUE, functionExport, outputJSON, "a: \"foo bar\" =~ \"foo [a-z]{3}\"\nb: \"maze\" !~ \"^[a-z]{3}$\"\n\nc: =~\"^[a-z]{3}$\" // any string with lowercase ASCII of length 3\n\nd: c\nd: \"foo\"\n\ne: c\ne: \"foo bar\"\n", "failed to validate: e: invalid value \"foo bar\" (out of bound =~\"^[a-z]{3}$\")"},
	{inputCUE, functionExport, outputJSON, "list: [ \"Cat\", \"Mouse\", \"Dog\"\n", "failed to load: missing ',' before newline in list literal"},
	{inputCUE, functionExport, outputJSON, "list: {\n\ttest: \"things\"\n\tare: \"notok\"\n", "failed to load: expected '}', found 'EOF'"},
	{inputCUE, functionExport, outputJSON, "X: [1, 2, 4]\n\n#X: {\n\tfor x in X {\n\t\t\"\\(x)\": x\n\t}\n}\n\n#MustHave: [3]\n\n#Xcheck: #X & {for x in #MustHave {\"\\(x)\": x}}\n", "failed to validate: #Xcheck.\"3\": field not allowed"},
	{inputCUE, functionExport, outputJSON, "x: 0\n\nresult: [\n\tif x < 0 {\"negative\"},\n\tif x > 0 {\"positive\"},\n][0]\n", "failed to validate: result: index out of range [0] with length 0"},
	{inputCUE, functionExport, outputJSON, "l: []\n\nresult: [\n\tif len(l) == 0 {\"empty\"},\n\tif l[0] {\"starts with true\"},\n][0]\n", "failed to validate: index out of range [0] with length 0 (and 1 more errors)"},
}

func TestCUECompileFailures(t *testing.T) {
	for _, tv := range testFailTable {
		desc := fmt.Sprintf("CueCompile(%q, %q, %q, %q)", tv.In, tv.Fn, tv.Out, tv.InVal)
		out, err := cueCompile(tv.In, tv.Fn, tv.Out, tv.InVal)
		assert.NotNil(t, err, "%s: expected error, but did not receive one, output was %s", desc, out)
		assert.Equal(t, tv.Err, err.Error(), "%s: expected error %q: got %q", desc, tv.Err, err.Error())
	}
}