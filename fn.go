package main

import (
	"bufio"
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"sort"
	"strings"

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

	var (
		outputFmt  = outputJSON
		streamType cueOutputFmt
	)
	for _, expr := range in.Export.Options.Expressions {
		// Streams for json or yaml need to be parsed as text
		if strings.Contains(expr, "MarshalStream") {
			outputFmt = outputTXT

			if strings.HasPrefix(expr, string(outputJSON)) {
				streamType = outputJSON
			} else if strings.HasPrefix(expr, string(outputYAML)) {
				streamType = outputYAML
			} else {
				response.Fatal(rsp, fmt.Errorf("unknown stream type %s", expr))
				return rsp, nil
			}
		}
	}
	cmpOut, err := cueCompile(inputCUE, functionExport, outputFmt, *in)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed compiling cue template"))
		return rsp, nil
	}

	if err := addResourcesTo(desired, in, cmpOut, outputFmt, streamType); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot add resources to desired"))
		return rsp, nil
	}

	if err := response.SetDesiredCompositeResource(rsp, dxr); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot set desired composite resource in %T", rsp))
		return rsp, nil
	}

	if err := response.SetDesiredComposedResources(rsp, desired); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot set desired composed resources in %T", rsp))
		return rsp, nil
	}

	successTargets := make([]string, len(desired))
	i := 0
	for _, r := range desired {
		successTargets[i] = fmt.Sprintf("%s:%s", r.Resource.GetName(), r.Resource.GetKind())
		i++
	}
	sort.Strings(successTargets)
	for _, target := range successTargets {
		rsp.Results = append(rsp.Results, &fnv1beta1.Result{
			Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
			Message:  fmt.Sprintf("created resource %q", target),
		})
	}

	log.Info("Successfully processed function-cue resources",
		"input", in.Name)

	return rsp, nil
}

func addResourcesTo(desired map[resource.Name]*resource.DesiredComposed, in *v1beta1.CUEInput, output string, outFmt cueOutputFmt, streamType cueOutputFmt) error {
	var (
		data map[string]interface{}
	)
	// If there are no expressions, expect a JSON object
	if outFmt == outputJSON {
		if err := json.Unmarshal([]byte(output), &data); err != nil {
			return errors.Wrapf(err, "failed unmarshalling JSON:\n%s", output)
		}

		name := resource.Name(in.Name)
		desired[name] = &resource.DesiredComposed{
			Resource: &composed.Unstructured{
				Unstructured: unstructured.Unstructured{
					Object: data,
				},
			},
		}
	} else {
		// If there are MarshalStream expressions, the output will be 'text'
		// The streamType will determine the document formats
		scanner := bufio.NewScanner(bytes.NewReader([]byte(output)))
		var document string
		for scanner.Scan() {
			line := scanner.Text()
			// Check if there are multiple documents
			if streamType == outputYAML {
				if line == fmt.Sprintf("---") {
					// End of document
					if err := yaml.Unmarshal([]byte(document), &data); err != nil {
						return errors.Wrapf(err, "failed unmarshalling YAML to JSON:\n%s", document)
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
			} else if streamType == outputJSON {
				// If the line is empty skip it
				if strings.TrimSuffix(line, "\n") == "" {
					continue
				}

				// JSON Documents come out line by line
				if err := json.Unmarshal([]byte(line), &data); err != nil {
					return errors.Wrapf(err, "failed unmarshalling JSON:\n%s", line)
				}

				tmp := unstructured.Unstructured{Object: data}
				name := resource.Name(in.Name + "-" + tmp.GetName())
				desired[name] = &resource.DesiredComposed{
					Resource: &composed.Unstructured{
						Unstructured: tmp,
					},
				}
				document = ""
				data = map[string]interface{}{}
			} else {
				return fmt.Errorf("unknown stream type %s", streamType)
			}
		}

		// Check if there is a document left over
		// this is only necessary for yaml documents since they are multiline and sepaarated by ---
		// If the multiline yaml ends with --- the document will get set to "" on sucess
		if document != "" && streamType == outputYAML {
			// End of document
			if err := yaml.Unmarshal([]byte(document), &data); err != nil {
				return errors.Wrapf(err, "failed unmarshalling YAML to JSON:\n%s", document)
			}

			tmp := unstructured.Unstructured{Object: data}
			name := resource.Name(in.Name + "-" + tmp.GetName())
			desired[name] = &resource.DesiredComposed{
				Resource: &composed.Unstructured{
					Unstructured: tmp,
				},
			}
		}
	}
	return nil
}