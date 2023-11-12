// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/elb/v1beta1

package v1beta1

#PolicyAttributeObservation: {
	name?:  null | string @go(Name,*string)
	value?: null | string @go(Value,*string)
}

#PolicyAttributeParameters: {
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/elb/v1beta1.Policy
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("policy_name",false)
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#PolicyObservation: {
	// The ID of the policy.
	id?: null | string @go(ID,*string)

	// The load balancer on which the policy is defined.
	loadBalancerName?: null | string @go(LoadBalancerName,*string)

	// Policy attribute to apply to the policy.
	policyAttribute?: [...#PolicyAttributeObservation] @go(PolicyAttribute,[]PolicyAttributeObservation)

	// The name of the load balancer policy.
	policyName?: null | string @go(PolicyName,*string)

	// The policy type.
	policyTypeName?: null | string @go(PolicyTypeName,*string)
}

#PolicyParameters: {
	// The load balancer on which the policy is defined.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/elb/v1beta1.ELB
	// +kubebuilder:validation:Optional
	loadBalancerName?: null | string @go(LoadBalancerName,*string)

	// Policy attribute to apply to the policy.
	// +kubebuilder:validation:Optional
	policyAttribute?: [...#PolicyAttributeParameters] @go(PolicyAttribute,[]PolicyAttributeParameters)

	// The name of the load balancer policy.
	// +kubebuilder:validation:Optional
	policyName?: null | string @go(PolicyName,*string)

	// The policy type.
	// +kubebuilder:validation:Optional
	policyTypeName?: null | string @go(PolicyTypeName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// PolicySpec defines the desired state of Policy
#PolicySpec: {
	forProvider: #PolicyParameters @go(ForProvider)
}

// PolicyStatus defines the observed state of Policy.
#PolicyStatus: {
	atProvider?: #PolicyObservation @go(AtProvider)
}

// Policy is the Schema for the Policys API. Provides a load balancer policy, which can be attached to an ELB listener or backend server.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Policy: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.policyName)",message="policyName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.policyTypeName)",message="policyTypeName is a required parameter"
	spec:    #PolicySpec   @go(Spec)
	status?: #PolicyStatus @go(Status)
}

// PolicyList contains a list of Policys
#PolicyList: {
	items: [...#Policy] @go(Items,[]Policy)
}