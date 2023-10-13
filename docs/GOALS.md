### Goals

1. Unaltered implementation of `cue export` for use in [Composition Functions](https://docs.crossplane.io/latest/concepts/composition-functions/)
   1. Add no additional opinions to configuration generation that are not given from the [core principles of cuelang](https://cuelang.org/docs/about/#philosophy-and-principles)

### TODO

1. Option to apply cue output to XR vs additional Resources
1. All of the `cue export` optional args to be implemented
   1. The most important being injecting variables, and expression
1. Add support for loading cue files from configmap
1. Add support for crossplane Environments to be _"injected_" into `cue export`
1. Support `cue def` ?