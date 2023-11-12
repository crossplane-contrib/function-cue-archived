// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudfront/v1beta1

package v1beta1

#OriginAccessControlObservation: {
	// The description of the Origin Access Control. It may be empty.
	description?: null | string @go(Description,*string)

	// The current version of this Origin Access Control.
	etag?: null | string @go(Etag,*string)

	// The unique identifier of this Origin Access Control.
	id?: null | string @go(ID,*string)

	// A name that identifies the Origin Access Control.
	name?: null | string @go(Name,*string)

	// The type of origin that this Origin Access Control is for. The only valid value is s3.
	originAccessControlOriginType?: null | string @go(OriginAccessControlOriginType,*string)

	// Specifies which requests CloudFront signs. Specify always for the most common use case. Allowed values: always, never, no-override.
	signingBehavior?: null | string @go(SigningBehavior,*string)

	// Determines how CloudFront signs (authenticates) requests. Valid values: sigv4.
	signingProtocol?: null | string @go(SigningProtocol,*string)
}

#OriginAccessControlParameters: {
	// The description of the Origin Access Control. It may be empty.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// A name that identifies the Origin Access Control.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The type of origin that this Origin Access Control is for. The only valid value is s3.
	// +kubebuilder:validation:Optional
	originAccessControlOriginType?: null | string @go(OriginAccessControlOriginType,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Specifies which requests CloudFront signs. Specify always for the most common use case. Allowed values: always, never, no-override.
	// +kubebuilder:validation:Optional
	signingBehavior?: null | string @go(SigningBehavior,*string)

	// Determines how CloudFront signs (authenticates) requests. Valid values: sigv4.
	// +kubebuilder:validation:Optional
	signingProtocol?: null | string @go(SigningProtocol,*string)
}

// OriginAccessControlSpec defines the desired state of OriginAccessControl
#OriginAccessControlSpec: {
	forProvider: #OriginAccessControlParameters @go(ForProvider)
}

// OriginAccessControlStatus defines the observed state of OriginAccessControl.
#OriginAccessControlStatus: {
	atProvider?: #OriginAccessControlObservation @go(AtProvider)
}

// OriginAccessControl is the Schema for the OriginAccessControls API.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#OriginAccessControl: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.originAccessControlOriginType)",message="originAccessControlOriginType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.signingBehavior)",message="signingBehavior is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.signingProtocol)",message="signingProtocol is a required parameter"
	spec:    #OriginAccessControlSpec   @go(Spec)
	status?: #OriginAccessControlStatus @go(Status)
}

// OriginAccessControlList contains a list of OriginAccessControls
#OriginAccessControlList: {
	items: [...#OriginAccessControl] @go(Items,[]OriginAccessControl)
}