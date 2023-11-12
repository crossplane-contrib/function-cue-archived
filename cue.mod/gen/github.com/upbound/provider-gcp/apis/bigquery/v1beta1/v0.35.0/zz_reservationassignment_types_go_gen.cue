// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/bigquery/v1beta1

package v1beta1

#ReservationAssignmentInitParameters: {
	// The resource which will use the reservation. E.g. projects/myproject, folders/123, organizations/456.
	assignee?: null | string @go(Assignee,*string)

	// Types of job, which could be specified when using the reservation. Possible values: JOB_TYPE_UNSPECIFIED, PIPELINE, QUERY
	jobType?: null | string @go(JobType,*string)

	// The location for the resource
	location?: null | string @go(Location,*string)

	// The project for the resource
	project?: null | string @go(Project,*string)
}

#ReservationAssignmentObservation: {
	// The resource which will use the reservation. E.g. projects/myproject, folders/123, organizations/456.
	assignee?: null | string @go(Assignee,*string)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/reservations/{{reservation}}/assignments/{{name}}
	id?: null | string @go(ID,*string)

	// Types of job, which could be specified when using the reservation. Possible values: JOB_TYPE_UNSPECIFIED, PIPELINE, QUERY
	jobType?: null | string @go(JobType,*string)

	// The location for the resource
	location?: null | string @go(Location,*string)

	// Output only. The resource name of the assignment.
	name?: null | string @go(Name,*string)

	// The project for the resource
	project?: null | string @go(Project,*string)

	// The reservation for the resource
	reservation?: null | string @go(Reservation,*string)

	// Assignment will remain in PENDING state if no active capacity commitment is present. It will become ACTIVE when some capacity commitment becomes active. Possible values: STATE_UNSPECIFIED, PENDING, ACTIVE
	state?: null | string @go(State,*string)
}

#ReservationAssignmentParameters: {
	// The resource which will use the reservation. E.g. projects/myproject, folders/123, organizations/456.
	// +kubebuilder:validation:Optional
	assignee?: null | string @go(Assignee,*string)

	// Types of job, which could be specified when using the reservation. Possible values: JOB_TYPE_UNSPECIFIED, PIPELINE, QUERY
	// +kubebuilder:validation:Optional
	jobType?: null | string @go(JobType,*string)

	// The location for the resource
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The project for the resource
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The reservation for the resource
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/bigquery/v1beta1.Reservation
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	reservation?: null | string @go(Reservation,*string)
}

// ReservationAssignmentSpec defines the desired state of ReservationAssignment
#ReservationAssignmentSpec: {
	forProvider: #ReservationAssignmentParameters @go(ForProvider)

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
	initProvider?: #ReservationAssignmentInitParameters @go(InitProvider)
}

// ReservationAssignmentStatus defines the observed state of ReservationAssignment.
#ReservationAssignmentStatus: {
	atProvider?: #ReservationAssignmentObservation @go(AtProvider)
}

// ReservationAssignment is the Schema for the ReservationAssignments API. The BigqueryReservation Assignment resource
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ReservationAssignment: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.assignee) || has(self.initProvider.assignee)",message="assignee is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.jobType) || has(self.initProvider.jobType)",message="jobType is a required parameter"
	spec:    #ReservationAssignmentSpec   @go(Spec)
	status?: #ReservationAssignmentStatus @go(Status)
}

// ReservationAssignmentList contains a list of ReservationAssignments
#ReservationAssignmentList: {
	items: [...#ReservationAssignment] @go(Items,[]ReservationAssignment)
}