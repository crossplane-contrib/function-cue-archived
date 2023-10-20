package main

import (
	"testing"

	managed "github.com/crossplane/crossplane-runtime/pkg/reconciler/managed"
	"github.com/crossplane/crossplane-runtime/pkg/test"
	rresource "github.com/crossplane/function-sdk-go/resource"
	"github.com/crossplane/function-sdk-go/resource/composed"
	"github.com/google/go-cmp/cmp"
	"github.com/google/go-cmp/cmp/cmpopts"

	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
	"k8s.io/apimachinery/pkg/util/validation/field"
	"k8s.io/utils/pointer"
)

func TestExtractConnectionDetails(t *testing.T) {
	type args struct {
		obs     map[rresource.Name]rresource.ObservedComposed
		data    managed.ConnectionDetails
		details []connectionDetail
	}
	type want struct {
		conn managed.ConnectionDetails
		err  error
	}

	cases := map[string]struct {
		reason string
		args   args
		want   want
	}{
		"MissingNameError": {
			reason: "We should return an error if a connection detail is missing a name.",
			args: args{
				details: []connectionDetail{
					{
						// A nameless connection detail.
						Type: connectionDetailTypeFromValue,
					},
				},
			},
			want: want{
				err: &field.Error{
					Type:     "FieldValueRequired",
					Field:    "name",
					BadValue: "",
					Detail:   "name is required",
				},
			},
		},
		"FetchConfigSuccess": {
			reason: "Should extract only the selected set of secret keys",
			args: args{
				obs: map[rresource.Name]rresource.ObservedComposed{
					"test": {
						Resource: &composed.Unstructured{
							Unstructured: unstructured.Unstructured{
								Object: map[string]interface{}{
									"apiVersion": "nobu.dev/v1",
									"kind":       "test",
									"metadata": map[string]interface{}{
										"name":       "test",
										"generation": 4,
									},
								},
							},
						},
						ConnectionDetails: rresource.ConnectionDetails{
							"foo": []byte("foo"),
						},
					},
				},
				details: []connectionDetail{
					{
						Match: match{
							ApiVersion: "nobu.dev/v1",
							Kind:       "test",
							Name:       "test",
						},
						Type:                    connectionDetailTypeFromConnectionSecretKey,
						Name:                    "convfoo",
						FromConnectionSecretKey: pointer.String("foo"),
					},
					{
						Type:  connectionDetailTypeFromValue,
						Name:  "fixed",
						Value: pointer.String("value"),
					},
					{
						Match: match{
							ApiVersion: "nobu.dev/v1",
							Kind:       "test",
							Name:       "test",
						},
						Type:          connectionDetailTypeFromFieldPath,
						Name:          "name",
						FromFieldPath: pointer.String("metadata.name"),
					},
					{
						Match: match{
							ApiVersion: "nobu.dev/v1",
							Kind:       "test",
							Name:       "test",
						},
						Type:          connectionDetailTypeFromFieldPath,
						Name:          "generation",
						FromFieldPath: pointer.String("metadata.generation"),
					},
				},
			},
			want: want{
				conn: managed.ConnectionDetails{
					"convfoo":    []byte("foo"),
					"fixed":      []byte("value"),
					"name":       []byte("test"),
					"generation": []byte("4"),
				},
			},
		},
	}
	for name, tc := range cases {
		t.Run(name, func(t *testing.T) {
			conn, err := extractConnectionDetails(tc.args.obs, tc.args.details)
			if diff := cmp.Diff(tc.want.err, err, test.EquateErrors()); diff != "" {
				t.Errorf("\n%s\nExtractConnectionDetails(...): -want, +got:\n%s", tc.reason, diff)
			}
			if diff := cmp.Diff(tc.want.conn, conn, cmpopts.EquateEmpty()); diff != "" {
				t.Errorf("\n%s\nExtractConnectionDetails(...): -want, +got:\n%s", tc.reason, diff)
			}
		})
	}
}