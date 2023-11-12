// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/iap/v1beta1

package v1beta1

#TunnelIAMMemberConditionInitParameters: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#TunnelIAMMemberConditionObservation: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#TunnelIAMMemberConditionParameters: {
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// +kubebuilder:validation:Optional
	expression?: null | string @go(Expression,*string)

	// +kubebuilder:validation:Optional
	title?: null | string @go(Title,*string)
}

#TunnelIAMMemberInitParameters: {
	condition?: [...#TunnelIAMMemberConditionInitParameters] @go(Condition,[]TunnelIAMMemberConditionInitParameters)
	project?: null | string @go(Project,*string)
}

#TunnelIAMMemberObservation: {
	condition?: [...#TunnelIAMMemberConditionObservation] @go(Condition,[]TunnelIAMMemberConditionObservation)
	etag?:    null | string @go(Etag,*string)
	id?:      null | string @go(ID,*string)
	member?:  null | string @go(Member,*string)
	project?: null | string @go(Project,*string)
	role?:    null | string @go(Role,*string)
}

#TunnelIAMMemberParameters: {
	// +kubebuilder:validation:Optional
	condition?: [...#TunnelIAMMemberConditionParameters] @go(Condition,[]TunnelIAMMemberConditionParameters)

	// +kubebuilder:validation:Required
	member?: null | string @go(Member,*string)

	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// +kubebuilder:validation:Required
	role?: null | string @go(Role,*string)
}

// TunnelIAMMemberSpec defines the desired state of TunnelIAMMember
#TunnelIAMMemberSpec: {
	forProvider: #TunnelIAMMemberParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #TunnelIAMMemberInitParameters @go(InitProvider)
}

// TunnelIAMMemberStatus defines the observed state of TunnelIAMMember.
#TunnelIAMMemberStatus: {
	atProvider?: #TunnelIAMMemberObservation @go(AtProvider)
}

// TunnelIAMMember is the Schema for the TunnelIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#TunnelIAMMember: {
	spec:    #TunnelIAMMemberSpec   @go(Spec)
	status?: #TunnelIAMMemberStatus @go(Status)
}

// TunnelIAMMemberList contains a list of TunnelIAMMembers
#TunnelIAMMemberList: {
	items: [...#TunnelIAMMember] @go(Items,[]TunnelIAMMember)
}