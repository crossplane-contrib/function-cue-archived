package main

import (
	"context"
	"fmt"
	"sort"
	"strings"

	"github.com/Mitsuwa/function-cue/input/v1beta1"

	"github.com/crossplane/crossplane-runtime/pkg/errors"
	"github.com/crossplane/crossplane-runtime/pkg/logging"
	rresource "github.com/crossplane/crossplane-runtime/pkg/resource"
	fnv1beta1 "github.com/crossplane/function-sdk-go/proto/v1beta1"
	"github.com/crossplane/function-sdk-go/request"
	"github.com/crossplane/function-sdk-go/resource"
	"github.com/crossplane/function-sdk-go/resource/composed"
	"github.com/crossplane/function-sdk-go/response"

	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
	"k8s.io/apimachinery/pkg/util/json"
)

// Function returns whatever response you ask it to.
type Function struct {
	fnv1beta1.UnimplementedFunctionRunnerServiceServer

	log logging.Logger
}

// RunFunction runs the Function.
//
// ** Compilation **
//
// # Run cueCompile and get the output
// # Based off of cue CUEInput.Export.Value stored in the request
//
//	** Targeting **
//
// # Controlled by CUEInput.Export.Target
//
// Add this data to either the Observed XR,
// Specific Existing Desired XRs,
// Or new DesiredComposed resources are created,
//
// TODO(nobu): refactor this
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
		"target", in.Export.Target,
	)

	// The composite resource desired by previous functions in the pipeline.
	dxr, err := request.GetDesiredCompositeResource(req)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "cannot get desired composite resource"))
		return rsp, nil
	}
	dxr.Resource.SetAPIVersion(oxr.Resource.GetAPIVersion())
	dxr.Resource.SetKind(oxr.Resource.GetKind())

	// The composed resources desired by any previous Functions in the pipeline.
	desired, err := request.GetDesiredComposedResources(req)
	if err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot get desired composed resources from %T", req))
		return rsp, nil
	}
	log.Debug(fmt.Sprintf("DesiredComposed resources: %d", len(desired)))
	// The composed resources desired by any previous Functions in the pipeline.
	observed, err := request.GetObservedComposedResources(req)
	if err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot get desired composed resources from %T", req))
		return rsp, nil
	}
	log.Debug(fmt.Sprintf("ObservedComposed resources: %d", len(observed)))

	var (
		outputFmt = outputJSON
	)
	// If there is only 1 expression, check if the expression itself is a stream
	// If so, it should also be TXT output
	if len(in.Export.Options.Expressions) == 1 && strings.Contains(in.Export.Options.Expressions[0], "MarshalStream") {
		outputFmt = outputTXT
	} else if len(in.Export.Options.Expressions) > 1 {
		// Multiple expressions are always a stream
		outputFmt = outputJSON
	}
	// Build the cue (-t --inject) tags off of values from the Observed XR
	tags, err := buildTags(in.Export.Options.Inject, oxr)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed building tags"))
		return rsp, nil
	}

	// Run cueCompile to get the output
	// Ignore the string output because it is already parsed with
	// parseData: true
	// The output used is produced as []map[string]interface{}
	log.Info("compiling cue template from input")
	cmpOut, err := cueCompile(outputFmt, *in, compileOpts{
		parseData: true,
		tags:      tags,
	})
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed compiling cue template"))
		return rsp, nil
	}
	log.Debug(fmt.Sprintf("CUE compile output:\n%s", cmpOut.string))
	log.Debug(fmt.Sprintf("Connection Data: %+v\n", cmpOut.connectionData))

	// Add the compiled data to the desired resources
	// Based on the input target
	// Store the objects into the output object
	// For success messages later
	// TODO move this giant switch into some other function
	log.Info("Setting output to target")
	output := successOutput{
		target: in.Export.Target,
	}
	conf := addResourcesConf{
		overwrite: in.Export.Overwrite,
	}
	switch output.target {
	case v1beta1.XR:
		conf.data = cmpOut.data
		if err := addResourcesTo(dxr, conf); err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "cannot add resources to XR"))
			return rsp, nil
		}
		output.object = dxr
		output.msgCount = 1
	case v1beta1.PatchDesired:
		log.Debug("Matching PatchDesired Resources")
		desiredMatches, err := matchResources(desired, cmpOut.data)
		if err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "cannot match resources to desired"))
			return rsp, nil
		}
		log.Debug(fmt.Sprintf("Matched %+v", desiredMatches))

		if err := addResourcesTo(desiredMatches, conf); err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "cannot update existing DesiredComposed"))
			return rsp, nil
		}
		output.object = cmpOut.data
		output.msgCount = len(cmpOut.data)
	case v1beta1.PatchResources:
		// Render the List of DesiredComposed resources from the input
		// Update the existing desired map to be created as a base
		for _, r := range in.Export.Resources {
			tmp := &resource.DesiredComposed{Resource: composed.New()}

			if err := renderFromJSON(tmp.Resource, r.Base.Raw); err != nil {
				response.Fatal(rsp, errors.Wrapf(err, "cannot parse base template of composed resource %q", r.Name))
				return rsp, nil
			}

			desired[resource.Name(tmp.Resource.GetName())] = tmp
		}

		// Match the data to the desired resources
		desiredMatches, err := matchResources(desired, cmpOut.data)
		if err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "cannot match resources to input resources"))
			return rsp, nil
		}

		if err := addResourcesTo(desiredMatches, conf); err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "cannot add resources to DesiredComposed"))
			return rsp, nil
		}
		output.object = cmpOut.data
		output.msgCount = len(cmpOut.data)
	case v1beta1.Resources:
		conf.basename = in.Name
		conf.data = cmpOut.data
		if err := addResourcesTo(desired, conf); err != nil {
			response.Fatal(rsp, errors.Wrapf(err, "cannot add resources to DesiredComposed"))
			return rsp, nil
		}
		// Pass data here instead of desired
		// This is because there already may be desired objects
		output.object = cmpOut.data
		output.msgCount = len(cmpOut.data)
	}

	// Get the connection details and propagate them to the xr
	conn, err := extractConnectionDetails(observed, cmpOut.connectionData)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "cannot get connection details from ObservedComposed"))
		return rsp, nil
	}
	log.Debug(fmt.Sprintf("Setting %d connectionDetails", len(conn)))
	for k, v := range conn {
		dxr.ConnectionDetails[k] = v
	}

	// Reconcile the readiness data from observed -> desired
	// depending on readiness propagation configuration from readinessData
	// set dxr to ready if all the readiness checks pass
	err = reconcileReadiness(dxr, observed, desired, cmpOut.readinessData)
	if err != nil {
		response.Fatal(rsp, errors.Wrap(err, "failed checking readiness: xr is not ready"))
		return rsp, nil
	}

	// Set dxr and desired state
	log.Debug("Setting desired XR state to %+v", dxr.Resource)
	if err := response.SetDesiredCompositeResource(rsp, dxr); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot set desired composite resource in %T", rsp))
		return rsp, nil
	}

	for _, d := range desired {
		log.Debug(fmt.Sprintf("Setting DesiredComposed state to %+v", d.Resource))
	}
	if err := response.SetDesiredComposedResources(rsp, desired); err != nil {
		response.Fatal(rsp, errors.Wrapf(err, "cannot set desired composed resources in %T", rsp))
		return rsp, nil
	}
	log.Debug(fmt.Sprintf("Set %d resource(s) to the desired state", output.msgCount))

	// Output success
	output.setSuccessMsgs()
	for _, msg := range output.msgs {
		rsp.Results = append(rsp.Results, &fnv1beta1.Result{
			Severity: fnv1beta1.Severity_SEVERITY_NORMAL,
			Message:  msg,
		})
	}

	log.Info("Successfully processed function-cue resources",
		"input", in.Name)

	return rsp, nil
}

// renderFromJSON renders the supplied resource from JSON bytes.
func renderFromJSON(o rresource.Object, data []byte) error {
	if err := json.Unmarshal(data, o); err != nil {
		return errors.Wrap(err, "cannot unmarshal JSON data")
	}
	return nil
}

// desiredMatch matches a list of data to apply to a desired resource
// This is used when targeting PatchDesired resources
type desiredMatch map[*resource.DesiredComposed][]map[string]interface{}

// matchResources finds and associates the data to the desired resource
// The length of the passed data should match the total count of desired match data
func matchResources(desired map[resource.Name]*resource.DesiredComposed, data []map[string]interface{}) (desiredMatch, error) {
	// Looks through the current desired match and matches an object based on the name+kind
	findDesired := func(desired map[resource.Name]*resource.DesiredComposed, apiVersion, name, kind string) *resource.DesiredComposed {
		for _, d := range desired {
			if d.Resource.GetName() == name && d.Resource.GetKind() == kind && d.Resource.GetAPIVersion() == apiVersion {
				return d
			}
		}
		return nil
	}

	// Iterate over the data patches and match them to desired resources
	matches := make(desiredMatch)
	count := 0
	// Get total count of all the match patches to apply
	// this count should match the initial count of the supplied data
	// otherwise we lost something somewhere
	for _, d := range data {
		u := unstructured.Unstructured{Object: d}
		// PatchDesired
		if found := findDesired(desired, u.GetAPIVersion(), u.GetName(), u.GetKind()); found != nil {
			if _, ok := matches[found]; !ok {
				matches[found] = []map[string]interface{}{d}
			} else {
				matches[found] = append(matches[found], d)
			}
			count++
		}
	}
	if count != len(data) {
		return matches, fmt.Errorf("failed to match all resources, found %d / %d patches", count, len(data))
	}

	return matches, nil
}

type successOutput struct {
	target   v1beta1.Target
	object   any
	msgCount int
	msgs     []string
}

// setSuccessMsgs generates the success messages for the input data
func (output *successOutput) setSuccessMsgs() {
	output.msgs = make([]string, output.msgCount)
	switch output.target {
	case v1beta1.Resources:
		desired := output.object.([]map[string]interface{})
		j := 0
		for _, d := range desired {
			u := unstructured.Unstructured{Object: d}
			output.msgs[j] = fmt.Sprintf("created resource \"%s:%s\"", u.GetName(), u.GetKind())
			j++
		}
	case v1beta1.PatchDesired:
		desired := output.object.([]map[string]interface{})
		j := 0
		for _, d := range desired {
			u := unstructured.Unstructured{Object: d}
			output.msgs[j] = fmt.Sprintf("updated resource \"%s:%s\"", u.GetName(), u.GetKind())
			j++
		}
	case v1beta1.PatchResources:
		desired := output.object.([]map[string]interface{})
		j := 0
		for _, d := range desired {
			u := unstructured.Unstructured{Object: d}
			output.msgs[j] = fmt.Sprintf("created resource \"%s:%s\"", u.GetName(), u.GetKind())
			j++
		}
	case v1beta1.XR:
		o := output.object.(*resource.Composite)
		output.msgs[0] = fmt.Sprintf("updated xr \"%s:%s\"", o.Resource.GetName(), o.Resource.GetKind())
	}
	sort.Strings(output.msgs)
}

type addResourcesConf struct {
	basename  string
	data      []map[string]interface{}
	overwrite bool
}

// addResourcesTo adds the given data to any allowed object passed
// Will return err if the object is not of a supported type
// For 'desired' composed resources, the basename is used for the resource name
// For 'xr' resources, the basename must match the xr name
// For 'existing' resources, the basename must match the resource name
func addResourcesTo(o any, conf addResourcesConf) error {
	// Merges data with the desired composed resource
	// Values from data overwrite the desired composed resource
	merged := func(data map[string]interface{}, from *resource.DesiredComposed) map[string]interface{} {
		merged := make(map[string]interface{})
		for k, v := range from.Resource.UnstructuredContent() {
			merged[k] = v
		}
		// patch data overwrites existing desired composed data
		for k, v := range data {
			merged[k] = v
		}
		return merged
	}

	switch o.(type) {
	case map[resource.Name]*resource.DesiredComposed:
		// Resources
		desired := o.(map[resource.Name]*resource.DesiredComposed)
		name := resource.Name(conf.basename)
		for _, d := range conf.data {
			u := unstructured.Unstructured{
				Object: d,
			}

			// Add the resource name as a suffix to the basename
			// if there are multiple resources to add
			if len(conf.data) > 1 {
				name = resource.Name(fmt.Sprintf("%s-%s", conf.basename, u.GetName()))
			}
			// If the value exists, merge its existing value with the patches
			if v, ok := desired[name]; ok {
				mergedData := merged(d, v)
				u = unstructured.Unstructured{Object: mergedData}
			}
			desired[name] = &resource.DesiredComposed{
				Resource: &composed.Unstructured{
					Unstructured: u,
				},
			}
		}
	case desiredMatch:
		// PatchDesired
		matches := o.(desiredMatch)
		// Set the Match data on the desired resource stored as keys
		for obj, matchData := range matches {
			// There may be multiple data patches to the DesiredComposed object
			for _, d := range matchData {
				if err := setData(d, "", obj, conf.overwrite); err != nil {
					return errors.Wrap(err, "cannot set data existing desired composed object")
				}
			}
		}
	case *resource.Composite:
		// XR
		for _, d := range conf.data {
			if err := setData(d, "", o, conf.overwrite); err != nil {
				return errors.Wrap(err, "cannot set data on xr")
			}
		}
	default:
		return fmt.Errorf("cannot add configuration to %T: invalid type for obj", o)
	}
	return nil
}

var (
	errNoSuchField = "no such field"
)

// setData is a recursive function that is intended to build a kube fieldpath valid
// JSONPath(s) of the given object, it will then copy from 'data' at the given path
// to the passed o object - at the same path, overwrite defines if this function should
// be allowed to overwrite values or not, if not return cue like conflicting value error
func setData(data any, path string, o any, overwrite bool) error {
	switch val := data.(type) {
	case map[string]interface{}:
		// Check if the parent field is annotations or labels
		// if so wrap the key in [] instead of . prefix
		//
		// Check if the suffix for validation, this is because there may be metadata annotations on deeper level items
		isWrapped := false
		if strings.HasSuffix(path, ".metadata.annotations") || strings.HasSuffix(path, ".metadata.labels") {
			isWrapped = true
		}

		for key, value := range val {
			var newKey string
			if isWrapped {
				newKey = fmt.Sprintf("%s[%s]", path, key)
			} else {
				newKey = fmt.Sprintf("%s.%v", path, key)
			}
			if err := setData(value, newKey, o, overwrite); err != nil {
				return err
			}
		}
	case []interface{}:
		for i, value := range val {
			newPath := fmt.Sprintf("%s[%d]", path, i)
			if err := setData(value, newPath, o, overwrite); err != nil {
				return err
			}
		}
	default:
		// Reached a leaf node, add the JSON path to the desired resource
		switch o.(type) {
		case *resource.DesiredComposed:
			path = strings.TrimPrefix(path, ".")

			// Because we match on gvk+name, there is no need to set this
			// ignore setting these again because this will conflict with the overwrite settings
			if path == "apiVersion" || path == "kind" || path == "metadata.name" {
				return nil
			}

			r := o.(*resource.DesiredComposed).Resource
			if curVal, err := r.GetValue(path); err != nil && !strings.Contains(err.Error(), errNoSuchField) {
				return errors.Wrapf(err, "getting %s:%s in xr failed", path, data)
			} else if curVal != nil && !overwrite {
				return fmt.Errorf("%s: conflicting values %q and %q", path, curVal, data)
			}

			if err := r.SetValue(path, data); err != nil {
				return errors.Wrapf(err, "setting %s:%s in dxr failed", path, data)
			}
		case *resource.Composite:
			path = strings.TrimPrefix(path, ".")

			// The composite does not do any matching to update so there is no need to skip here
			// on apiVersion, kind or metadata.name

			r := o.(*resource.Composite).Resource
			if curVal, err := r.GetValue(path); err != nil && !strings.Contains(err.Error(), errNoSuchField) {
				return errors.Wrapf(err, "getting %s:%s in xr failed", path, data)
			} else if curVal != nil && !overwrite {
				return fmt.Errorf("%s: conflicting values %q and %q", path, curVal, data)
			}

			if err := r.SetValue(path, data); err != nil {
				return errors.Wrapf(err, "setting %s:%s in dxr failed", path, data)
			}
		default:
			return fmt.Errorf("cannot set data on %T: invalid type for obj", o)
		}
	}
	return nil
}
