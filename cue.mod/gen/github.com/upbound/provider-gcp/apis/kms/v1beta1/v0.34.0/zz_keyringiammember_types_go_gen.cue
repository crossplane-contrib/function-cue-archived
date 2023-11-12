// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/kms/v1beta1

package v1beta1

#KeyRingIAMMemberConditionObservation: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#KeyRingIAMMemberConditionParameters: {
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// +kubebuilder:validation:Required
	expression?: null | string @go(Expression,*string)

	// +kubebuilder:validation:Required
	title?: null | string @go(Title,*string)
}

#KeyRingIAMMemberObservation: {
	condition?: [...#KeyRingIAMMemberConditionObservation] @go(Condition,[]KeyRingIAMMemberConditionObservation)
	etag?:      null | string @go(Etag,*string)
	id?:        null | string @go(ID,*string)
	keyRingId?: null | string @go(KeyRingID,*string)
	member?:    null | string @go(Member,*string)
	role?:      null | string @go(Role,*string)
}

#KeyRingIAMMemberParameters: {
	// +kubebuilder:validation:Optional
	condition?: [...#KeyRingIAMMemberConditionParameters] @go(Condition,[]KeyRingIAMMemberConditionParameters)

	// +crossplane:generate:reference:type=KeyRing
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.ExtractResourceID()
	// +kubebuilder:validation:Optional
	keyRingId?: null | string @go(KeyRingID,*string)

	// +kubebuilder:validation:Optional
	member?: null | string @go(Member,*string)

	// +kubebuilder:validation:Optional
	role?: null | string @go(Role,*string)
}

// KeyRingIAMMemberSpec defines the desired state of KeyRingIAMMember
#KeyRingIAMMemberSpec: {
	forProvider: #KeyRingIAMMemberParameters @go(ForProvider)
}

// KeyRingIAMMemberStatus defines the observed state of KeyRingIAMMember.
#KeyRingIAMMemberStatus: {
	atProvider?: #KeyRingIAMMemberObservation @go(AtProvider)
}

// KeyRingIAMMember is the Schema for the KeyRingIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#KeyRingIAMMember: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.member)",message="member is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.role)",message="role is a required parameter"
	spec:    #KeyRingIAMMemberSpec   @go(Spec)
	status?: #KeyRingIAMMemberStatus @go(Status)
}

// KeyRingIAMMemberList contains a list of KeyRingIAMMembers
#KeyRingIAMMemberList: {
	items: [...#KeyRingIAMMember] @go(Items,[]KeyRingIAMMember)
}