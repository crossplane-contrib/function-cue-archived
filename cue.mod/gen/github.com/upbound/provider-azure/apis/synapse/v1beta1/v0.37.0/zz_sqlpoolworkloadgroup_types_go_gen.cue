// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/synapse/v1beta1

package v1beta1

#SQLPoolWorkloadGroupInitParameters: {
	// The workload group importance level. Defaults to normal.
	importance?: null | string @go(Importance,*string)

	// The workload group cap percentage resource.
	maxResourcePercent?: null | float64 @go(MaxResourcePercent,*float64)

	// The workload group request maximum grant percentage. Defaults to 3.
	maxResourcePercentPerRequest?: null | float64 @go(MaxResourcePercentPerRequest,*float64)

	// The workload group minimum percentage resource.
	minResourcePercent?: null | float64 @go(MinResourcePercent,*float64)

	// The workload group request minimum grant percentage.
	minResourcePercentPerRequest?: null | float64 @go(MinResourcePercentPerRequest,*float64)

	// The workload group query execution timeout.
	queryExecutionTimeoutInSeconds?: null | float64 @go(QueryExecutionTimeoutInSeconds,*float64)
}

#SQLPoolWorkloadGroupObservation: {
	// The ID of the Synapse SQL Pool Workload Group.
	id?: null | string @go(ID,*string)

	// The workload group importance level. Defaults to normal.
	importance?: null | string @go(Importance,*string)

	// The workload group cap percentage resource.
	maxResourcePercent?: null | float64 @go(MaxResourcePercent,*float64)

	// The workload group request maximum grant percentage. Defaults to 3.
	maxResourcePercentPerRequest?: null | float64 @go(MaxResourcePercentPerRequest,*float64)

	// The workload group minimum percentage resource.
	minResourcePercent?: null | float64 @go(MinResourcePercent,*float64)

	// The workload group request minimum grant percentage.
	minResourcePercentPerRequest?: null | float64 @go(MinResourcePercentPerRequest,*float64)

	// The workload group query execution timeout.
	queryExecutionTimeoutInSeconds?: null | float64 @go(QueryExecutionTimeoutInSeconds,*float64)

	// The ID of the Synapse SQL Pool. Changing this forces a new Synapse SQL Pool Workload Group to be created.
	sqlPoolId?: null | string @go(SQLPoolID,*string)
}

#SQLPoolWorkloadGroupParameters: {
	// The workload group importance level. Defaults to normal.
	// +kubebuilder:validation:Optional
	importance?: null | string @go(Importance,*string)

	// The workload group cap percentage resource.
	// +kubebuilder:validation:Optional
	maxResourcePercent?: null | float64 @go(MaxResourcePercent,*float64)

	// The workload group request maximum grant percentage. Defaults to 3.
	// +kubebuilder:validation:Optional
	maxResourcePercentPerRequest?: null | float64 @go(MaxResourcePercentPerRequest,*float64)

	// The workload group minimum percentage resource.
	// +kubebuilder:validation:Optional
	minResourcePercent?: null | float64 @go(MinResourcePercent,*float64)

	// The workload group request minimum grant percentage.
	// +kubebuilder:validation:Optional
	minResourcePercentPerRequest?: null | float64 @go(MinResourcePercentPerRequest,*float64)

	// The workload group query execution timeout.
	// +kubebuilder:validation:Optional
	queryExecutionTimeoutInSeconds?: null | float64 @go(QueryExecutionTimeoutInSeconds,*float64)

	// The ID of the Synapse SQL Pool. Changing this forces a new Synapse SQL Pool Workload Group to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/synapse/v1beta1.SQLPool
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	sqlPoolId?: null | string @go(SQLPoolID,*string)
}

// SQLPoolWorkloadGroupSpec defines the desired state of SQLPoolWorkloadGroup
#SQLPoolWorkloadGroupSpec: {
	forProvider: #SQLPoolWorkloadGroupParameters @go(ForProvider)

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
	initProvider?: #SQLPoolWorkloadGroupInitParameters @go(InitProvider)
}

// SQLPoolWorkloadGroupStatus defines the observed state of SQLPoolWorkloadGroup.
#SQLPoolWorkloadGroupStatus: {
	atProvider?: #SQLPoolWorkloadGroupObservation @go(AtProvider)
}

// SQLPoolWorkloadGroup is the Schema for the SQLPoolWorkloadGroups API. Manages a Synapse SQL Pool Workload Group.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#SQLPoolWorkloadGroup: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.maxResourcePercent) || (has(self.initProvider) && has(self.initProvider.maxResourcePercent))",message="spec.forProvider.maxResourcePercent is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.minResourcePercent) || (has(self.initProvider) && has(self.initProvider.minResourcePercent))",message="spec.forProvider.minResourcePercent is a required parameter"
	spec:    #SQLPoolWorkloadGroupSpec   @go(Spec)
	status?: #SQLPoolWorkloadGroupStatus @go(Status)
}

// SQLPoolWorkloadGroupList contains a list of SQLPoolWorkloadGroups
#SQLPoolWorkloadGroupList: {
	items: [...#SQLPoolWorkloadGroup] @go(Items,[]SQLPoolWorkloadGroup)
}