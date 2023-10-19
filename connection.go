package main

import (
	"fmt"

	"github.com/crossplane/crossplane-runtime/pkg/reconciler/managed"
	"github.com/crossplane/function-sdk-go/resource"
)

type ConnectionDetailType string

// ConnectionDetailType types.
const (
	ConnectionDetailTypeFromConnectionSecretKey ConnectionDetailType = "FromConnectionSecretKey"
	ConnectionDetailTypeFromFieldPath           ConnectionDetailType = "FromFieldPath"
	ConnectionDetailTypeFromValue               ConnectionDetailType = "FromValue"
)

// match contains associations for the produced documents
type match struct {
	ApiVersion string `json:"apiVersion,required"`
	Name       string `json:"name,required"`
	Kind       string `json:"kind,required"`
}

// ConnectionDetail includes the information about the propagation of the connection
// information from one secret to another.
type ConnectionDetail struct {
	// Match is used to associate the connection detail to an object
	Match match `json:"match,required"`
	// Name of the connection secret key that will be propagated to the
	// connection secret of the composed resource.
	Name string `json:"name,required"`
	// Type sets the connection detail fetching behavior to be used. Each
	// connection detail type may require its own fields to be set on the
	// ConnectionDetail object.
	Type ConnectionDetailType `json:"type,required"`
	// FromConnectionSecretKey is the key that will be used to fetch the value
	// from the composed resource's connection secret.
	FromConnectionSecretKey *string `json:"fromConnectionSecretKey,omitempty"`
	// FromFieldPath is the path of the field on the composed resource whose
	// value to be used as input. Name must be specified if the type is
	// FromFieldPath.
	FromFieldPath *string `json:"fromFieldPath,omitempty"`
	// Value that will be propagated to the connection secret of the composite
	// resource. May be set to inject a fixed, non-sensitive connection secret
	// value, for example a well-known port.
	Value *string `json:"value,omitempty"`
}

// extractConnectionDetails extracts XR connection details from the supplied
func extractConnectionDetails(observed map[resource.Name]resource.ObservedComposed, conDetails []map[string]interface{}) (managed.ConnectionDetails, error) {
	out := map[string][]byte{}

	for i, o := range observed {
		fmt.Printf("%s: %+v\n", i, o.Resource)
	}

	return out, nil
}