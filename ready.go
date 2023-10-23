package main

import (
	"context"

	xpv1 "github.com/crossplane/crossplane-runtime/apis/common/v1"
	"github.com/crossplane/crossplane-runtime/pkg/errors"
	"github.com/crossplane/crossplane-runtime/pkg/fieldpath"
	"github.com/crossplane/crossplane-runtime/pkg/resource"

	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/util/validation/field"
)

// readinessCheckType is used for readiness check types.
type readinessCheckType string

// The possible values for readiness check type.
const (
	readinessCheckTypeNonEmpty       readinessCheckType = "NonEmpty"
	readinessCheckTypeMatchString    readinessCheckType = "MatchString"
	readinessCheckTypeMatchInteger   readinessCheckType = "MatchInteger"
	readinessCheckTypeMatchTrue      readinessCheckType = "MatchTrue"
	readinessCheckTypeMatchFalse     readinessCheckType = "MatchFalse"
	readinessCheckTypeMatchCondition readinessCheckType = "MatchCondition"
	readinessCheckTypeNone           readinessCheckType = "None"
)

// readinessCheck is used to indicate how to tell whether a resource is ready
// for consumption
type readinessCheck struct {
	// Type indicates the type of probe you'd like to use.
	Type readinessCheckType `json:"type"`

	// FieldPath shows the path of the field whose value will be used.
	FieldPath *string `json:"fieldPath,omitempty"`

	// MatchString is the value you'd like to match if you're using "MatchString" type.
	MatchString *string `json:"matchString,omitempty"`

	// MatchInt is the value you'd like to match if you're using "MatchInt" type.
	MatchInteger *int64 `json:"matchInteger,omitempty"`

	// MatchCondition specifies the condition you'd like to match if you're using "MatchCondition" type.
	MatchCondition *matchConditionReadinessCheck `json:"matchCondition,omitempty"`
}

// matchConditionReadinessCheck is used to indicate how to tell whether a resource is ready
// for consumption
type matchConditionReadinessCheck struct {
	// Type indicates the type of condition you'd like to use.
	Type xpv1.ConditionType `json:"type"`

	// Status is the status of the condition you'd like to match.
	Status corev1.ConditionStatus `json:"status"`
}

// Error strings
const (
	errInvalidCheck = "invalid"
	errPaveObject   = "cannot lookup field paths in supplied object"

	errFmtRunCheck = "cannot run readiness check at index %d"
)

// A ReadinessChecker checks whether a composed resource is ready or not.
type ReadinessChecker interface {
	IsReady(ctx context.Context, o ConditionedObject, rc ...readinessCheck) (ready bool, err error)
}

// A ReadinessCheckerFn checks whether a composed resource is ready or not.
type ReadinessCheckerFn func(ctx context.Context, o ConditionedObject, rc ...readinessCheck) (ready bool, err error)

// IsReady reports whether a composed resource is ready or not.
func (fn ReadinessCheckerFn) IsReady(ctx context.Context, o ConditionedObject, rc ...readinessCheck) (ready bool, err error) {
	return fn(ctx, o, rc...)
}

// A ConditionedObject is a runtime object with conditions.
type ConditionedObject interface {
	resource.Object
	resource.Conditioned
}

// IsReady returns whether the composed resource is ready.
func IsReady(_ context.Context, o ConditionedObject, rc ...readinessCheck) (bool, error) {
	// We don't have API server defaulting, so we default here.
	if len(rc) == 0 {
		return resource.IsConditionTrue(o.GetCondition(xpv1.TypeReady)), nil
	}

	for i := range rc {
		ready, err := RunReadinessCheck(rc[i], o)
		if err != nil {
			return false, errors.Wrapf(err, errFmtRunCheck, i)
		}
		if !ready {
			return false, nil
		}
	}
	return true, nil
}

// RunReadinessCheck runs the readiness check against the supplied object.
func RunReadinessCheck(c readinessCheck, o ConditionedObject) (bool, error) { //nolint:gocyclo // just a switch
	if err := validateReadinessCheck(c); err != nil {
		return false, errors.Wrap(err, errInvalidCheck)
	}

	p, err := fieldpath.PaveObject(o)
	if err != nil {
		return false, errors.Wrap(err, errPaveObject)
	}

	switch c.Type {
	case readinessCheckTypeNone:
		return true, nil
	case readinessCheckTypeNonEmpty:
		if _, err := p.GetValue(*c.FieldPath); err != nil {
			return false, resource.Ignore(fieldpath.IsNotFound, err)
		}
		return true, nil
	case readinessCheckTypeMatchString:
		val, err := p.GetString(*c.FieldPath)
		if err != nil {
			return false, resource.Ignore(fieldpath.IsNotFound, err)
		}
		return val == *c.MatchString, nil
	case readinessCheckTypeMatchInteger:
		val, err := p.GetInteger(*c.FieldPath)
		if err != nil {
			return false, resource.Ignore(fieldpath.IsNotFound, err)
		}
		return val == *c.MatchInteger, nil
	case readinessCheckTypeMatchCondition:
		val := o.GetCondition(c.MatchCondition.Type)
		return val.Status == c.MatchCondition.Status, nil
	case readinessCheckTypeMatchFalse:
		val, err := p.GetBool(*c.FieldPath)
		if err != nil {
			return false, resource.Ignore(fieldpath.IsNotFound, err)
		}
		return val == false, nil //nolint:gosimple // returning '!val' here as suggested hurts readability
	case readinessCheckTypeMatchTrue:
		val, err := p.GetBool(*c.FieldPath)
		if err != nil {
			return false, resource.Ignore(fieldpath.IsNotFound, err)
		}
		return val == true, nil //nolint:gosimple // returning 'val' here as suggested hurts readability
	}

	return false, nil
}

// validateReadinessCheck checks if the readiness check is logically valid.
func validateReadinessCheck(r readinessCheck) *field.Error { //nolint:gocyclo // This function is not that complex, just a switch
	switch r.Type {
	case readinessCheckTypeNone:
		return nil
	case readinessCheckTypeMatchString:
		if r.MatchString == nil {
			return field.Required(field.NewPath("matchString"), "cannot be nil for type MatchString")
		}
	case readinessCheckTypeMatchInteger:
		if r.MatchInteger == nil {
			return field.Required(field.NewPath("matchInteger"), "cannot be nil for type MatchInteger")
		}
	case readinessCheckTypeMatchCondition:
		if err := validateMatchConditionReadinessCheck(r.MatchCondition); err != nil {
			return wrapFieldError(err, field.NewPath("matchCondition"))
		}
		return nil
	case readinessCheckTypeNonEmpty, readinessCheckTypeMatchFalse, readinessCheckTypeMatchTrue:
	// No specific validation required.
	default:
		return field.Invalid(field.NewPath("type"), r.Type, "invalid readiness check type")
	}
	if r.FieldPath == nil {
		return field.Required(field.NewPath("fieldPath"), "cannot be empty")
	}

	return nil
}

// validateMatchConditionReadinessCheck checks if the match condition is
// logically valid.
func validateMatchConditionReadinessCheck(m *matchConditionReadinessCheck) *field.Error {
	if m == nil {
		return nil
	}
	if m.Type == "" {
		return field.Required(field.NewPath("type"), "cannot be empty for type MatchCondition")
	}
	if m.Status == "" {
		return field.Required(field.NewPath("status"), "cannot be empty for type MatchCondition")
	}
	return nil
}

// wrapFieldError wraps the given field.Error adding the given field.Path as root of the Field.
func wrapFieldError(err *field.Error, path *field.Path) *field.Error {
	if err == nil {
		return nil
	}
	if path == nil {
		return err
	}
	err.Field = path.Child(err.Field).String()
	return err
}
