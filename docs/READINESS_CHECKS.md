# Readiness Checks

function-cue has the ability to propogate readinessChecks from the observed resources
into the xr

#### Enabling

The readiness checks are defined in the cue template, per document's, `readinessChecks?: [...#readinessCheck]`

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

#readinessCheck: {
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
```

This data will be evaluated by function-cue and the values will be propagated to the xr.
If there are no details found, then the xr will not receive any propagation
