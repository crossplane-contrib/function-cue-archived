// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/healthcare/v1beta1

package v1beta1

#DatasetInitParameters: {
	// The location for the Dataset.
	location?: null | string @go(Location,*string)

	// The resource name for the Dataset.
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The default timezone used by this dataset. Must be a either a valid IANA time zone name such as
	// "America/New_York" or empty, which defaults to UTC. This is used for parsing times in resources
	// (e.g., HL7 messages) where no explicit timezone is specified.
	timeZone?: null | string @go(TimeZone,*string)
}

#DatasetObservation: {
	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/datasets/{{name}}
	id?: null | string @go(ID,*string)

	// The location for the Dataset.
	location?: null | string @go(Location,*string)

	// The resource name for the Dataset.
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The fully qualified name of this dataset
	selfLink?: null | string @go(SelfLink,*string)

	// The default timezone used by this dataset. Must be a either a valid IANA time zone name such as
	// "America/New_York" or empty, which defaults to UTC. This is used for parsing times in resources
	// (e.g., HL7 messages) where no explicit timezone is specified.
	timeZone?: null | string @go(TimeZone,*string)
}

#DatasetParameters: {
	// The location for the Dataset.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The resource name for the Dataset.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The default timezone used by this dataset. Must be a either a valid IANA time zone name such as
	// "America/New_York" or empty, which defaults to UTC. This is used for parsing times in resources
	// (e.g., HL7 messages) where no explicit timezone is specified.
	// +kubebuilder:validation:Optional
	timeZone?: null | string @go(TimeZone,*string)
}

// DatasetSpec defines the desired state of Dataset
#DatasetSpec: {
	forProvider: #DatasetParameters @go(ForProvider)

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
	initProvider?: #DatasetInitParameters @go(InitProvider)
}

// DatasetStatus defines the observed state of Dataset.
#DatasetStatus: {
	atProvider?: #DatasetObservation @go(AtProvider)
}

// Dataset is the Schema for the Datasets API. A Healthcare
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Dataset: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || (has(self.initProvider) && has(self.initProvider.location))",message="spec.forProvider.location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #DatasetSpec   @go(Spec)
	status?: #DatasetStatus @go(Status)
}

// DatasetList contains a list of Datasets
#DatasetList: {
	items: [...#Dataset] @go(Items,[]Dataset)
}