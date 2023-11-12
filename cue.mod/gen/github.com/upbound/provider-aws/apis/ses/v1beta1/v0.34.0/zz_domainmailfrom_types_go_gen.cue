// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ses/v1beta1

package v1beta1

#DomainMailFromObservation: {
	// The action that you want Amazon SES to take if it cannot successfully read the required MX record when you send an email. Defaults to UseDefaultValue. See the SES API documentation for more information.
	behaviorOnMxFailure?: null | string @go(BehaviorOnMxFailure,*string)

	// Verified domain name or email identity to generate DKIM tokens for.
	domain?: null | string @go(Domain,*string)

	// The domain name.
	id?: null | string @go(ID,*string)

	// Subdomain (of above domain) which is to be used as MAIL FROM address
	mailFromDomain?: null | string @go(MailFromDomain,*string)
}

#DomainMailFromParameters: {
	// The action that you want Amazon SES to take if it cannot successfully read the required MX record when you send an email. Defaults to UseDefaultValue. See the SES API documentation for more information.
	// +kubebuilder:validation:Optional
	behaviorOnMxFailure?: null | string @go(BehaviorOnMxFailure,*string)

	// Verified domain name or email identity to generate DKIM tokens for.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ses/v1beta1.DomainIdentity
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("domain",false)
	// +kubebuilder:validation:Optional
	domain?: null | string @go(Domain,*string)

	// Subdomain (of above domain) which is to be used as MAIL FROM address
	// +kubebuilder:validation:Optional
	mailFromDomain?: null | string @go(MailFromDomain,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// DomainMailFromSpec defines the desired state of DomainMailFrom
#DomainMailFromSpec: {
	forProvider: #DomainMailFromParameters @go(ForProvider)
}

// DomainMailFromStatus defines the observed state of DomainMailFrom.
#DomainMailFromStatus: {
	atProvider?: #DomainMailFromObservation @go(AtProvider)
}

// DomainMailFrom is the Schema for the DomainMailFroms API. Provides an SES domain MAIL FROM resource
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DomainMailFrom: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.mailFromDomain)",message="mailFromDomain is a required parameter"
	spec:    #DomainMailFromSpec   @go(Spec)
	status?: #DomainMailFromStatus @go(Status)
}

// DomainMailFromList contains a list of DomainMailFroms
#DomainMailFromList: {
	items: [...#DomainMailFrom] @go(Items,[]DomainMailFrom)
}