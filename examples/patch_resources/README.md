# target: `PatchResources`

The `CUEInput` export `PatchResources` target is utilized to patch `CUEInput.Export.Resources`

The documents generated must have an `apiVersion`, `kind` and `name` associated to them.

This apiVersion+kind+name is used to match the `CUEInput.Export.Resources` resources.

If the patch count does not match the number of generated documents (not found documents), `function-cue` will error

### TODO

- Merging annotations and labels