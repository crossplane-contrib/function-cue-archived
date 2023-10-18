# target: `PatchResources`

The `CUEInput` export `PatchResources` target is utilized to patch `CUEInput.Export.Resources`

The documents generated must have a kind and name associated to them.

This kind+name is used to match the `CUEInput.Export.Resources` resources.

If the patch count does not match the number of generated documents (not found documents), `function-cue` will error

### TODO

- add apiVersion targeting as well
- Merging annotations and labels