# Readiness Checks

function-cue has the ability to propogate readinessChecks from the observed resources
into the xr

#### Enabling

The readiness checks must be defined in the cue template `#readinessChecks`

```cue
// Following the Schema
#matchConditionReadinessCheck: {
	// Type indicates the type of condition you'd like to use.
	Type: string

	// Status is the status of the condition you'd like to match.
	Status: string
}

#match: {
	apiVersion: string
	kind:       string
	name:       string
}

#readinessCheck: {
    // Used for FromConnectionSecretKey and FromFieldPath to match the
    // ObservedComposed Resource to pull the values from
	Match?: #match

	// FieldPath shows the path of the field whose value will be used.
	FieldPath?: string

	// MatchString is the value you'd like to match if you're using "MatchString" type.
	MatchString?: string

	// MatchInt is the value you'd like to match if you're using "MatchInt" type.
	MatchInteger?: int64

	// MatchCondition specifies the condition you'd like to match if you're using "MatchCondition" type.
	MatchCondition?: #matchConditionReadinessCheck
}

#readinessChecks: [...#readinessChecks] & [
    // insert details here
]
```

This data will be evaluated by function-cue and the values will be propagated to the xr.
If there are no details found, then the xr will not receive any propagation

#### TODO

allow for individual `#connectionDetail` to be specified within each document. This
would allow the match association to not need to be specified twice
