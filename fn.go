package main

import (
	"context"
	"cuelang.org/go/cue"
	"cuelang.org/go/internal/encoding"
	"github.com/crossplane/crossplane-runtime/pkg/errors"
	"github.com/crossplane/crossplane-runtime/pkg/logging"
	fnv1beta1 "github.com/crossplane/function-sdk-go/proto/v1beta1"
	"github.com/crossplane/function-sdk-go/request"
	"github.com/crossplane/function-sdk-go/response"
	"github.com/crossplane/function-template-go/input/v1beta1"
)

// Function returns whatever response you ask it to.
type Function struct {
	fnv1beta1.UnimplementedFunctionRunnerServiceServer

	log logging.Logger
}

// RunFunction runs the Function.
func (f *Function) RunFunction(_ context.Context, req *fnv1beta1.RunFunctionRequest) (*fnv1beta1.RunFunctionResponse, error) {
	f.log.Info("Running Function", "tag", req.GetMeta().GetTag())

	rsp := response.To(req, response.DefaultTTL)

	in := &v1beta1.Input{}
	if err := request.GetInput(req, in); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot get Function input from %T", req))
		return rsp, nil
	}

	response.Normalf(rsp, "I was run with input %q", in.Export.Value)

	cfg := &encoding.Config{}
	enc, err := encoding.NewEncoder(in.Export.Options.Outfile, cfg)
	if err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot create encoder for %q", in.Export.Options.Outfile))
		return rsp, nil
	}

	err = enc.Encode(cue.Value(in.Export.Value))
	if err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot encode %q", in.Export.Value))
		return rsp, nil
	}

	return rsp, nil
}