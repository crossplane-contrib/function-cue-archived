// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/bigquery/v1beta1

package v1beta1

#AnalyticsHubDataExchangeIAMMemberInitParameters: {
	condition?: [...#ConditionInitParameters] @go(Condition,[]ConditionInitParameters)
	location?: null | string @go(Location,*string)
	member?:   null | string @go(Member,*string)
	project?:  null | string @go(Project,*string)
	role?:     null | string @go(Role,*string)
}

#AnalyticsHubDataExchangeIAMMemberObservation: {
	condition?: [...#ConditionObservation] @go(Condition,[]ConditionObservation)
	dataExchangeId?: null | string @go(DataExchangeID,*string)
	etag?:           null | string @go(Etag,*string)
	id?:             null | string @go(ID,*string)
	location?:       null | string @go(Location,*string)
	member?:         null | string @go(Member,*string)
	project?:        null | string @go(Project,*string)
	role?:           null | string @go(Role,*string)
}

#AnalyticsHubDataExchangeIAMMemberParameters: {
	// +kubebuilder:validation:Optional
	condition?: [...#ConditionParameters] @go(Condition,[]ConditionParameters)

	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/bigquery/v1beta1.AnalyticsHubDataExchange
	// +kubebuilder:validation:Optional
	dataExchangeId?: null | string @go(DataExchangeID,*string)

	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// +kubebuilder:validation:Optional
	member?: null | string @go(Member,*string)

	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// +kubebuilder:validation:Optional
	role?: null | string @go(Role,*string)
}

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

// AnalyticsHubDataExchangeIAMMemberSpec defines the desired state of AnalyticsHubDataExchangeIAMMember
#AnalyticsHubDataExchangeIAMMemberSpec: {
	forProvider: #AnalyticsHubDataExchangeIAMMemberParameters @go(ForProvider)

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
	initProvider?: #AnalyticsHubDataExchangeIAMMemberInitParameters @go(InitProvider)
}

// AnalyticsHubDataExchangeIAMMemberStatus defines the observed state of AnalyticsHubDataExchangeIAMMember.
#AnalyticsHubDataExchangeIAMMemberStatus: {
	atProvider?: #AnalyticsHubDataExchangeIAMMemberObservation @go(AtProvider)
}

// AnalyticsHubDataExchangeIAMMember is the Schema for the AnalyticsHubDataExchangeIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#AnalyticsHubDataExchangeIAMMember: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.member) || (has(self.initProvider) && has(self.initProvider.member))",message="spec.forProvider.member is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.role) || (has(self.initProvider) && has(self.initProvider.role))",message="spec.forProvider.role is a required parameter"
	spec:    #AnalyticsHubDataExchangeIAMMemberSpec   @go(Spec)
	status?: #AnalyticsHubDataExchangeIAMMemberStatus @go(Status)
}

// AnalyticsHubDataExchangeIAMMemberList contains a list of AnalyticsHubDataExchangeIAMMembers
#AnalyticsHubDataExchangeIAMMemberList: {
	items: [...#AnalyticsHubDataExchangeIAMMember] @go(Items,[]AnalyticsHubDataExchangeIAMMember)
}