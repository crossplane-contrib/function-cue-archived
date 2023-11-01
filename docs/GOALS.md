### Goals

1. Unaltered implementation of `cue export` for use in [Composition Functions](https://docs.crossplane.io/latest/concepts/composition-functions/)
   1. [Core principles of cuelang](https://cuelang.org/docs/about/#philosophy-and-principles)

### TODO

1. Support importing non stdlib packages
1. All of the `cue export` optional args to be implemented - see [EXPORT_OPTIONS.md](EXPORT_OPTIONS.md)
1. Add support for loading cue files from configmap
   1. For example, identifiers can be stored in configmaps for managed resources
1. Add support for crossplane Environments to be _"injected"_ into `cue export`
1. Support label selectors for Patch matching
   1. Because of the way gvk+name is used for selection, this means you cannot overwrite these fields
      adding support for label selection or desired composed name selection will allow for this overwriting as well
1. `go:generate` support to generate schema and identifiers, stored in configMaps, for `MRs` schema's from `provider-aws` `provider-gcp` and `provider-azure`
   1. configMap support + generation of MR schema will allow for crossplane administrators
      to combine these functionalities with `xrender`, which can solve schema verification on MRs
      see previous [issue ask](https://github.com/crossplane-contrib/crossplane-lint/issues/6)
1. Support `cue def` ?
   1. Store output in a configmap
