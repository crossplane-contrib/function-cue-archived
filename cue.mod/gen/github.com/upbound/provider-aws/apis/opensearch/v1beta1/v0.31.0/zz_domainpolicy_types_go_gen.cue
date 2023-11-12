// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/opensearch/v1beta1

package v1beta1

#DomainPolicyObservation: {
	id?: null | string @go(ID,*string)
}

#DomainPolicyParameters: {
	// IAM policy document specifying the access policies for the domain
	// +kubebuilder:validation:Required
	accessPolicies?: null | string @go(AccessPolicies,*string)

	// Name of the domain.
	// +crossplane:generate:reference:type=Domain
	// +kubebuilder:validation:Optional
	domainName?: null | string @go(DomainName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// DomainPolicySpec defines the desired state of DomainPolicy
#DomainPolicySpec: {
	forProvider: #DomainPolicyParameters @go(ForProvider)
}

// DomainPolicyStatus defines the observed state of DomainPolicy.
#DomainPolicyStatus: {
	atProvider?: #DomainPolicyObservation @go(AtProvider)
}

// DomainPolicy is the Schema for the DomainPolicys API. Provides an OpenSearch Domain Policy.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DomainPolicy: {
	spec:    #DomainPolicySpec   @go(Spec)
	status?: #DomainPolicyStatus @go(Status)
}

// DomainPolicyList contains a list of DomainPolicys
#DomainPolicyList: {
	items: [...#DomainPolicy] @go(Items,[]DomainPolicy)
}