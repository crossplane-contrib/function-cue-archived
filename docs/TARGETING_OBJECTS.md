# Targeting Objects

`cue export` can target various types of objects:

- `Resources` default: create new resources
- `PatchDesired` set fields on existing `DesiredComposed` Resources
  - The `metadata.name` and `kind` must match
- `PatchResources` set fields on existing `CUEInput.Resources` fields.  These resources will then be added to the desired resources map
  - The `metadata.name` and `kind` must match
- `XR` set fields on the `XR`

This is controlled by fields on the `CUEInput`

```yaml
apiVersion: apiextensions.crossplane.io/v1
kind: Composition
metadata:
  name: test-cue
spec:
  compositeTypeRef:
    apiVersion: database.example.com/v1alpha1
    kind: RDS
  mode: Pipeline
  pipeline:
  - step: run-cue-function
    functionRef:
      name: function-cue
    input:
      apiVersion: template.fn.crossplane.io/v1beta1
      kind: CUEInput
      metadata:
        name: basic
      export:
        # default: Resources
        target: PatchDesired | PatchResources | Resources | XR
        value: |
          ...
```