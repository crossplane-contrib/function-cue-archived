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
	{inputCUE, functionExport, outputJSON, "#elem: {\n\tkey: string\n\tval: _\n}\n\nelems: [...#elem] & [\n\t{key: \"a\", val: 1},\n\t{key: \"b\", val: 1},\n\t{key: \"b\", val: 1},\n]\n\nset: [string]: #elem\nset: {\n\tfor e in elems {\n\t\t\"\\(e.key)\": e\n\t}\n}\n\nuniq: [ for s in set {s}]\n",
		"{\n    \"elems\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ],\n    \"set\": {\n        \"a\": {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        \"b\": {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    },\n    \"uniq\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ]\n}\n"},
	{inputCUE, functionExport, outputYAML, "import \"strconv\"\n\n#portI: uint16 & >1024\n\n#portS: S={\n\tstring & =~\"^[0-9]{4,5}$\"\n\t_i:     strconv.Atoi(S)\n\t#valid: uint16 & >1024 & _i\n}\n\n#port: #portI | #portS\n\npi: #port\npi: 8080\n\nps: #portS\nps: \"1313\"\n", "pi: 8080\nps: \"1313\"\n"},
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
	{inputCUE, functionExport, outputCUE, "#Test: {\n\tName: string\n}\n\nitem: #Test & {\n\tName: 1\n}\n", "item.Name: conflicting values string and 1 (mismatched types string and int)"},
	{inputCUE, functionExport, outputCUE, "import (\n\t\"noname\"\n)\n", "failed to build: builtin package \"noname\" undefined"},
}

func TestCUECompileFailures(t *testing.T) {
	for _, tv := range testFailTable {
		desc := fmt.Sprintf("CueCompile(%q, %q, %q, %q)", tv.In, tv.Fn, tv.Out, tv.InVal)
		out, err := cueCompile(tv.In, tv.Fn, tv.Out, tv.InVal)
		assert.NotNil(t, err, "%s: expected error, but did not receive one, output was %s", desc, out)
		assert.Equal(t, tv.Err, err.Error(), "%s: expected error %q: got %q", desc, tv.Err, err.Error())
	}
}
