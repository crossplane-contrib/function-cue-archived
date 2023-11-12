// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudwatchlogs/v1beta1

package v1beta1

#DestinationPolicyObservation: {
	id?: null | string @go(ID,*string)
}

#DestinationPolicyParameters: {
	// The policy document. This is a JSON formatted string.
	// +kubebuilder:validation:Required
	accessPolicy?: null | string @go(AccessPolicy,*string)

	// Specify true if you are updating an existing destination policy to grant permission to an organization ID instead of granting permission to individual AWS accounts.
	// +kubebuilder:validation:Optional
	forceUpdate?: null | bool @go(ForceUpdate,*bool)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// DestinationPolicySpec defines the desired state of DestinationPolicy
#DestinationPolicySpec: {
	forProvider: #DestinationPolicyParameters @go(ForProvider)
}

// DestinationPolicyStatus defines the observed state of DestinationPolicy.
#DestinationPolicyStatus: {
	atProvider?: #DestinationPolicyObservation @go(AtProvider)
}

// DestinationPolicy is the Schema for the DestinationPolicys API. Provides a CloudWatch Logs destination policy.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DestinationPolicy: {
	spec:    #DestinationPolicySpec   @go(Spec)
	status?: #DestinationPolicyStatus @go(Status)
}

// DestinationPolicyList contains a list of DestinationPolicys
#DestinationPolicyList: {
	items: [...#DestinationPolicy] @go(Items,[]DestinationPolicy)
}