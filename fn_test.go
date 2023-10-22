package main

import (
	"context"
	"testing"

	"github.com/crossplane/crossplane-runtime/pkg/logging"
	fnv1beta1 "github.com/crossplane/function-sdk-go/proto/v1beta1"
	"github.com/crossplane/function-sdk-go/resource"
	"github.com/crossplane/function-sdk-go/resource/composed"
	"github.com/crossplane/function-sdk-go/resource/composite"
	"github.com/crossplane/function-sdk-go/response"
	"github.com/google/go-cmp/cmp"
	"github.com/google/go-cmp/cmp/cmpopts"

	"google.golang.org/protobuf/testing/protocmp"
	"google.golang.org/protobuf/types/known/durationpb"

	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
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
							"target": "Resources",
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
							"target": "Resources",
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
							"target": "Resources",
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
							"target": "Resources",
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
							"target": "Resources",
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
		"MultipleExpressions": {
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
									"cluster",
									"nodepool",
									"vpc"
								]
							},
							"target": "Resources",
							"value": "cluster: {\n\tapiVersion: \"nobu.dev/v1\"\n\tkind:       \"Cluster\"\n\tmetadata: name: \"example-cluster\"\n}\nnodepool: {\n\tapiVersion: \"nobu.dev/v1\"\n\tkind:       \"Nodepool\"\n\tmetadata: name: \"example-nodepool\"\n}\nvpc: {\n\tapiVersion: \"nobu.dev/v1\"\n\tkind:       \"Vpc\"\n\tmetadata: name: \"example-vpc\"\n}\n"
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
						},
					},
				},
			},
		},
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
							"target": "Resources",
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
							"target": "Resources",
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
		"TagInjection": {
			reason: "Injections from XR should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "injection"
						},
						"export": {
							"options": {
								"inject": [
									{
										"name": "env",
										"path": "spec.env"
									}
								]
							},
							"target": "Resources",
							"value": "#env: string @tag(env)\n\napiVersion: \"eks.nobu.dev/v1\"\nkind:       \"Cluster\"\nmetadata: {\n\tannotations: {\n\t\tregion: \"us-east-1\"\n\t}\n\tname: \"example\"\n\tlabels: {\n\t\tapp:            \"example\"\n\t\tenv:            #env\n\t\tclassification: \"controlplane\"\n\t}\n}\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR","spec":{"env":"prod"}}`),
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR","spec":{"env":"prod"}}`),
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
							Message:  "created resource \"example:Cluster\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR","spec":{"env":"prod"}}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"injection": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "eks.nobu.dev/v1",
									"kind": "Cluster",
									"metadata": {
										"annotations": {
											"region": "us-east-1"
										},
										"name": "example",
										"labels": {
											"app": "example",
											"env": "prod",
											"classification": "controlplane"
										}
                                    }
								}`),
							},
						},
					},
				},
			},
		},
		"InjectionsWithExpressions": {
			reason: "Injections combined with Expressions from XR should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "injectionexpression"
						},
						"export": {
							"options": {
								"inject": [
									{
										"name": "env",
										"path": "spec.env"
									},
									{
										"name": "region",
										"path": "spec.region"
									}
								],
								"expressions": [
									"cluster.example"
								]
							},
							"target": "Resources",
							"value": "#env:    string @tag(env,short=development|staging|production)\n#region: string @tag(region)\n\ncluster: [ID=_]: {\n\tapiVersion: \"eks.nobu.dev/v1\"\n\tkind:       \"Cluster\"\n\tmetadata: name: ID\n\tmetadata: labels: {\n\t\tapp:            ID\n\t\tenv:            #env\n\t\tclassification: string\n\t}\n\t// we always have one namesake container\n}\ncluster: example: metadata: {\n\tannotations: {\n\t\t\"region\": #region\n\t}\n\tlabels: {\n\t\t\"classification\": \"controlplane\"\n\t}\n}\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR","spec":{"env":"prod", "region":"us-east-1"}}`),
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR","spec":{"env":"prod", "region":"us-east-1"}}`),
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
							Message:  "created resource \"example:Cluster\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR","spec":{"env":"prod", "region":"us-east-1"}}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"injectionexpression": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "eks.nobu.dev/v1",
									"kind": "Cluster",
									"metadata": {
										"annotations": {
											"region": "us-east-1"
										},
										"name": "example",
										"labels": {
											"app": "example",
											"env": "prod",
											"classification": "controlplane"
										}
									}
								}`),
							},
						},
					},
				},
			},
		},
		"XRTargetting": {
			reason: "XR Targetting should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "xrtargetting"
						},
						"export": {
							"target": "XR",
							"value": "metadata: name: \"example\"\nmetadata: labels: {\n\tapp:            \"example\"\n\tenv:            \"prod\"\n\tclassification: \"controlplane\"\n}\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{
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
							Message:  "updated xr \"example:XR\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{
								"apiVersion": "example.org/v1",
								"kind": "XR",
								"metadata": {
									"name": "example",
									"labels": {
										"app": "example",
										"classification": "controlplane",
										"env": "prod"
									}
								}
							}`),
						},
						Resources: map[string]*fnv1beta1.Resource{},
					},
				},
			},
		},
		"PatchXRKind": {
			reason: "XR Targetting should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "xr-overwrite"
						},
						"export": {
							"target": "XR",
							"overwrite": true,
							"value": "kind: \"Overwrite\"\nmetadata: name: \"example\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{
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
							Message:  "updated xr \"example:Overwrite\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"Overwrite","metadata":{"name":"example"}}`),
						},
						Resources: map[string]*fnv1beta1.Resource{},
					},
				},
			},
		},
		"PatchDesiredComposed": {
			reason: "PatchDesired Resource should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchDesired",
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: forProvider: router: \"somerouter\"\nspec: forProvider: region: \"ap-northeast-1\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"patch-existing": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									}
								}`),
							},
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
							Message:  "updated resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"patch-existing": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									},
									"spec": {
										"forProvider": {
											"region": "ap-northeast-1",
											"router": "somerouter"
										}
									}
								}`),
							},
						},
					},
				},
			},
		},
		"PatchDesiredComposedTargetCorrectly": {
			reason: "PatchDesired Resource targeting should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchDesired",
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: forProvider: router: \"somerouter\"\nspec: forProvider: region: \"ap-northeast-1\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"patch-existing": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									}
								}`),
							},
							"dont-patch-existing-kind-mismatch": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "notme",
									"metadata": {
										"name": "testname"
									}
								}`),
							},
							"dont-patch-existing-name-mismatch": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "notthisone"
									}
								}`),
							},
							"dont-patch-otherone": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "anotherone",
									"metadata": {
										"name": "somethingsomething"
									}
								}`),
							},
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
							Message:  "updated resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"patch-existing": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									},
									"spec": {
										"forProvider": {
											"region": "ap-northeast-1",
											"router": "somerouter"
										}
									}
								}`),
							},
							"dont-patch-existing-kind-mismatch": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "notme",
									"metadata": {
										"name": "testname"
									}
								}`),
							},
							"dont-patch-existing-name-mismatch": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "notthisone"
									}
								}`),
							},
							"dont-patch-otherone": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "anotherone",
									"metadata": {
										"name": "somethingsomething"
									}
								}`),
							},
						},
					},
				},
			},
		},
		"PatchResourcesSingular": {
			reason: "PatchResources targeting should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname"
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: forProvider: router: \"somerouter\"\nspec: forProvider: region: \"ap-northeast-1\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"testname": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									},
									"spec": {
										"forProvider": {
											"region": "ap-northeast-1",
											"router": "somerouter"
										}
									}
								}`),
							},
						},
					},
				},
			},
		},
		"PatchSingularMergeAnnotations": {
			reason: "PatchResources annotations should merge",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing-annotations"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname",
											"annotations": {
												"kubernetes.io/existing": "true",
												"kubernetes.io/serviceaccount": "somesa"
											}
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nmetadata: annotations: \"kubernetes.io/newone\": \"hello\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"testname": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname",
										"annotations": {
											"kubernetes.io/existing": "true",
											"kubernetes.io/newone": "hello",
											"kubernetes.io/serviceaccount": "somesa"
										}
									}
								}`),
							},
						},
					},
				},
			},
		},
		"OverwritePatchSingularMergeAnnotations": {
			reason: "PatchResources annotations should merge",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing-annotations"
						},
						"export": {
							"overwrite": true,
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname",
											"annotations": {
												"kubernetes.io/existing": "true",
												"kubernetes.io/serviceaccount": "somesa"
											}
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nmetadata: annotations: \"kubernetes.io/serviceaccount\": \"newsa\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"testname": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname",
										"annotations": {
											"kubernetes.io/existing": "true",
											"kubernetes.io/serviceaccount": "newsa"
										}
									}
								}`),
							},
						},
					},
				},
			},
		},
		"OverwritePatchSingularMergeLabels": {
			reason: "PatchResources annotations should merge",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing-annotations"
						},
						"export": {
							"overwrite": true,
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname",
											"labels": {
												"component": "someservices",
												"stable": "label"
											}
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nmetadata: labels: \"additional\": \"news\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"testname": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname",
										"labels": {
											"additional": "news",
											"component": "someservices",
											"stable": "label"
										}
									}
								}`),
							},
						},
					},
				},
			},
		},

		"PatchResourcesMultiple": {
			reason: "PatchResources should be able to patch multiple resources",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchResources",
							"options": {
								"expressions": [
									"yaml.MarshalStream(output)"
								]
							},
							"resources": [
								{
									"name": "bucket",
									"base": {
									 	"apiVersion": "nobu.dev/v1",
										 "kind": "Bucket",
										 "metadata": {
										  	"name": "test-bucket"
										 }
									}
								},
								{
									"name": "iam-user",
									"base": {
										 "apiVersion": "nobu.dev/v1",
										 "kind": "User",
										 "metadata": {
										   "name": "test-user"
										 }
									}
								},
								{
									"name": "iam-role",
									"base": {
										 "apiVersion": "nobu.dev/v1",
										 "kind": "Role",
										 "metadata": {
										  	"name": "test-role"
										 }
									}
								}
							],
							"value": "output: [ \n  {\n    // Target the bucket by apiVersion+kind+name\n    apiVersion: \"nobu.dev/v1\"\n    kind: \"Bucket\"\n    metadata: name: \"test-bucket\"\n    \n    // Add fields here\n    metadata: annotations: {\n        \"nobu.dev/cueified\": \"true\",\n        \"nobu.dev/app\": \"someapp\",\n    }\n    \n    spec: forProvider: policy: \"some-bucket-policy\"\n  }, \n  {\n    // Target the user by apiVersion+kind+name\n    apiVersion: \"nobu.dev/v1\"\n    kind: \"User\"\n    metadata: name: \"test-user\"\n    \n    // Add fields here\n    metadata: annotations: {\n        \"nobu.dev/cueified\": \"true\",\n        \"nobu.dev/app\": \"someapp\",\n    }\n\n    spec: forProvider: name: \"somename\"\n  }, \n  {\n    // Target the bucket by apiVersion+kind+name\n    apiVersion: \"nobu.dev/v1\"\n    kind: \"Role\"\n    metadata: name: \"test-role\"\n    \n    // Add fields here\n    metadata: annotations: {\n        \"nobu.dev/cueified\": \"true\",\n        \"nobu.dev/app\": \"someapp\",\n    }\n    \n    spec: forProvider: policy: \"some-role-policy\"\n  },\n]\n\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"test-bucket:Bucket\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"test-role:Role\"",
						},
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"test-user:User\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"test-bucket": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Bucket",
									"metadata": {
										"annotations": {
											"nobu.dev/app": "someapp",
											"nobu.dev/cueified": "true"
										},
										"name": "test-bucket"
									},
									"spec": {
										"forProvider": {
											"policy": "some-bucket-policy"
										}
									}
								}`),
							},
							"test-user": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "User",
									"metadata": {
										"annotations": {
											"nobu.dev/app": "someapp",
											"nobu.dev/cueified": "true"
										},
										"name": "test-user"
									},
									"spec": {
										"forProvider": {
											"name": "somename"
										}
									}
								}`),
							},
							"test-role": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Role",
									"metadata": {
										"annotations": {
											"nobu.dev/app": "someapp",
											"nobu.dev/cueified": "true"
										},
										"name": "test-role"
									},
									"spec": {
										"forProvider": {
											"policy": "some-role-policy"
										}
									}
								}`),
							},
						},
					},
				},
			},
		},
		"PatchResourcesTargeted": {
			reason: "PatchResources targeting should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-nodepool",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "Cluster",
										"metadata": {
											"name": "dedpool"
										}
									}
								},
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname"
										}
									}
								},
								{
									"name": "example-network",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "Cluster",
										"metadata": {
											"name": "testnetwork"
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: forProvider: router: \"somerouter\"\nspec: forProvider: region: \"ap-northeast-1\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"testname": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									},
									"spec": {
										"forProvider": {
											"region": "ap-northeast-1",
											"router": "somerouter"
										}
									}
								}`),
							},
							"dedpool": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind":       "Cluster",
									"metadata": {
										"name": "dedpool"
									}
								}`),
							},
							"testnetwork": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "Cluster",
									"metadata": {
										"name": "testnetwork"
									}
								}`),
							},
						},
					},
				},
			},
		},
		"ConnectionDetailsPatchResources": {
			reason: "PatchResources targeting should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname"
										}
									}
								}
							],
							"value": "#connectionDetails: [\n\t{\n\t\tMatch: {\n\t\t\tapiVersion: \"nobu.dev/v1\"\n\t\t\tkind:       \"findme\"\n\t\t\tname:       \"testname\"\n\t\t}\n\n\t\tName:                    \"testname\"\n\t\tType:                    \"FromConnectionSecretKey\"\n\t\tFromConnectionSecretKey: \"thisisthekey\"\n\t},\n]\napiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: forProvider: router: \"somerouter\"\nspec: forProvider: region: \"ap-northeast-1\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{
							"observe-connections": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									}
								}`),
								ConnectionDetails: map[string][]byte{
									"thisisthekey": []byte("secretvalue"),
								},
							},
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
							Message:  "created resource \"testname:findme\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
							ConnectionDetails: map[string][]byte{
								"testname": []byte("secretvalue"),
							},
						},
						Resources: map[string]*fnv1beta1.Resource{
							"testname": {
								Resource: resource.MustStructJSON(`{
									"apiVersion": "nobu.dev/v1",
									"kind": "findme",
									"metadata": {
										"name": "testname"
									},
									"spec": {
										"forProvider": {
											"region": "ap-northeast-1",
											"router": "somerouter"
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

func TestRunFunctionFailures(t *testing.T) {

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
		"ConflictingValuesPatchResources": {
			reason: "Conflicting Values without overwrite, PatchResources should fail",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname"
										},
										"spec": {
											"conflicting": "existingval"
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: conflicting: \"setattempt\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_FATAL,
							Message:  "cannot add resources to DesiredComposed: cannot set data existing desired composed object: spec.conflicting: conflicting values \"existingval\" and \"setattempt\"",
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
		},
		"ConflictingPatchXRKind": {
			reason: "XR Targetting should work",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "xr-overwrite"
						},
						"export": {
							"target": "XR",
							"value": "kind: \"Overwrite\"\nmetadata: name: \"example\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{
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
							Severity: fnv1beta1.Severity_SEVERITY_FATAL,
							Message:  "cannot add resources to XR: cannot set data on xr: kind: conflicting values \"XR\" and \"Overwrite\"",
						},
					},
					Desired: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
						Resources: map[string]*fnv1beta1.Resource{},
					},
				},
			},
		},
		"FailMatchingTargets": {
			reason: "PatchResources targeting should fail if gvk+name do not match",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "incorrectname"
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: forProvider: router: \"somerouter\"\nspec: forProvider: region: \"ap-northeast-1\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_FATAL,
							Message:  "cannot match resources to input resources: failed to match all resources, found 0 / 1 patches",
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
		},
		"FailMatchingMultipleTargets": {
			reason: "PatchResources targeting should fail if gvk+name do not match",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "incorrectname"
										}
									}
								},
								{
									"name": "example-cluster2",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "incorrectkind",
										"metadata": {
											"name": "testname"
										}
									}
								},
								{
									"name": "example-cluster3",
									"base": {
										"apiVersion": "fail.example.org/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname"
										}
									}
								},
								{
									"name": "example-cluster4",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "incorrectkind",
										"metadata": {
											"name": "incorrectname"
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nspec: forProvider: router: \"somerouter\"\nspec: forProvider: region: \"ap-northeast-1\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_FATAL,
							Message:  "cannot match resources to input resources: failed to match all resources, found 0 / 1 patches",
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
		},
		"FailOverwritePatchSingularMergeAnnotations": {
			reason: "PatchResources annotations should merge",
			args: args{
				req: &fnv1beta1.RunFunctionRequest{
					Input: resource.MustStructJSON(`{
						"apiVersion": "dummy.fn.crossplane.io",
						"kind": "dummy",
						"metadata": {
							"name": "patch-existing-annotations"
						},
						"export": {
							"target": "PatchResources",
							"resources": [
								{
									"name": "example-cluster",
									"base": {
										"apiVersion": "nobu.dev/v1",
										"kind": "findme",
										"metadata": {
											"name": "testname",
											"annotations": {
												"kubernetes.io/existing": "true",
												"kubernetes.io/serviceaccount": "somesa"
											}
										}
									}
								}
							],
							"value": "apiVersion: \"nobu.dev/v1\"\nkind: \"findme\"\nmetadata: name: \"testname\"\nmetadata: annotations: \"kubernetes.io/serviceaccount\": \"newsa\"\n"
						}
					}`),
					Observed: &fnv1beta1.State{
						Composite: &fnv1beta1.Resource{
							Resource: resource.MustStructJSON(`{"apiVersion":"example.org/v1","kind":"XR"}`),
						},
					},
					Desired: &fnv1beta1.State{},
				},
			},
			want: want{
				rsp: &fnv1beta1.RunFunctionResponse{
					Meta: &fnv1beta1.ResponseMeta{Ttl: durationpb.New(response.DefaultTTL)},
					Results: []*fnv1beta1.Result{
						{
							Severity: fnv1beta1.Severity_SEVERITY_FATAL,
							Message:  "cannot add resources to DesiredComposed: cannot set data existing desired composed object: metadata.annotations[kubernetes.io/serviceaccount]: conflicting values \"somesa\" and \"newsa\"",
						},
					},
					Desired: &fnv1beta1.State{},
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

func TestSetData(t *testing.T) {

	type args struct {
		data      map[string]interface{}
		on        any
		overwrite bool
	}
	type want struct {
		err error
		out any
	}

	cases := map[string]struct {
		reason string
		args   args
		want   want
	}{
		"DesiredComposedBasic": {
			reason: "DesiredComposed should be able to set basic data",
			args: args{
				data: map[string]interface{}{
					"kind": "testkind",
					"metadata": map[string]interface{}{
						"name": "testname",
						"annotations": map[string]interface{}{
							"nobu.dev/app": "someapp",
						},
					},
					"spec": map[string]interface{}{
						"forProvider": map[string]interface{}{
							"something": "somevalue",
						},
					},
				},
				on: &resource.DesiredComposed{
					Resource: composed.New(),
				},
			},
			want: want{
				out: &resource.DesiredComposed{
					Resource: &composed.Unstructured{
						Unstructured: unstructured.Unstructured{
							Object: map[string]interface{}{
								"metadata": map[string]interface{}{
									"annotations": map[string]interface{}{
										"nobu.dev/app": "someapp",
									},
								},
								"spec": map[string]interface{}{
									"forProvider": map[string]interface{}{
										"something": "somevalue",
									},
								},
							},
						},
					},
				},
			},
		},
		"DesiredComposedDeeperCopies": {
			reason: "DesiredComposed should be able to set basic data",
			args: args{
				data: map[string]interface{}{
					"apiVersion": "nobu.dev/v1",
					"kind":       "brother",
					"metadata": map[string]interface{}{
						"name": "ignored",
						"annotations": map[string]interface{}{
							"nobu.dev/app": "someapp",
						},
					},
					"spec": map[string]interface{}{
						"forProvider": map[string]interface{}{
							"something": "somevalue",
							"network":   "network",
							"clusterRef": map[string]interface{}{
								"name": "example-cluster",
							},
						},
						"template": map[string]interface{}{
							"spec": map[string]interface{}{
								"metadata": map[string]interface{}{
									"name": "testname",
									"labels": map[string]interface{}{
										"kubernetes.io/serviceaccount": "sa",
										"kubernetes.io/rbac":           "variant",
									},
								},
								"env": []string{
									"env1=env1val",
									"env2=env2val",
								},
							},
						},
					},
				},
				on: &resource.DesiredComposed{
					Resource: composed.New(),
				},
			},
			want: want{
				out: &resource.DesiredComposed{
					Resource: &composed.Unstructured{
						Unstructured: unstructured.Unstructured{
							Object: map[string]interface{}{
								"metadata": map[string]interface{}{
									"annotations": map[string]interface{}{
										"nobu.dev/app": "someapp",
									},
								},
								"spec": map[string]interface{}{
									"forProvider": map[string]interface{}{
										"something": "somevalue",
										"network":   "network",
										"clusterRef": map[string]interface{}{
											"name": "example-cluster",
										},
									},
									"template": map[string]interface{}{
										"spec": map[string]interface{}{
											"metadata": map[string]interface{}{
												"name": "testname",
												"labels": map[string]interface{}{
													"kubernetes.io/serviceaccount": "sa",
													"kubernetes.io/rbac":           "variant",
												},
											},
											"env": []any{
												"env1=env1val",
												"env2=env2val",
											},
										},
									},
								},
							},
						},
					},
				},
			},
		},
		"XRBasic": {
			reason: "XR should be able to set basic data",
			args: args{
				data: map[string]interface{}{
					"apiVersion": "nobu.dev/v1",
					"kind":       "testkind",
					"metadata": map[string]interface{}{
						"name": "testname",
						"annotations": map[string]interface{}{
							"nobu.dev/app": "someapp",
						},
					},
					"spec": map[string]interface{}{
						"forProvider": map[string]interface{}{
							"something": "somevalue",
						},
					},
				},
				on: &resource.Composite{
					Resource: composite.New(),
				},
			},
			want: want{
				out: &resource.Composite{
					Resource: &composite.Unstructured{
						Unstructured: unstructured.Unstructured{
							Object: map[string]interface{}{
								// XR sets gvk+name
								"apiVersion": "nobu.dev/v1",
								"kind":       "testkind",
								"metadata": map[string]interface{}{
									"name": "testname",
									"annotations": map[string]interface{}{
										"nobu.dev/app": "someapp",
									},
								},
								"spec": map[string]interface{}{
									"forProvider": map[string]interface{}{
										"something": "somevalue",
									},
								},
							},
						},
					},
				},
			},
		},
		"XROverwrite": {
			reason: "XR should be able to set overwrite data",
			args: args{
				data: map[string]interface{}{
					"kind": "testkind",
					"metadata": map[string]interface{}{
						"name": "testname",
						"annotations": map[string]interface{}{
							"nobu.dev/app": "someapp",
						},
					},
					"spec": map[string]interface{}{
						"forProvider": map[string]interface{}{
							"something": "somevalue",
						},
					},
				},
				on: &resource.Composite{
					Resource: &composite.Unstructured{
						Unstructured: unstructured.Unstructured{
							Object: map[string]interface{}{
								"kind": "overwriteme",
							},
						},
					},
				},
				overwrite: true,
			},
			want: want{
				out: &resource.Composite{
					Resource: &composite.Unstructured{
						Unstructured: unstructured.Unstructured{
							Object: map[string]interface{}{
								"kind": "testkind",
								"metadata": map[string]interface{}{
									"name": "testname",
									"annotations": map[string]interface{}{
										"nobu.dev/app": "someapp",
									},
								},
								"spec": map[string]interface{}{
									"forProvider": map[string]interface{}{
										"something": "somevalue",
									},
								},
							},
						},
					},
				},
			},
		},
		"XRDeeperCopy": {
			reason: "DesiredComposed should be able to set data at many levels without conflictions",
			args: args{
				data: map[string]interface{}{
					"apiVersion": "nobu.dev/v1",
					"kind":       "brother",
					"metadata": map[string]interface{}{
						"annotations": map[string]interface{}{
							"nobu.dev/app": "someapp",
						},
					},
					"spec": map[string]interface{}{
						"forProvider": map[string]interface{}{
							"network": "network",
							"clusterRef": map[string]interface{}{
								"name": "example-cluster",
							},
						},
						"template": map[string]interface{}{
							"spec": map[string]interface{}{
								"metadata": map[string]interface{}{
									"name": "testname",
									"labels": map[string]interface{}{
										"kubernetes.io/rbac": "variant",
									},
								},
								"env": []string{
									"env1=env1val",
									"env2=env2val",
								},
							},
						},
					},
				},
				on: &resource.Composite{
					Resource: &composite.Unstructured{
						Unstructured: unstructured.Unstructured{
							Object: map[string]interface{}{
								"metadata": map[string]interface{}{
									"name": "whatsinaname",
								},
								"spec": map[string]interface{}{
									"forProvider": map[string]interface{}{
										"another":   "existing",
										"something": "someothervalue",
									},
									"template": map[string]interface{}{
										"spec": map[string]interface{}{
											"metadata": map[string]interface{}{
												"labels": map[string]interface{}{
													"kubernetes.io/serviceaccount": "sa",
												},
											},
										},
									},
								},
							},
						},
					},
				},
			},
			want: want{
				out: &resource.Composite{
					Resource: &composite.Unstructured{
						Unstructured: unstructured.Unstructured{
							Object: map[string]interface{}{
								"apiVersion": "nobu.dev/v1",
								"kind":       "brother",
								"metadata": map[string]interface{}{
									"name": "whatsinaname",
									"annotations": map[string]interface{}{
										"nobu.dev/app": "someapp",
									},
								},
								"spec": map[string]interface{}{
									"forProvider": map[string]interface{}{
										"another":   "existing",
										"network":   "network",
										"something": "someothervalue",
										"clusterRef": map[string]interface{}{
											"name": "example-cluster",
										},
									},
									"template": map[string]interface{}{
										"spec": map[string]interface{}{
											"metadata": map[string]interface{}{
												"name": "testname",
												"labels": map[string]interface{}{
													"kubernetes.io/serviceaccount": "sa",
													"kubernetes.io/rbac":           "variant",
												},
											},
											"env": []any{
												"env1=env1val",
												"env2=env2val",
											},
										},
									},
								},
							},
						},
					},
				},
			},
		},
	}

	for name, tc := range cases {
		t.Run(name, func(t *testing.T) {
			err := setData(tc.args.data, "", tc.args.on, tc.args.overwrite)

			if diff := cmp.Diff(tc.want.out, tc.args.on, protocmp.Transform()); diff != "" {
				t.Errorf("%s\nf.RunFunction(...): -want rsp, +got rsp:\n%s", tc.reason, diff)
			}

			if diff := cmp.Diff(tc.want.err, err, cmpopts.EquateErrors()); diff != "" {
				t.Errorf("%s\nf.RunFunction(...): -want err, +got err:\n%s", tc.reason, diff)
			}
		})
	}
}