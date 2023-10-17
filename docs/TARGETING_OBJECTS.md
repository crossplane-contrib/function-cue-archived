# Targeting Objects

`cue export` can target various types of objects:

- `Resources` default: create new resources
- `Existing` set fields on existing `DesiredComposed` Resources
  - The `metadata.name` and `kind` must match
- `XR` set fields on the `XR`

This is controlled by fields on the `Input`

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
        target: XR | Resources | Existing
        value: |
          ...
```