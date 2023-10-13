# ConfigMaps

TODO

Configmaps can be used to store additional `CUE` files.
These files can be referenced in the `Input` template using the `configMaps`
field and be added to the build

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
        configMaps:
        - name: name-of-configmap
          key: key-of-cue-file
        export:
          value: |
            ...
```