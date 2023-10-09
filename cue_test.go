package main

import (
	"fmt"
	"testing"
)

var testTable = []struct {
	In     cueInputFmt
	Fn     cueFunction
	Out    cueOutputFmt
	InVal  string
	OutVal string
	Err    string
}{
	{inputCUE, functionExport, outputCUE, "", "\n", ""},
	{inputCUE, functionExport, outputCUE, "a: b: 5\na: c: 4", "a: {\n\tb: 5\n\tc: 4\n}\n", ""},
	{inputCUE, functionExport, outputJSON, "test: 5", "{\n    \"test\": 5\n}\n", ""},
	{inputCUE, functionExport, outputJSON, "#elem: {\n\tkey: string\n\tval: _\n}\n\nelems: [...#elem] & [\n\t{key: \"a\", val: 1},\n\t{key: \"b\", val: 1},\n\t{key: \"b\", val: 1},\n]\n\nset: [string]: #elem\nset: {\n\tfor e in elems {\n\t\t\"\\(e.key)\": e\n\t}\n}\n\nuniq: [ for s in set {s}]\n",
		"{\n    \"elems\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ],\n    \"set\": {\n        \"a\": {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        \"b\": {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    },\n    \"uniq\": [\n        {\n            \"key\": \"a\",\n            \"val\": 1\n        },\n        {\n            \"key\": \"b\",\n            \"val\": 1\n        }\n    ]\n}\n", ""},
	{inputCUE, functionExport, outputYaml, "import \"strconv\"\n\n#portI: uint16 & >1024\n\n#portS: S={\n\tstring & =~\"^[0-9]{4,5}$\"\n\t_i:     strconv.Atoi(S)\n\t#valid: uint16 & >1024 & _i\n}\n\n#port: #portI | #portS\n\npi: #port\npi: 8080\n\nps: #portS\nps: \"1313\"\n", "pi: 8080\nps: \"1313\"\n", ""},
}

func TestHandleCUECompile(t *testing.T) {
	for _, tv := range testTable {
		desc := fmt.Sprintf("handleCUECompile(%q, %q, %q, %q)", tv.In, tv.Fn, tv.Out, tv.InVal)
		out, err := cueCompile(tv.In, tv.Fn, tv.Out, tv.InVal)
		if tv.Err != "" {
			if err != nil {
				if err.Error() != tv.Err {
					t.Fatalf("%v: expected error string %q; got %q", desc, tv.Err, err)
				}
			} else {
				t.Fatalf("%v: expected error, did not see one. Output was %q", desc, out)
			}
		} else {
			if err != nil {
				t.Fatalf("%v: got unexpected error: %v", desc, err)
			} else if out != tv.OutVal {
				t.Fatalf("%v: expected output %q: got %q", desc, tv.OutVal, out)
			}
		}
	}
}
