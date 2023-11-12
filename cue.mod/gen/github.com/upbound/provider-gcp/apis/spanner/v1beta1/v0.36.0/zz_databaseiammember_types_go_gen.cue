// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/spanner/v1beta1

package v1beta1

#ConditionInitParameters: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#ConditionObservation: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#ConditionParameters: {
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// +kubebuilder:validation:Optional
	expression?: null | string @go(Expression,*string)

	// +kubebuilder:validation:Optional
	title?: null | string @go(Title,*string)
}

#DatabaseIAMMemberInitParameters: {
	condition?: [...#ConditionInitParameters] @go(Condition,[]ConditionInitParameters)
	member?:  null | string @go(Member,*string)
	project?: null | string @go(Project,*string)
	role?:    null | string @go(Role,*string)
}

#DatabaseIAMMemberObservation: {
	condition?: [...#ConditionObservation] @go(Condition,[]ConditionObservation)
	database?: null | string @go(Database,*string)
	etag?:     null | string @go(Etag,*string)
	id?:       null | string @go(ID,*string)
	instance?: null | string @go(Instance,*string)
	member?:   null | string @go(Member,*string)
	project?:  null | string @go(Project,*string)
	role?:     null | string @go(Role,*string)
}

#DatabaseIAMMemberParameters: {
	// +kubebuilder:validation:Optional
	condition?: [...#ConditionParameters] @go(Condition,[]ConditionParameters)

	// +crossplane:generate:reference:type=Database
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.ExtractResourceID()
	// +kubebuilder:validation:Optional
	database?: null | string @go(Database,*string)

	// +crossplane:generate:reference:type=Instance
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.ExtractResourceID()
	// +kubebuilder:validation:Optional
	instance?: null | string @go(Instance,*string)

	// +kubebuilder:validation:Optional
	member?: null | string @go(Member,*string)

	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// +kubebuilder:validation:Optional
	role?: null | string @go(Role,*string)
}

// DatabaseIAMMemberSpec defines the desired state of DatabaseIAMMember
#DatabaseIAMMemberSpec: {
	forProvider: #DatabaseIAMMemberParameters @go(ForProvider)

	// THIS IS AN ALPHA FIELD. Do not use it in production. It is not honored
	// unless the relevant Crossplane feature flag is enabled, and may be
	// changed or removed without notice.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #DatabaseIAMMemberInitParameters @go(InitProvider)
}

// DatabaseIAMMemberStatus defines the observed state of DatabaseIAMMember.
#DatabaseIAMMemberStatus: {
	atProvider?: #DatabaseIAMMemberObservation @go(AtProvider)
}

// DatabaseIAMMember is the Schema for the DatabaseIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#DatabaseIAMMember: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.member) || has(self.initProvider.member)",message="member is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.role) || has(self.initProvider.role)",message="role is a required parameter"
	spec:    #DatabaseIAMMemberSpec   @go(Spec)
	status?: #DatabaseIAMMemberStatus @go(Status)
}

// DatabaseIAMMemberList contains a list of DatabaseIAMMembers
#DatabaseIAMMemberList: {
	items: [...#DatabaseIAMMember] @go(Items,[]DatabaseIAMMember)
}