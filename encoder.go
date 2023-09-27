package main

import (
	"io"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
)

// An Encoder converts CUE to various file formats, including CUE itself.
type Encoder struct {
	cfg          *Config
	close        func() error
	interpret    func(cue.Value) (*ast.File, error)
	encFile      func(*ast.File) error
	encValue     func(cue.Value) error
	autoSimplify bool
	concrete     bool
	instance     *cue.Instance
}

type Config struct {
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