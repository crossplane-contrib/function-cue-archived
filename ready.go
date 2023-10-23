package main

import (
	xpv1 "github.com/crossplane/crossplane-runtime/apis/common/v1"

	corev1 "k8s.io/api/core/v1"
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

// IsValid returns true if the readiness check type is valid.
func (t *readinessCheckType) IsValid() bool {
	switch *t {
	case readinessCheckTypeNonEmpty,
		readinessCheckTypeMatchString,
		readinessCheckTypeMatchInteger,
		readinessCheckTypeMatchTrue,
		readinessCheckTypeMatchFalse,
		readinessCheckTypeMatchCondition,
		readinessCheckTypeNone:
		return true
	}
	return false
}

// readinessCheck is used to indicate how to tell whether a resource is ready
// for consumption
type readinessCheck struct {
	// Type indicates the type of probe you'd like to use.
	Typer readinessCheckType `json:"type"`

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
