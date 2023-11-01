package main

import (
	"github.com/crossplane/crossplane-runtime/pkg/fieldpath"
	"github.com/crossplane/crossplane-runtime/pkg/reconciler/managed"
	"github.com/crossplane/function-sdk-go/resource"

	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/util/json"
	"k8s.io/apimachinery/pkg/util/validation/field"
)

type connectionDetailType string

// connectionDetailType types.
const (
	connectionDetailTypeFromConnectionSecretKey connectionDetailType = "FromConnectionSecretKey"
	connectionDetailTypeFromFieldPath           connectionDetailType = "FromFieldPath"
	connectionDetailTypeFromValue               connectionDetailType = "FromValue"
)

// match contains associations for the produced documents
type match struct {
	ApiVersion string `json:"apiVersion,required"`
	Name       string `json:"name,required"`
	Kind       string `json:"kind,required"`
}

// connectionDetail includes the information about the propagation of the connection
// information from one secret to another.
type connectionDetail struct {
	// Match is used to associate the connection detail to an object
	// Match is required for FromConnectionSecretKey and FromFieldPath
	Match match `json:"match,omitempty"`
	// Name of the connection secret key that will be propagated to the
	// connection secret of the composed resource.
	Name string `json:"name,required"`
	// Type sets the connection detail fetching behavior to be used. Each
	// connection detail type may require its own fields to be set on the
	// ConnectionDetail object.
	Type connectionDetailType `json:"type,required"`
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

// extractConnectionDetails extracts XR connection details from the supplied observed map
// matches against connectionDetails.Match
func extractConnectionDetails(observed map[resource.Name]resource.ObservedComposed, details []cueOutputData) (managed.ConnectionDetails, error) {
	out := map[string][]byte{}

	for _, detail := range details {
		for _, conDetail := range detail.ConnectionDetails {
			if err := validateConnectionDetail(conDetail); err != nil {
				return nil, err
			}

			// Setting from value does not require a match
			if conDetail.Type == connectionDetailTypeFromValue {
				out[conDetail.Name] = []byte(*conDetail.Value)
				continue
			}

			u := unstructured.Unstructured{Object: detail.Base}
			for _, ocd := range observed {
				if u.GetName() == ocd.Resource.GetName() &&
					u.GetKind() == ocd.Resource.GetKind() &&
					u.GetAPIVersion() == ocd.Resource.GetAPIVersion() {

					mcd := managed.ConnectionDetails(ocd.ConnectionDetails)

					switch conDetail.Type {
					case connectionDetailTypeFromConnectionSecretKey:
						if mcd[*conDetail.FromConnectionSecretKey] == nil {
							// We don't consider this an error because it's possible the
							// key will still be written at some point in the future.
							continue
						}
						out[conDetail.Name] = mcd[*conDetail.FromConnectionSecretKey]
					case connectionDetailTypeFromFieldPath:
						// Note we're checking that the error _is_ nil. If we hit an error
						// we silently avoid including this connection secret. It's possible
						// the path will start existing with a valid value in the future.
						if b, err := fromFieldPath(ocd.Resource, *conDetail.FromFieldPath); err == nil {
							out[conDetail.Name] = b
						}
					}

					break
				}
			}
		}
	}

	return out, nil
}

// fromFieldPath tries to read the value from the supplied field path first as a
// plain string. If this fails, it falls back to reading it as JSON.
func fromFieldPath(from runtime.Object, path string) ([]byte, error) {
	fromMap, err := runtime.DefaultUnstructuredConverter.ToUnstructured(from)
	if err != nil {
		return nil, err
	}

	str, err := fieldpath.Pave(fromMap).GetString(path)
	if err == nil {
		return []byte(str), nil
	}

	in, err := fieldpath.Pave(fromMap).GetValue(path)
	if err != nil {
		return nil, err
	}

	return json.Marshal(in)
}

// validateConnectionDetail checks if the connection detail is logically valid.
func validateConnectionDetail(cd connectionDetail) *field.Error {
	if cd.Type == "" {
		return field.Required(field.NewPath("type"), "connection detail type is required")
	}

	if cd.Name == "" {
		return field.Required(field.NewPath("name"), "name is required")
	}

	switch cd.Type {
	case connectionDetailTypeFromValue:
		if cd.Value == nil {
			return field.Required(field.NewPath("value"), "value connection detail requires a value")
		}
	case connectionDetailTypeFromConnectionSecretKey:
		if cd.FromConnectionSecretKey == nil {
			return field.Required(field.NewPath("fromConnectionSecretKey"), "from connection secret key connection detail requires a key")
		}
	case connectionDetailTypeFromFieldPath:
		if cd.FromFieldPath == nil {
			return field.Required(field.NewPath("fromFieldPath"), "from field path connection detail requires a field path")
		}
	default:
		return field.Invalid(field.NewPath("type"), string(cd.Type), "unknown connection detail type")
	}
	return nil
}
