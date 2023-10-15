# Supported Export Options

`--expression`

Configured under the `CUEInput.export.expression` field

```yaml
apiVersion: apiextensions.crossplane.io/v1
kind: Composition
metadata:
  name: test-cue
spec:
  compositeTypeRef:
    apiVersion: database.example.com/v1alpha1
    kind: NoSQL
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
        expression: yaml.MarshalStream(output)
        value: |
          output: [
            ...
          ]
```