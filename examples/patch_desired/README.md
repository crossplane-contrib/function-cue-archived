# target: `PatchDesired`

The `CUEInput` export `PatchDesired` target is utilized to patch `DesiredComposed` resources of the `XR`

The documents generated must have an `apiVersion`, `kind` and `name` associated to them.

This apiVersion+kind+name is used to match the `DesiredComposed` resources.

If the patch count does not match the number of generated documents (not found documents), `function-cue` will error

### TODO

- Merging annotations and labels - see meta.AddAnnotations and meta.AddLabels