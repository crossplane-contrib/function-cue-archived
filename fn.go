package main

import (
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

	in := &v1beta1.Input{}
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

	out, err := cueCompile(inputCUE, functionExport, outputJSON, in.Export.Value)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed compiling cue template"))
		return rsp, nil
	}

	var data interface{}
	if err := json.Unmarshal([]byte(out), &data); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "failed unmarshalling JSON:\n%s", out))
		return rsp, nil
	}

	name := resource.Name(in.Name)
	desired[name] = &resource.DesiredComposed{Resource: composed.New()}
	if err := setData(data, "", desired[name]); err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed setting data"))
	}

	// Is this necessary?
	if err := validateObjects(desired); err != nil {
		response.Fatal(rsp, errors.Wrap(err, "object validation failed, must have apiVersion, kind, and name"))
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

func validateObjects(objs map[resource.Name]*resource.DesiredComposed) error {
	for _, obj := range objs {
		if obj.Resource.GetKind() == "" {
			return errors.New("kind must be set")
		}
		if obj.Resource.GetAPIVersion() == "" {
			return errors.New("apiVersion must be set")
		}
		if obj.Resource.GetName() == "" {
			return errors.New("name must be set")
		}
	}
	return nil
}