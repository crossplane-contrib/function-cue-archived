// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudfront/v1beta1

package v1beta1

#KeyGroupObservation: {
	// A comment to describe the key group..
	comment?: null | string @go(Comment,*string)

	// The identifier for this version of the key group.
	etag?: null | string @go(Etag,*string)

	// The identifier for the key group.
	id?: null | string @go(ID,*string)

	// A list of the identifiers of the public keys in the key group.
	items?: [...null | string] @go(Items,[]*string)

	// A name to identify the key group.
	name?: null | string @go(Name,*string)
}

#KeyGroupParameters: {
	// A comment to describe the key group..
	// +kubebuilder:validation:Optional
	comment?: null | string @go(Comment,*string)

	// A list of the identifiers of the public keys in the key group.
	// +crossplane:generate:reference:type=PublicKey
	// +crossplane:generate:reference:refFieldName=ItemRefs
	// +crossplane:generate:reference:selectorFieldName=ItemSelector
	// +kubebuilder:validation:Optional
	items?: [...null | string] @go(Items,[]*string)

	// A name to identify the key group.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// KeyGroupSpec defines the desired state of KeyGroup
#KeyGroupSpec: {
	forProvider: #KeyGroupParameters @go(ForProvider)
}

// KeyGroupStatus defines the observed state of KeyGroup.
#KeyGroupStatus: {
	atProvider?: #KeyGroupObservation @go(AtProvider)
}

// KeyGroup is the Schema for the KeyGroups API. Provides a CloudFront key group.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#KeyGroup: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #KeyGroupSpec   @go(Spec)
	status?: #KeyGroupStatus @go(Status)
}

// KeyGroupList contains a list of KeyGroups
#KeyGroupList: {
	items: [...#KeyGroup] @go(Items,[]KeyGroup)
}