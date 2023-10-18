# target: `Resources`

The `CUEInput` export `Resources` target is utilized to specify **New** resources to be created.

The documents generated must have an `apiVersion`, `kind` and `name` associated to them.

## TODO

- If a resource's (to be created) gvk+name match a resource from the cue generation - return error