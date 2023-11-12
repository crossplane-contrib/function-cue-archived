// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/iap/v1beta1

package v1beta1

#WebTypeAppEngineIAMMemberConditionObservation: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#WebTypeAppEngineIAMMemberConditionParameters: {
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// +kubebuilder:validation:Required
	expression?: null | string @go(Expression,*string)

	// +kubebuilder:validation:Required
	title?: null | string @go(Title,*string)
}

#WebTypeAppEngineIAMMemberObservation: {
	appId?: null | string @go(AppID,*string)
	condition?: [...#WebTypeAppEngineIAMMemberConditionObservation] @go(Condition,[]WebTypeAppEngineIAMMemberConditionObservation)
	etag?:    null | string @go(Etag,*string)
	id?:      null | string @go(ID,*string)
	member?:  null | string @go(Member,*string)
	project?: null | string @go(Project,*string)
	role?:    null | string @go(Role,*string)
}

#WebTypeAppEngineIAMMemberParameters: {
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/appengine/v1beta1.Application
	// +kubebuilder:validation:Optional
	appId?: null | string @go(AppID,*string)

	// +kubebuilder:validation:Optional
	condition?: [...#WebTypeAppEngineIAMMemberConditionParameters] @go(Condition,[]WebTypeAppEngineIAMMemberConditionParameters)

	// +kubebuilder:validation:Optional
	member?: null | string @go(Member,*string)

	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// +kubebuilder:validation:Optional
	role?: null | string @go(Role,*string)
}

// WebTypeAppEngineIAMMemberSpec defines the desired state of WebTypeAppEngineIAMMember
#WebTypeAppEngineIAMMemberSpec: {
	forProvider: #WebTypeAppEngineIAMMemberParameters @go(ForProvider)
}

// WebTypeAppEngineIAMMemberStatus defines the observed state of WebTypeAppEngineIAMMember.
#WebTypeAppEngineIAMMemberStatus: {
	atProvider?: #WebTypeAppEngineIAMMemberObservation @go(AtProvider)
}

// WebTypeAppEngineIAMMember is the Schema for the WebTypeAppEngineIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#WebTypeAppEngineIAMMember: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.member)",message="member is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.role)",message="role is a required parameter"
	spec:    #WebTypeAppEngineIAMMemberSpec   @go(Spec)
	status?: #WebTypeAppEngineIAMMemberStatus @go(Status)
}

// WebTypeAppEngineIAMMemberList contains a list of WebTypeAppEngineIAMMembers
#WebTypeAppEngineIAMMemberList: {
	items: [...#WebTypeAppEngineIAMMember] @go(Items,[]WebTypeAppEngineIAMMember)
}