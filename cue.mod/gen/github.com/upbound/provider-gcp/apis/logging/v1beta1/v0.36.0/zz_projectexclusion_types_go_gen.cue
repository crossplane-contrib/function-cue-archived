// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/logging/v1beta1

package v1beta1

#ProjectExclusionInitParameters: {
	// A human-readable description.
	description?: null | string @go(Description,*string)

	// Whether this exclusion rule should be disabled or not. This defaults to
	// false.
	disabled?: null | bool @go(Disabled,*bool)

	// The filter to apply when excluding logs. Only log entries that match the filter are excluded.
	// See Advanced Log Filters for information on how to
	// write a filter.
	filter?: null | string @go(Filter,*string)

	// The project to create the exclusion in. If omitted, the project associated with the provider is
	// used.
	project?: null | string @go(Project,*string)
}

#ProjectExclusionObservation: {
	// A human-readable description.
	description?: null | string @go(Description,*string)

	// Whether this exclusion rule should be disabled or not. This defaults to
	// false.
	disabled?: null | bool @go(Disabled,*bool)

	// The filter to apply when excluding logs. Only log entries that match the filter are excluded.
	// See Advanced Log Filters for information on how to
	// write a filter.
	filter?: null | string @go(Filter,*string)

	// an identifier for the resource with format projects/{{project}}/exclusions/{{name}}
	id?: null | string @go(ID,*string)

	// The project to create the exclusion in. If omitted, the project associated with the provider is
	// used.
	project?: null | string @go(Project,*string)
}

#ProjectExclusionParameters: {
	// A human-readable description.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Whether this exclusion rule should be disabled or not. This defaults to
	// false.
	// +kubebuilder:validation:Optional
	disabled?: null | bool @go(Disabled,*bool)

	// The filter to apply when excluding logs. Only log entries that match the filter are excluded.
	// See Advanced Log Filters for information on how to
	// write a filter.
	// +kubebuilder:validation:Optional
	filter?: null | string @go(Filter,*string)

	// The project to create the exclusion in. If omitted, the project associated with the provider is
	// used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// ProjectExclusionSpec defines the desired state of ProjectExclusion
#ProjectExclusionSpec: {
	forProvider: #ProjectExclusionParameters @go(ForProvider)

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
	initProvider?: #ProjectExclusionInitParameters @go(InitProvider)
}

// ProjectExclusionStatus defines the observed state of ProjectExclusion.
#ProjectExclusionStatus: {
	atProvider?: #ProjectExclusionObservation @go(AtProvider)
}

// ProjectExclusion is the Schema for the ProjectExclusions API. Manages a project-level logging exclusion.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ProjectExclusion: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.filter) || has(self.initProvider.filter)",message="filter is a required parameter"
	spec:    #ProjectExclusionSpec   @go(Spec)
	status?: #ProjectExclusionStatus @go(Status)
}

// ProjectExclusionList contains a list of ProjectExclusions
#ProjectExclusionList: {
	items: [...#ProjectExclusion] @go(Items,[]ProjectExclusion)
}