# Supported Export Options

`-e, --expression`

`stringArray : export this expression only`

Configured under the `CUEInput.Export.Options.Expressions` field

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
      apiVersion: cue.fn.crossplane.io/v1beta1
      kind: CUEInput
      metadata:
        name: basic
      export:
        options:
          expressions:
          - yaml.MarshalStream(output)
        value: |
          output: [
            ...
          ]
```

`-t, --inject`

`stringArray : set the value of a tagged field`


Allows for injecting fields from the Observed XR into the cue template `@tag` fields.
The tags injected are configured under the `CUEInput.Export.Options.Inject` field

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
      apiVersion: cue.fn.crossplane.io/v1beta1
      kind: CUEInput
      metadata:
        name: basic
      export:
        options:
          inject:
          - name: "tagname"         # Name of the cue template @tag($name) to inject into
            path: "metadata.name"   # Fieldpath of the ObservedXR to inject
        value: |
          name: string @tag(tagname)
```

`--out`

`string : output format (run 'cue filetypes' for more info)`

Used for testing. Controlled by `cueOutputFmt` types
