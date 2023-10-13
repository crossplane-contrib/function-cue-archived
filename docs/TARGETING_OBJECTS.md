# Targeting Objects

TODO

`cue export` can target various types of objects:

- `Resources` default: create new resources
- `ExistingResources` output to existing Resources, selected by `desired[resource.Name]`
  - The `metadata.name` and `kind` must match
- `XR` apply the output to the `XR`

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
      kind: Input
      metadata:
        name: basic
      export:
        target: XR | Resources | ExistingResources
        value: |
          ...
```