package main

import (
	"context"
	"testing"

	xpv1 "github.com/crossplane/crossplane-runtime/apis/common/v1"
	"github.com/crossplane/crossplane-runtime/pkg/errors"
	"github.com/crossplane/crossplane-runtime/pkg/fieldpath"
	"github.com/crossplane/crossplane-runtime/pkg/resource/unstructured/composed"
	"github.com/crossplane/crossplane-runtime/pkg/test"
	"github.com/google/go-cmp/cmp"

	corev1 "k8s.io/api/core/v1"
	"k8s.io/utils/pointer"
)

var _ ReadinessChecker = ReadinessCheckerFn(IsReady)

func TestIsReady(t *testing.T) {
	type args struct {
		ctx context.Context
		o   ConditionedObject
		rc  []readinessCheck
	}
	type want struct {
		ready bool
		err   error
	}
	cases := map[string]struct {
		reason string
		args
		want
	}{
		"NoCustomCheckReady": {
			reason: "If no custom check is given, Ready condition should be used",
			args: args{
				o: composed.New(composed.WithConditions(xpv1.Available())),
			},
			want: want{
				ready: true,
			},
		},
		"NoCustomCheckNotReady": {
			reason: "If no custom check is given, Ready condition should be used",
			args: args{
				o: composed.New(composed.WithConditions(xpv1.Unavailable())),
			},
			want: want{
				ready: false,
			},
		},
		"MatchConditionReady": {
			reason: "If a match condition is explicitly specified it should be used",
			args: args{
				o: composed.New(composed.WithConditions(xpv1.Available())),
				rc: []readinessCheck{{
					Type: readinessCheckTypeMatchCondition,
					MatchCondition: &matchConditionReadinessCheck{
						Type:   xpv1.TypeReady,
						Status: corev1.ConditionTrue,
					},
				}},
			},
			want: want{
				ready: true,
			},
		},
		"MatchConditionNotReady": {
			reason: "If a match condition is explicitly specified it should be used",
			args: args{
				o: composed.New(composed.WithConditions(xpv1.Unavailable())),
				rc: []readinessCheck{{
					Type: readinessCheckTypeMatchCondition,
					MatchCondition: &matchConditionReadinessCheck{
						Type:   xpv1.TypeReady,
						Status: corev1.ConditionTrue,
					},
				}},
			},
			want: want{
				ready: false,
			},
		},
		"ExplictNone": {
			reason: "If the only readiness check is explicitly 'None' the resource is always ready.",
			args: args{
				o:  composed.New(),
				rc: []readinessCheck{{Type: readinessCheckTypeNone}},
			},
			want: want{
				ready: true,
			},
		},

		"NonEmptyErr": {
			reason: "If the value cannot be fetched due to fieldPath being misconfigured, error should be returned",
			args: args{
				o: composed.New(),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeNonEmpty,
					FieldPath: pointer.String("metadata..uid"),
				}},
			},
			want: want{
				err: errors.Wrapf(fieldpath.Pave(nil).GetValueInto("metadata..uid", nil), errFmtRunCheck, 0),
			},
		},
		"NonEmptyFalse": {
			reason: "If the field does not have value, NonEmpty check should return false",
			args: args{
				o: composed.New(),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeNonEmpty,
					FieldPath: pointer.String("metadata.uid"),
				}},
			},
			want: want{
				ready: false,
			},
		},
		"NonEmptyTrue": {
			reason: "If the field does have a value, NonEmpty check should return true",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.SetUID("olala")
				}),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeNonEmpty,
					FieldPath: pointer.String("metadata.uid"),
				}},
			},
			want: want{
				ready: true,
			},
		},
		"MatchStringErr": {
			reason: "If the value cannot be fetched due to fieldPath being misconfigured, error should be returned",
			args: args{
				o: composed.New(),
				rc: []readinessCheck{{
					Type:        readinessCheckTypeMatchString,
					FieldPath:   pointer.String("metadata..uid"),
					MatchString: pointer.String("cool"),
				}},
			},
			want: want{
				err: errors.Wrapf(fieldpath.Pave(nil).GetValueInto("metadata..uid", nil), errFmtRunCheck, 0),
			},
		},
		"MatchStringFalse": {
			reason: "If the value of the field does not match, it should return false",
			args: args{
				o: composed.New(),
				rc: []readinessCheck{{
					Type:        readinessCheckTypeMatchString,
					FieldPath:   pointer.String("metadata.uid"),
					MatchString: pointer.String("olala"),
				}},
			},
			want: want{
				ready: false,
			},
		},
		"MatchStringTrue": {
			reason: "If the value of the field does match, it should return true",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.SetUID("olala")
				}),
				rc: []readinessCheck{{
					Type:        readinessCheckTypeMatchString,
					FieldPath:   pointer.String("metadata.uid"),
					MatchString: pointer.String("olala"),
				}},
			},
			want: want{
				ready: true,
			},
		},
		"MatchIntegerErr": {
			reason: "If the value cannot be fetched due to fieldPath being misconfigured, error should be returned",
			args: args{
				o: composed.New(),
				rc: []readinessCheck{{
					Type:         readinessCheckTypeMatchInteger,
					FieldPath:    pointer.String("metadata..uid"),
					MatchInteger: pointer.Int64(42),
				}},
			},
			want: want{
				err: errors.Wrapf(fieldpath.Pave(nil).GetValueInto("metadata..uid", nil), errFmtRunCheck, 0),
			},
		},
		"MatchIntegerFalse": {
			reason: "If the value of the field does not match, it should return false",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{
							"someNum": int64(6),
						},
					}
				}),
				rc: []readinessCheck{{
					Type:         readinessCheckTypeMatchInteger,
					FieldPath:    pointer.String("spec.someNum"),
					MatchInteger: pointer.Int64(5),
				}},
			},
			want: want{
				ready: false,
			},
		},
		"MatchIntegerTrue": {
			reason: "If the value of the field does match, it should return true",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{
							"someNum": int64(5),
						},
					}
				}),
				rc: []readinessCheck{{
					Type:         readinessCheckTypeMatchInteger,
					FieldPath:    pointer.String("spec.someNum"),
					MatchInteger: pointer.Int64(5),
				}},
			},
			want: want{
				ready: true,
			},
		},
		"MatchTrueMissing": {
			reason: "If the field is missing, it should return false",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{},
					}
				}),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeMatchTrue,
					FieldPath: pointer.String("spec.someBool"),
				}},
			},
			want: want{
				ready: false,
			},
		},
		"MatchTrueReady": {
			reason: "If the value of the field is true, it should return true",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{
							"someBool": true,
						},
					}
				}),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeMatchTrue,
					FieldPath: pointer.String("spec.someBool"),
				}},
			},
			want: want{
				ready: true,
			},
		},
		"MatchTrueNotReady": {
			reason: "If the value of the field is false, it should return false",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{
							"someBool": false,
						},
					}
				}),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeMatchTrue,
					FieldPath: pointer.String("spec.someBool"),
				}},
			},
			want: want{
				ready: false,
			},
		},
		"MatchFalseMissing": {
			reason: "If the field is missing, it should return false",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{},
					}
				}),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeMatchFalse,
					FieldPath: pointer.String("spec.someBool"),
				}},
			},
			want: want{
				ready: false,
			},
		},
		"MatchFalseReady": {
			reason: "If the value of the field is false, it should return true",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{
							"someBool": false,
						},
					}
				}),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeMatchFalse,
					FieldPath: pointer.String("spec.someBool"),
				}},
			},
			want: want{
				ready: true,
			},
		},
		"MatchFalseNotReady": {
			reason: "If the value of the field is true, it should return false",
			args: args{
				o: composed.New(func(r *composed.Unstructured) {
					r.Object = map[string]any{
						"spec": map[string]any{
							"someBool": true,
						},
					}
				}),
				rc: []readinessCheck{{
					Type:      readinessCheckTypeMatchFalse,
					FieldPath: pointer.String("spec.someBool"),
				}},
			},
			want: want{
				ready: false,
			},
		},
		"UnknownType": {
			reason: "If unknown type is chosen, it should return an error",
			args: args{
				o:  composed.New(),
				rc: []readinessCheck{{Type: "Olala"}},
			},
			want: want{
				err: errors.Wrapf(errors.Wrap(errors.Errorf("type: Invalid value: %q: invalid readiness check type", "Olala"), errInvalidCheck), errFmtRunCheck, 0),
			},
		},
	}
	for name, tc := range cases {
		t.Run(name, func(t *testing.T) {
			ready, err := IsReady(tc.args.ctx, tc.args.o, tc.args.rc...)
			if diff := cmp.Diff(tc.want.err, err, test.EquateErrors()); diff != "" {
				t.Errorf("\n%s\nIsReady(...): -want, +got:\n%s", tc.reason, diff)
			}
			if diff := cmp.Diff(tc.want.ready, ready); diff != "" {
				t.Errorf("\n%s\nIsReady(...): -want, +got:\n%s", tc.reason, diff)
			}
		})
	}
}
