package main

import (
	"context"
	"fmt"
	"github.com/crossplane/crossplane-runtime/pkg/fieldpath"
	"github.com/crossplane/function-sdk-go/resource"
	"github.com/crossplane/function-sdk-go/resource/composed"
	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
	"k8s.io/apimachinery/pkg/runtime"
	"sort"
	"strings"

	"github.com/Mitsuwa/function-cue/input/v1beta1"

	"github.com/crossplane/crossplane-runtime/pkg/errors"
	"github.com/crossplane/crossplane-runtime/pkg/logging"
	fnv1beta1 "github.com/crossplane/function-sdk-go/proto/v1beta1"
	"github.com/crossplane/function-sdk-go/request"
	"github.com/crossplane/function-sdk-go/response"
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
		outputFmt = outputJSON
	)
	// If there is only 1 epxression, check if the expression itself is a stream
	// If so, it should also be TXT output
	if len(in.Export.Options.Expressions) == 1 && strings.Contains(in.Export.Options.Expressions[0], "MarshalStream") {
		outputFmt = outputTXT
	} else if len(in.Export.Options.Expressions) > 1 {
		// Multiple expressions are always a stream
		outputFmt = outputJSON
	}

	tags, err := buildTags(in.Export.Options.Inject, oxr)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed building tags"))
		return rsp, nil
	}

	data, _, err := cueCompile(outputFmt, *in, compileOpts{
		parseData: true,
		tags:      tags,
	})
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed compiling cue template"))
		return rsp, nil
	}

	if err := addResourcesTo(desired, in.Name, data); err != nil {
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
	j := 0
	for _, r := range desired {
		successTargets[j] = fmt.Sprintf("%s:%s", r.Resource.GetName(), r.Resource.GetKind())
		j++
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

func buildTags(tags []v1beta1.Tag, xr *resource.Composite) ([]string, error) {
	res := make([]string, len(tags))
	for i, t := range tags {
		fromMap, err := runtime.DefaultUnstructuredConverter.ToUnstructured(xr.Resource)
		if err != nil {
			return res, errors.Wrapf(err, "cannot convert xr %q to unstructured", xr.Resource.GetName())
		}

		in, err := fieldpath.Pave(fromMap).GetValue(t.Path)
		if err != nil {
			return res, errors.Wrapf(err, "cannot get value from path %q", t.Path)
		}

		res[i] = fmt.Sprintf("%s=%s", t.Name, in)
	}
	return res, nil
}

type exportTarget string

const (
	targetXR                exportTarget = "XR"
	targetNewResources      exportTarget = "Resources"
	targetExistingResources exportTarget = "Existing"
)

// addResourcesTo adds the given data to any allowed object passed
// Will return err if the object is not of a supported type
// For 'desired' composed resources, the basename is used for the resource name
// For 'xr' resources, the basename must match the xr name
// For 'existing' resources, the basename must match the resource name
func addResourcesTo[T any](obj T, basename string, data []map[string]interface{}) error {
	o := any(obj)
	switch o.(type) {
	case map[resource.Name]*resource.DesiredComposed:
		desired := o.(map[resource.Name]*resource.DesiredComposed)
		name := resource.Name(basename)
		for _, d := range data {
			u := unstructured.Unstructured{
				Object: d,
			}

			// If there are multiple resources to add
			// Add the resource name as a suffix to the basename
			if len(data) > 1 {
				name = resource.Name(fmt.Sprintf("%s-%s", basename, u.GetName()))
			}
			desired[name] = &resource.DesiredComposed{
				Resource: &composed.Unstructured{
					Unstructured: u,
				},
			}
		}
		// TODO Add additional cases
	default:
		return fmt.Errorf("cannot add configuration to %T: invalid type for obj", obj)
	}
	return nil
}