# cue-function

A [cuelang](https://cuelang.org/) integration for Crossplane's [Composition Functions](https://docs.crossplane.io/latest/concepts/composition-functions/).

This function is based on [/play](https://cuelang.org/play) [codebase](https://github.com/cue-lang/cuelang.org/blob/master/play/main.go) and [cmd](https://github.com/cue-lang/cue/blob/master/cmd/cue/cmd/export.go)

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

## Targeting Patches

See [Targeting Objects](docs/TARGETING_OBJECTS.md) for info on updating the three types of objects

```
Resources (default)
Existing
XR
```

## Example Compositions

See [examples folder](examples)

## Desired State output

function-cue will return a desired resources created by the input.Export.Value field.  The input must specify at least a `kind`, `apiVersion`, `metadata.Name` fields.

## Debugging

Logs are emitted to the Function's pod logs. Look for the Function pod in `crossplane-system`.

[Crossplane]: https://crossplane.io
[function-design]: https://github.com/crossplane/crossplane/blob/3996f20/design/design-doc-composition-functions.md
[function-pr]: https://github.com/crossplane/crossplane/pull/4500
[new-crossplane-issue]: https://github.com/crossplane/crossplane/issues/new?assignees=&labels=enhancement&projects=&template=feature_request.md
[install-master-docs]: https://docs.crossplane.io/v1.13/software/install/#install-pre-release-crossplane-versions
[proto-schema]: https://github.com/crossplane/function-sdk-go/blob/main/proto/v1beta1/run_function.proto
[grpcurl]: https://github.com/fullstorydev/grpcurl