// Package v1beta1 contains the input type for this Function
// +kubebuilder:object:generate=true
// +groupName=cue.fn.crossplane.io
// +versionName=v1beta1
package v1beta1

import (
	"fmt"

	"cuelang.org/go/cue/errors"

	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
)

// CUEInput can be used to provide input to this Function.
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
// +kubebuilder:resource:categories=crossplane
type CUEInput struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	// Export is the input data for the cue export command
	Export Export `json:"export,required"`
}

func (in CUEInput) Validate() error {
	if in.Export.Value == "" {
		return errors.New("value cannot be empty")
	}

	allowedTarget := false
	for _, target := range []Target{PatchDesired, PatchResources, Resources, XR} {
		if target == in.Export.Target {
			allowedTarget = true
			break
		}
	}
	if !allowedTarget {
		return fmt.Errorf("invalid target %s", in.Export.Target)
	}

	return nil
}

type Target string

const (
	// PatchDesired targets existing Resources on the Desired XR
	PatchDesired Target = "PatchDesired"
	// PatchResources targets existing CUEInput.Export.Resources
	// These resources are then created similar to the Resources target
	PatchResources Target = "PatchResources"
	// Resources creates new resources that are added to the DesiredComposed Resources
	Resources Target = "Resources"
	// XR targets the existing Observed XR itself
	XR Target = "XR"
)

// Export contains the export data
type Export struct {
	// Options for `cue export`
	Options ExportOptions `json:"options,omitempty"`
	// Resources is a list of resources to patch and create
	// This is utilized when a Target is set to PatchResources
	Resources ResourceList `json:"resources,omitempty"`
	// Target determines what object the export output should be applied to
	// +kubebuilder:default:=Resources
	// +kubebuilder:validation:Enum:=PatchDesired;PatchResources;Resources;XR
	Target Target `json:"target,required"`
	// Value is the string representation of the cue value to run `cue export` against
	Value string `json:"value,required"`
}

type ExportOptions struct {
	// Escape use HTML escaping
	Escape bool `json:"escape,omitempty"`
	// Expression export only this expression
	// +kubebuilder:default:=[]
	Expressions []string `json:"expressions"`
	// Force overwriting existing files
	Force bool `json:"force,omitempty"`
	// Inject set the value of a tagged field
	// +kubebuilder:default:=[]
	Inject []Tag `json:"inject"`
	// InjectVars inject system variables in tags
	InjectVars []string `json:"inject_vars,omitempty"`
	// List concatenate multiple objects into a list
	List bool `json:"list,omitempty"`
	// Merge non-CUE files (default true)
	Merge bool `json:"merge,omitempty"`
	// Name glob filter for non-CUE file names in directories
	Name string `json:"name,omitempty"`
	// Out output format (see cue filetypes) for more information
	Out string `json:"out,omitempty"`
	// Outfile filename or - for stdout with optional file prefix (run 'cue filetypes' for more info)
	Outfile string `json:"outfile,omitempty"`
	// Package name for non-CUE files
	Package string `json:"package,omitempty"`
	// Path CUE expression for single path component
	Path []string `json:"path,omitempty"`
	// ProtoEnum mode for rendering enums (int|json)
	ProtoEnum string `json:"proto_enum,omitempty"`
	// ProtoPath paths in which to search for imports
	ProtoPath []string `json:"proto_path,omitempty"`
	// Schema expression to select schema for evaluating values in non-CUE files
	Schema string `json:"schema,omitempty"`
	// WithContext import as object with contextual data
	WithContext bool `json:"with_context,omitempty"`
}

type Tag struct {
	// Name of the tag
	// Left side of '=' in `cue export --inject`
	Name string `json:"name"`
	// Path of the tag on the XR to inject from
	// Evaluates to the Right side of '=' in `cue export --inject`
	Path string `json:"path"`
}

type ResourceList []Resource

type Resource struct {
	// Name is a unique identifier for this entry in a ResourceList
	Name string `json:"name"`
	// Base of the composed resource that patches will be applied to.
	// According to the patches and transforms functions, this may be ommited on
	// occassion by a previous pipeline
	// +kubebuilder:pruning:PreserveUnknownFields
	// +kubebuilder:validation:EmbeddedResource
	// +optional
	Base *runtime.RawExtension `json:"base,omitempty"`
}