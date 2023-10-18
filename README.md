# cue-function

A [cuelang](https://cuelang.org/) integration for Crossplane's [Composition Functions](https://docs.crossplane.io/latest/concepts/composition-functions/).

This function is based on [/play](https://cuelang.org/play) [codebase](https://github.com/cue-lang/cuelang.org/blob/master/play/main.go) and [cmd](https://github.com/cue-lang/cue/blob/master/cmd/cue/cmd/export.go)

## Purpose

This function is intended to give a crossplane composition creator the ability to compile and run cue templates within a composition function
The user can target the compilation output to various objects within the `DesiredResources`, `XR` or `Resources` passed into the `CUEInput`

#### Targeting Patches

See [Targeting Objects](docs/TARGETING_OBJECTS.md) for info on utilizing the types of targets

```
Resources (default)
PatchDesired
PatchResources
XR
```

## Expected Function Input

See the kubebuilder generated [CRD](package/input/template.fn.crossplane.io_cueinputs.yaml) or the [go definition](input/v1beta1/input.go)

## Expected Output

The compilation output of the `CUEInput.Export.Value` **must** be in `YAML` or `JSON` documents, or it will fail parsing.
Each document produced should be a valid crossplane resource `xr` or `mr`

Ex `cueCompile()` output

#### json
`single`
```json
{
  "apiVersion": "nobu.dev/v1",
  "kind": "XCluster",
  "metadata": {
    "name": "my-cluster"
  }
}
```

`multiple` - single json document per line, `-e json.MarshalStream(field)` will produce this format
```json
{"apiVersion": "nobu.dev/v1", "kind": "XCluster", "metadata": {"name": "my-cluster"}}
{"apiVersion": "nobu.dev/v1", "kind": "XNetwork", "metadata": {"name": "my-network"}}
```

#### yaml
`single`
```yaml
apiVersion: "nobu.dev/v1"
kind: "XCluster"
metadata:
  name: "my-cluster"
```

`multiple` documents, separated by `---`, `-e yaml.MarshalStream(field)` will produce this format
```yaml
apiVersion: "nobu.dev/v1"
kind: "XCluster"
metadata:
  name: "my-cluster"
---
apiVersion: "nobu.dev/v1"
kind: "XNetwork"
metadata:
  name: "my-network"
...
```

## CUE Version supported

`v0.6.0`

## Command Support

### `export`

Runs `cue export` based off of a cue template provided by the `CUEInput.Export.Value` field

See the currently supported [options](docs/EXPORT_OPTIONS.md)

## Installing

```yaml
apiVersion: pkg.crossplane.io/v1beta1
kind: Function
metadata:
  name: function-cue
spec:
  package: mitsuwa/function-cue:v0.1.0
```

## Example Compositions

See [examples folder](examples)


## Debugging

Logs are emitted to the Function's pod logs. Look for the Function pod in `crossplane-system`.

[Crossplane]: https://crossplane.io
[function-design]: https://github.com/crossplane/crossplane/blob/3996f20/design/design-doc-composition-functions.md
[function-pr]: https://github.com/crossplane/crossplane/pull/4500
[new-crossplane-issue]: https://github.com/crossplane/crossplane/issues/new?assignees=&labels=enhancement&projects=&template=feature_request.md
[install-master-docs]: https://docs.crossplane.io/v1.13/software/install/#install-pre-release-crossplane-versions
[proto-schema]: https://github.com/crossplane/function-sdk-go/blob/main/proto/v1beta1/run_function.proto
[grpcurl]: https://github.com/fullstorydev/grpcurl