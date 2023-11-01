# Connection Details

function-cue has the ability to propogate connection details from the observed resources
into the xr

#### Enabling

The connection details are defined in the cue template, per document's, `connectionDetails?: [...#connectionDetail]`

```cue
// Following the Schema
#connectionDetailType: "FromConnectionSecretKey" | "FromFieldPath" | "FromValue"

#connectionDetail: {
	// Name of the connection secret key that will be propagated to the
	// connection secret of the composed resource.
	Name: string

	// Type sets the connection detail fetching behavior to be used. Each
	// connection detail type may require its own fields to be set on the
	// ConnectionDetail object.
	Type: #connectionDetailType

	// FromConnectionSecretKey is the key that will be used to fetch the value
	// from the composed resource's connection secret.
	FromConnectionSecretKey?: string

	// FromFieldPath is the path of the field on the composed resource whose
	// value to be used as input. Name must be specified if the type is
	// FromFieldPath.
	FromFieldPath?: string

	// Value that will be propagated to the connection secret of the composite
	// resource. May be set to inject a fixed, non-sensitive connection secret
	// value, for example a well-known port.
	Value?: string
}
```

This data will be evaluated by function-cue and the values will be propagated to the xr.
If there are no details found, then the xr will not receive any propagation
