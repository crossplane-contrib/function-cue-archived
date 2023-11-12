// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/cloudfront/v1alpha1

package v1alpha1

// ResponseHeadersPolicyParameters defines the desired state of ResponseHeadersPolicy
#ResponseHeadersPolicyParameters: {
	// Region is which region the ResponseHeadersPolicy will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// Contains metadata about the response headers policy, and a set of configurations
	// that specify the HTTP headers.
	// +kubebuilder:validation:Required
	responseHeadersPolicyConfig?: null | #ResponseHeadersPolicyConfig @go(ResponseHeadersPolicyConfig,*ResponseHeadersPolicyConfig)

	#CustomResponseHeadersPolicyParameters
}

// ResponseHeadersPolicySpec defines the desired state of ResponseHeadersPolicy
#ResponseHeadersPolicySpec: {
	forProvider: #ResponseHeadersPolicyParameters @go(ForProvider)
}

// ResponseHeadersPolicyObservation defines the observed state of ResponseHeadersPolicy
#ResponseHeadersPolicyObservation: {
	// The version identifier for the current version of the response headers policy.
	eTag?: null | string @go(ETag,*string)

	// The URL of the response headers policy.
	location?: null | string @go(Location,*string)

	// Contains a response headers policy.
	responseHeadersPolicy?: null | #ResponseHeadersPolicy_SDK @go(ResponseHeadersPolicy,*ResponseHeadersPolicy_SDK)
}

// ResponseHeadersPolicyStatus defines the observed state of ResponseHeadersPolicy.
#ResponseHeadersPolicyStatus: {
	atProvider?: #ResponseHeadersPolicyObservation @go(AtProvider)
}

// ResponseHeadersPolicy is the Schema for the ResponseHeadersPolicies API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ResponseHeadersPolicy: {
	spec:    #ResponseHeadersPolicySpec   @go(Spec)
	status?: #ResponseHeadersPolicyStatus @go(Status)
}

// ResponseHeadersPolicyList contains a list of ResponseHeadersPolicies
#ResponseHeadersPolicyList: {
	items: [...#ResponseHeadersPolicy] @go(Items,[]ResponseHeadersPolicy)
}