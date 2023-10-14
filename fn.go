package main

import (
	"bufio"
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"github.com/Mitsuwa/function-cue/input/v1beta1"
	"github.com/crossplane/crossplane-runtime/pkg/errors"
	"github.com/crossplane/crossplane-runtime/pkg/logging"
	fnv1beta1 "github.com/crossplane/function-sdk-go/proto/v1beta1"
	"github.com/crossplane/function-sdk-go/request"
	"github.com/crossplane/function-sdk-go/resource"
	"github.com/crossplane/function-sdk-go/resource/composed"
	"github.com/crossplane/function-sdk-go/response"
	"github.com/ghodss/yaml"
	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
)

// Function returns whatever response you ask it to.
type Function struct {
	fnv1beta1.UnimplementedFunctionRunnerServiceServer

	log logging.Logger
}

// RunFunction runs the Function.
func (f *Function) RunFunction(_ context.Context, req *fnv1beta1.RunFunctionRequest) (*fnv1beta1.RunFunctionResponse, error) {
	log := f.log.WithValues("tag", req.GetMeta().GetTag())
	log.Info("Running Function")

	rsp := response.To(req, response.DefaultTTL)

	in := &v1beta1.CUEInput{}
	if err := request.GetInput(req, in); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot get function input from %T", req))
		return rsp, nil
	}
	if err := in.Validate(); err != nil {
		response.Fatal(rsp, errors.Wrap(err, "invalid function input"))
		return rsp, nil
	}

	// The composite resource that actually exists.
	oxr, err := request.GetObservedCompositeResource(req)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "cannot get observed composite resource"))
		return rsp, nil
	}
	log = log.WithValues(
		"xr-version", oxr.Resource.GetAPIVersion(),
		"xr-kind", oxr.Resource.GetKind(),
		"xr-name", oxr.Resource.GetName(),
	)

	// The composite resource desired by previous functions in the pipeline.
	dxr, err := request.GetDesiredCompositeResource(req)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "cannot get desired composite resource"))
		return rsp, nil
	}
	dxr.Resource.SetAPIVersion(oxr.Resource.GetAPIVersion())
	dxr.Resource.SetKind(oxr.Resource.GetKind())

	// The composed resources that actually exist.
	// observed, err := request.GetObservedComposedResources(req)
	// if err != nil {
	// 	response.Fatal(rsp, errors.Wrapf(err, "cannot get observed composed resources from %T", req))
	// 	return rsp, nil
	// }

	// The composed resources desired by any previous Functions in the pipeline.
	desired, err := request.GetDesiredComposedResources(req)
	if err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot get desired composed resources from %T", req))
		return rsp, nil
	}

	outputFmt := outputJSON
	if len(in.Export.Options.Expressions) > 0 {
		outputFmt = outputTXT
	}
	out, err := cueCompile(inputCUE, functionExport, outputFmt, *in)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed compiling cue template"))
		return rsp, nil
	}

	var (
		data map[string]interface{}
	)
	// If there are no expressions, we expect a JSON object
	if len(in.Export.Options.Expressions) == 0 {
		if err := json.Unmarshal([]byte(out), &data); err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "failed unmarshalling JSON:\n%s", out))
			return rsp, nil
		}

		fmt.Printf("Setting: %+v\n", data)
		name := resource.Name(in.Name)
		desired[name] = &resource.DesiredComposed{
			Resource: &composed.Unstructured{
				Unstructured: unstructured.Unstructured{
					Object: data,
				},
			},
		}
	} else {
		// CUE Does not support outputting multiple JSON Documents with expressions
		// If there are expressions, the output will be 'text' and it will be expected to be YAML
		scanner := bufio.NewScanner(bytes.NewReader([]byte(out)))
		var document string
		for scanner.Scan() {
			line := scanner.Text()
			// Check if there are multiple documents
			if line == fmt.Sprintf("---") {
				// End of document
				if err := yaml.Unmarshal([]byte(document), &data); err != nil {
					response.Fatal(rsp, errors.Wrapf(err, "failed unmarshalling YAML to JSON:\n%s", document))
					return rsp, nil
				}

				tmp := unstructured.Unstructured{Object: data}
				name := resource.Name(in.Name + "-" + tmp.GetName())
				desired[name] = &resource.DesiredComposed{
					Resource: &composed.Unstructured{
						Unstructured: tmp,
					},
				}
				// Reset document and data
				document = ""
				data = map[string]interface{}{}
			} else {
				document += fmt.Sprintln(line)
			}
		}
		// End of document
		if err := yaml.Unmarshal([]byte(document), &data); err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "failed unmarshalling YAML to JSON:\n%s", document))
			return rsp, nil
		}

		tmp := unstructured.Unstructured{Object: data}
		name := resource.Name(in.Name + "-" + tmp.GetName())
		desired[name] = &resource.DesiredComposed{
			Resource: &composed.Unstructured{
				Unstructured: tmp,
			},
		}
	}

	if err := response.SetDesiredCompositeResource(rsp, dxr); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot set desired composite resource in %T", rsp))
		return rsp, nil
	}

	if err := response.SetDesiredComposedResources(rsp, desired); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot set desired composed resources in %T", rsp))
		return rsp, nil
	}

	for _, r := range desired {
		rsp.Results = append(rsp.Results, &fnv1beta1.Result{
			Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
			Message:  fmt.Sprintf("created resource %q of kind %q", r.Resource.GetName(), r.Resource.GetKind()),
		})
	}

	log.Info("Successfully processed function-cue resources",
		"input", in.Name)

	return rsp, nil
}