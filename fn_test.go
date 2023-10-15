package main

import (
	"context"
	"testing"

	"github.com/crossplane/crossplane-runtime/pkg/logging"
	fnv1beta1 "github.com/crossplane/function-sdk-go/proto/v1beta1"
	"github.com/crossplane/function-sdk-go/resource"
	"github.com/crossplane/function-sdk-go/response"
	"github.com/google/go-cmp/cmp"
	"github.com/google/go-cmp/cmp/cmpopts"
	"google.golang.org/protobuf/testing/protocmp"
	"google.golang.org/protobuf/types/known/durationpb"
)

func TestRunFunction(t *testing.T) {

	type args struct {
		ctx context.Context
		req *fnv1beta1.RunFunctionRequest
	}
	type want struct {
		rsp *fnv1beta1.RunFunctionResponse
		err error
	}

	cases := map[string]struct {
		reason string
		args   args
		want   want
	}{
		"NoInput": {
			reason: "The Function should return a fatal result if no input was specified",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_FATAL,
							Message:  "invalid function input: value cannot be empty",
						},
					},
				},
			},
		},
		"BasicResourceCreation": {
			reason: "The Function should be able to create a resource from a cue template",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "basic"
						},
						"export": {
							"value": "apiVersion: \"example.org/v1\"\nkind: \"Generated\"\nmetadata: name: \"basic\""
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"basic:Generated\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"basic": {
								Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"Generated","metadata":{"name":"basic"}}`),
							},
						},
					},
				},
			},
		},
		"Conditionals": {
			reason: "Cue Conditionals should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "conditional"
						},
						"export": {
							"value": "let #ENV = {\n\tPROVIDER: \"aws\"\n}\n\nif #ENV[\"PROVIDER\"] == \"aws\" {\n\tapiVersion: \"eks.nobu.dev/v1beta\"\n}\nif #ENV[\"PROVIDER\"] == \"gcp\" {\n\tapiVersion: \"gke.nobu.dev/v1beta1\"\n}\n\nkind: \"XNodepool\"\nmetadata: name: \"TestNodepool\"\nspec: parameters: {\n\tautoscaling: [{\n\t\tmaxNodeCount: 1\n\t\tminNodeCount: 1\n\t}]\n\tclusterName: \"example1\"\n\tif #ENV[\"LABELS\"] != _|_ {\n\t\tnodeLabels: #ENV[\"LABELS\"]\n\t}\n\tregion: \"us-east-2\"\n}\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"TestNodepool:XNodepool\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"conditional": {
								Resource: resource.MustStructJSON(`{
								    "apiVersion": "eks.nobu.dev/v1beta",
								    "kind": "XNodepool",
								    "metadata": {
								        "name": "TestNodepool"
								    },
								    "spec": {
								        "parameters": {
								            "autoscaling": [
								                {
								                    "maxNodeCount": 1,
								                    "minNodeCount": 1
								                }
								            ],
								            "clusterName": "example1",
								            "region": "us-east-2"
								        }
								    }
								}`),
							},
						},
					},
				},
			},
		},
		"Identification": {
			reason: "CUE Identifiers should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "identification"
						},
						"export": {
							"value": "#deployment: [ID=_]: {\n\tapiVersion: \"apps/v1\"\n\tkind:       \"Deployment\"\n\tmetadata: name: ID\n\tspec: {\n\t\treplicas: *1 | int\n\t\ttemplate: {\n\t\t\tmetadata: labels: {\n\t\t\t\tapp:       ID\n\t\t\t\tdomain:    \"prod\"\n\t\t\t\tcomponent: string\n\t\t\t}\n\t\t\tspec: containers: [{name: ID}]\n\t\t}\n\t}\n}\n\n#deployment: echoserver: spec: template: {\n\tmetadata: annotations: {\n\t\t\"prometheus.io.scrape\": \"true\"\n\t\t\"prometheus.io.port\":   \"7080\"\n\t}\n\tmetadata: labels: {\n\t\t\"component\": \"core\"\n\t}\n}\n#deployment.echoserver\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"echoserver:Deployment\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"identification": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "apps/v1",
									"kind": "Deployment",
									"metadata": {
									    "name": "echoserver"
									},
									"spec": {
									    "replicas": 1,
									    "template": {
									        "metadata": {
									            "annotations": {
									                "prometheus.io.scrape": "true",
									                "prometheus.io.port": "7080"
									            },
									            "labels": {
									                "app": "echoserver",
									                "domain": "prod",
									                "component": "core"
									            }
									        },
									        "spec": {
									            "containers": [
									                {
									                    "name": "echoserver"
									                }
									            ]
									        }
									    }
									}
								}`),
							},
						},
					},
				},
			},
		},
		// Expressions allow for multiple document generations
		"YAMLStreamExpressions": {
			reason: "CUE Expressions should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "expression"
						},
						"export": {
							"options": {
								"expressions": [
									"json.MarshalStream(output)"
								]
							},
							"value": "output: [\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Cluster\"\n\t\tmetadata: name: \"example-cluster\"\n\t},\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Nodepool\"\n\t\tmetadata: name: \"example-nodepool\"\n\t},\n]\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-cluster:Cluster\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-nodepool:Nodepool\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"expression-example-cluster": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Cluster",
									"metadata": {
									    "name": "example-cluster"
									}
								}`),
							},
							"expression-example-nodepool": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Nodepool",
									"metadata": {
									    "name": "example-nodepool"
									}
								}`),
							},
						},
					},
				},
			},
		},
		"JSONStreamExpressions": {
			reason: "CUE Expressions should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "expression"
						},
						"export": {
							"options": {
								"expressions": [
									"yaml.MarshalStream(output)"
								]
							},
							"value": "output: [\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Cluster\"\n\t\tmetadata: name: \"example-cluster\"\n\t},\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Nodepool\"\n\t\tmetadata: name: \"example-nodepool\"\n\t},\n]\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-cluster:Cluster\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-nodepool:Nodepool\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"expression-example-cluster": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Cluster",
									"metadata": {
									    "name": "example-cluster"
									}
								}`),
							},
							"expression-example-nodepool": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Nodepool",
									"metadata": {
									    "name": "example-nodepool"
									}
								}`),
							},
						},
					},
				},
			},
		},
		// TODO Fix multiple expressions
		// "MultipleExpressions": {
		// 	reason: "CUE Expressions should work",
		// 	args: args{
		// 		req: &fnv1beta1.RunFunctionRequest{
		// 			Input: resource.MustStructJSON(`{
		// 				"apiVersion": "dummy.fn.crossplane.io",
		// 				"kind": "dummy",
		// 				"metadata": {
		// 					"name": "expression"
		// 				},
		// 				"export": {
		// 					"options": {
		// 						"expressions": [
		// 							"cluster",
		// 							"nodepool",
		// 							"vpc"
		// 						]
		// 					},
		// 					"value": "cluster: {\n\tapiVersion: \"nobu.dev/v1\"\n\tkind:       \"Cluster\"\n\tmetadata: name: \"example-cluster\"\n}\nnodepool: {\n\tapiVersion: \"nobu.dev/v1\"\n\tkind:       \"Nodepool\"\n\tmetadata: name: \"example-nodepool\"\n}\nvpc: {\n\tapiVersion: \"nobu.dev/v1\"\n\tkind:       \"Vpc\"\n\tmetadata: name: \"example-vpc\"\n}\n"
		// 				}
		// 			}`),
		// 			Observed: &fnv1beta1.State{
		// 				Composite: &fnv1beta1.Resource{
		// 					Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
		// 				},
		// 			},
		// 		},
		// 	},
		// 	want: want{
		// 		rsp: &fnv1beta1.RunFunctionResponse{
		// 			Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
		// 			Results: []*fnv1beta1.Result{
		// 				{
		// 					Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
		// 					Message:  "created resource \"example-cluster:Cluster\"",
		// 				},
		// 				{
		// 					Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
		// 					Message:  "created resource \"example-nodepool:Nodepool\"",
		// 				},
		// 				{
		// 					Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
		// 					Message:  "created resource \"example-vpc:Vpc\"",
		// 				},
		// 			},
		// 			Desired: &fnv1beta1.State{
		// 				Composite: &fnv1beta1.Resource{
		// 					Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
		// 				},
		// 				Resources: map[string]*fnv1beta1.Resource{
		// 					"expression-example-cluster": {
		// 						Resource: resource.MustStructJSON(`{
		// 							"apiVersion": "nobu.dev/v1",
		// 							"kind": "Cluster",
		// 							"metadata": {
		// 							    "name": "example-cluster"
		// 							}
		// 						}`),
		// 					},
		// 					"expression-example-nodepool": {
		// 						Resource: resource.MustStructJSON(`{
		// 							"apiVersion": "nobu.dev/v1",
		// 							"kind": "Nodepool",
		// 							"metadata": {
		// 							    "name": "example-nodepool"
		// 							}
		// 						}`),
		// 					},
		// 					"expression-example-vpc": {
		// 						Resource: resource.MustStructJSON(`{
		// 							"apiVersion": "nobu.dev/v1",
		// 							"kind": "Vpc",
		// 							"metadata": {
		// 							    "name": "example-vpc"
		// 							}
		// 						}`),
		// 					},
		// 					"expression-example-rds": {
		// 						Resource: resource.MustStructJSON(`{
		// 							"apiVersion": "nobu.dev/v1",
		// 							"kind": "Rds",
		// 							"metadata": {
		// 							    "name": "example-rds"
		// 							}
		// 						}`),
		// 					},
		// 					"expression-example-subnet": {
		// 						Resource: resource.MustStructJSON(`{
		// 							"apiVersion": "nobu.dev/v1",
		// 							"kind": "Subnet",
		// 							"metadata": {
		// 							    "name": "example-subnet"
		// 							}
		// 						}`),
		// 					},
		// 				},
		// 			},
		// 		},
		// 	},
		// },
		"ManyObjects": {
			reason: "CUE Expressions should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "expression"
						},
						"export": {
							"options": {
								"expressions": [
									"yaml.MarshalStream(output)"
								]
							},
							"value": "output: [\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Cluster\"\n\t\tmetadata: name: \"example-cluster\"\n\t},\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Nodepool\"\n\t\tmetadata: name: \"example-nodepool\"\n\t},\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Vpc\"\n\t\tmetadata: name: \"example-vpc\"\n\t},\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Rds\"\n\t\tmetadata: name: \"example-rds\"\n\t},\n\t{\n\t\tapiVersion: \"nobu.dev/v1\"\n\t\tkind:       \"Subnet\"\n\t\tmetadata: name: \"example-subnet\"\n\t},\n]\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-cluster:Cluster\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-nodepool:Nodepool\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-rds:Rds\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-subnet:Subnet\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"example-vpc:Vpc\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"expression-example-cluster": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Cluster",
									"metadata": {
									    "name": "example-cluster"
									}
								}`),
							},
							"expression-example-nodepool": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Nodepool",
									"metadata": {
									    "name": "example-nodepool"
									}
								}`),
							},
							"expression-example-vpc": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Vpc",
									"metadata": {
									    "name": "example-vpc"
									}
								}`),
							},
							"expression-example-rds": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Rds",
									"metadata": {
									    "name": "example-rds"
									}
								}`),
							},
							"expression-example-subnet": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Subnet",
									"metadata": {
									    "name": "example-subnet"
									}
								}`),
							},
						},
					},
				},
			},
		},
		"ExpressionIdentification": {
			reason: "CUE Identifiers should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "expressidentification"
						},
						"export": {
							"options": {
								"expressions": [
									"#deployment.echoserver"
								]
							},
							"value": "#deployment: [ID=_]: {\n\tapiVersion: \"apps/v1\"\n\tkind:       \"Deployment\"\n\tmetadata: name: ID\n\tspec: {\n\t\treplicas: *1 | int\n\t\ttemplate: {\n\t\t\tmetadata: labels: {\n\t\t\t\tapp:       ID\n\t\t\t\tdomain:    \"prod\"\n\t\t\t\tcomponent: string\n\t\t\t}\n\t\t\tspec: containers: [{name: ID}]\n\t\t}\n\t}\n}\n\n#deployment: echoserver: spec: template: {\n\tmetadata: annotations: {\n\t\t\"prometheus.io.scrape\": \"true\"\n\t\t\"prometheus.io.port\":   \"7080\"\n\t}\n\tmetadata: labels: {\n\t\t\"component\": \"core\"\n\t}\n}\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"echoserver:Deployment\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"expressidentification": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "apps/v1",
									"kind": "Deployment",
									"metadata": {
									    "name": "echoserver"
									},
									"spec": {
									    "replicas": 1,
									    "template": {
									        "metadata": {
									            "annotations": {
									                "prometheus.io.scrape": "true",
									                "prometheus.io.port": "7080"
									            },
									            "labels": {
									                "app": "echoserver",
									                "domain": "prod",
									                "component": "core"
									            }
									        },
									        "spec": {
									            "containers": [
									                {
									                    "name": "echoserver"
									                }
									            ]
									        }
									    }
									}
								}`),
							},
						},
					},
				},
			},
		},
	}

	for name, tc := range cases {
		t.Run(name, func(t *testing.T) {
			f := &Function{log: logging.NewNopLogger()}
			rsp, err := f.RunFunction(tc.args.ctx, tc.args.req)

			if diff := cmp.Diff(tc.want.rsp, rsp, protocmp.Transform()); diff != "" {
				t.Errorf("%s\nf.RunFunction(...): -want rsp, +got rsp:\n%s", tc.reason, diff)
			}

			if diff := cmp.Diff(tc.want.err, err, cmpopts.EquateErrors()); diff != "" {
				t.Errorf("%s\nf.RunFunction(...): -want err, +got err:\n%s", tc.reason, diff)
			}
		})
	}
}