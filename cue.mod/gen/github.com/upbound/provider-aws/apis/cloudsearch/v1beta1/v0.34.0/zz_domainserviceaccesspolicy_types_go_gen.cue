// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudsearch/v1beta1

package v1beta1

#DomainServiceAccessPolicyObservation: {
	// The access rules you want to configure. These rules replace any existing rules. See the AWS documentation for details.
	accessPolicy?: null | string @go(AccessPolicy,*string)

	// The CloudSearch domain name the policy applies to.
	domainName?: null | string @go(DomainName,*string)
	id?:         null | string @go(ID,*string)
}

#DomainServiceAccessPolicyParameters: {
	// The access rules you want to configure. These rules replace any existing rules. See the AWS documentation for details.
	// +kubebuilder:validation:Optional
	accessPolicy?: null | string @go(AccessPolicy,*string)

	// The CloudSearch domain name the policy applies to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/cloudsearch/v1beta1.Domain
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	domainName?: null | string @go(DomainName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// DomainServiceAccessPolicySpec defines the desired state of DomainServiceAccessPolicy
#DomainServiceAccessPolicySpec: {
	forProvider: #DomainServiceAccessPolicyParameters @go(ForProvider)
}

// DomainServiceAccessPolicyStatus defines the observed state of DomainServiceAccessPolicy.
#DomainServiceAccessPolicyStatus: {
	atProvider?: #DomainServiceAccessPolicyObservation @go(AtProvider)
}

// DomainServiceAccessPolicy is the Schema for the DomainServiceAccessPolicys API. Provides an CloudSearch domain service access policy resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DomainServiceAccessPolicy: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.accessPolicy)",message="accessPolicy is a required parameter"
	spec:    #DomainServiceAccessPolicySpec   @go(Spec)
	status?: #DomainServiceAccessPolicyStatus @go(Status)
}

// DomainServiceAccessPolicyList contains a list of DomainServiceAccessPolicys
#DomainServiceAccessPolicyList: {
	items: [...#DomainServiceAccessPolicy] @go(Items,[]DomainServiceAccessPolicy)
}