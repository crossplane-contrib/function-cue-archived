# Readiness Checks

function-cue has the ability to propogate readinessChecks from the observed resources
into the xr

#### Enabling

The readiness checks must be defined in the cue template `#readinessChecks`

```cue
// Following the schema
#matchConditionReadinessCheck: {
        // Type indicates the type of condition you'd like to use.
        // https://pkg.go.dev/github.com/crossplane/crossplane-runtime@v1.13.0/apis/common/v1#ConditionType
        Type: "Ready" | "Synced"

        // Status is the status of the condition you'd like to match.
        // https://pkg.go.dev/k8s.io/api/core/v1#ConditionStatus
        Status: "True" | "False" | "Unknown"
}

#match: {
        apiVersion: string
        kind:       string
        name:       string
}

#readinessCheck: {
        // Used to match the ObservedComposed Resource to pull the values from
        Match: #match

        // Type indicates the type of probe to use.
        Type: "MatchCondition" | "MatchEmpty" | "MatchInteger" | "MatchString" | "MatchTrue" | "MatchFalse" | "None"

        // FieldPath shows the path of the field whose value will be used.
        FieldPath?: string

        // MatchString is the value you'd like to match if you're using "MatchString" type.
        MatchString?: string

        // MatchInt is the value you'd like to match if you're using "MatchInt" type.
        MatchInteger?: int64

        // MatchCondition specifies the condition you'd like to match if you're using "MatchCondition" type.
        MatchCondition?: #matchConditionReadinessCheck
}

#readinessChecks: [...#readinessCheck] & [
    // insert details here
]
```

This data will be evaluated by function-cue and the values will be propagated to the xr.
If there are no details found, then the xr will not receive any propagation

#### TODO

allow for individual `#readinessChecks` to be specified within each document. This
would allow the match association to not need to be specified twice

This can be achieved by either, with either, on the instance

no expression:

- add additional expression for `#readinessCheck`, to check if there is a single connectionDetail
  within the document
- if there is any amount of nonstream expressions, take those expressions and also add an
  another with the origianl `$expr.#readinessCheck` etc..
- if there is a stream expression, add the additional expression to get the connection details
  per stream `yaml.MarshalStream(list.FlattenN([for e in $expr {e.#readinessCheck}], 2))`
