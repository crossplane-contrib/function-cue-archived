// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/redshift/v1beta1

package v1beta1

#SnapshotScheduleObservation: {
	// Amazon Resource Name (ARN) of the Redshift Snapshot Schedule.
	arn?: null | string @go(Arn,*string)

	// The definition of the snapshot schedule. The definition is made up of schedule expressions, for example cron(30 12 *) or rate(12 hours).
	definitions?: [...null | string] @go(Definitions,[]*string)

	// The description of the snapshot schedule.
	description?: null | string @go(Description,*string)

	// Whether to destroy all associated clusters with this snapshot schedule on deletion. Must be enabled and applied before attempting deletion.
	forceDestroy?: null | bool   @go(ForceDestroy,*bool)
	id?:           null | string @go(ID,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#SnapshotScheduleParameters: {
	// The definition of the snapshot schedule. The definition is made up of schedule expressions, for example cron(30 12 *) or rate(12 hours).
	// +kubebuilder:validation:Optional
	definitions?: [...null | string] @go(Definitions,[]*string)

	// The description of the snapshot schedule.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Whether to destroy all associated clusters with this snapshot schedule on deletion. Must be enabled and applied before attempting deletion.
	// +kubebuilder:validation:Optional
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// SnapshotScheduleSpec defines the desired state of SnapshotSchedule
#SnapshotScheduleSpec: {
	forProvider: #SnapshotScheduleParameters @go(ForProvider)
}

// SnapshotScheduleStatus defines the observed state of SnapshotSchedule.
#SnapshotScheduleStatus: {
	atProvider?: #SnapshotScheduleObservation @go(AtProvider)
}

// SnapshotSchedule is the Schema for the SnapshotSchedules API. Provides an Redshift Snapshot Schedule resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#SnapshotSchedule: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.definitions)",message="definitions is a required parameter"
	spec:    #SnapshotScheduleSpec   @go(Spec)
	status?: #SnapshotScheduleStatus @go(Status)
}

// SnapshotScheduleList contains a list of SnapshotSchedules
#SnapshotScheduleList: {
	items: [...#SnapshotSchedule] @go(Items,[]SnapshotSchedule)
}