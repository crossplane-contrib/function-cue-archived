// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/datashare/v1beta1

package v1beta1

#DataShareInitParameters: {
	// The Data Share's description.
	description?: null | string @go(Description,*string)

	// The kind of the Data Share. Possible values are CopyBased and InPlace. Changing this forces a new Data Share to be created.
	kind?: null | string @go(Kind,*string)

	// A snapshot_schedule block as defined below.
	snapshotSchedule?: [...#SnapshotScheduleInitParameters] @go(SnapshotSchedule,[]SnapshotScheduleInitParameters)

	// The terms of the Data Share.
	terms?: null | string @go(Terms,*string)
}

#DataShareObservation: {
	// The ID of the Data Share account in which the Data Share is created. Changing this forces a new Data Share to be created.
	accountId?: null | string @go(AccountID,*string)

	// The Data Share's description.
	description?: null | string @go(Description,*string)

	// The ID of the Data Share.
	id?: null | string @go(ID,*string)

	// The kind of the Data Share. Possible values are CopyBased and InPlace. Changing this forces a new Data Share to be created.
	kind?: null | string @go(Kind,*string)

	// A snapshot_schedule block as defined below.
	snapshotSchedule?: [...#SnapshotScheduleObservation] @go(SnapshotSchedule,[]SnapshotScheduleObservation)

	// The terms of the Data Share.
	terms?: null | string @go(Terms,*string)
}

#DataShareParameters: {
	// The ID of the Data Share account in which the Data Share is created. Changing this forces a new Data Share to be created.
	// +crossplane:generate:reference:type=Account
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	accountId?: null | string @go(AccountID,*string)

	// The Data Share's description.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The kind of the Data Share. Possible values are CopyBased and InPlace. Changing this forces a new Data Share to be created.
	// +kubebuilder:validation:Optional
	kind?: null | string @go(Kind,*string)

	// A snapshot_schedule block as defined below.
	// +kubebuilder:validation:Optional
	snapshotSchedule?: [...#SnapshotScheduleParameters] @go(SnapshotSchedule,[]SnapshotScheduleParameters)

	// The terms of the Data Share.
	// +kubebuilder:validation:Optional
	terms?: null | string @go(Terms,*string)
}

#SnapshotScheduleInitParameters: {
	// The name of the snapshot schedule.
	name?: null | string @go(Name,*string)

	// The interval of the synchronization with the source data. Possible values are Hour and Day.
	recurrence?: null | string @go(Recurrence,*string)

	// The synchronization with the source data's start time.
	startTime?: null | string @go(StartTime,*string)
}

#SnapshotScheduleObservation: {
	// The name of the snapshot schedule.
	name?: null | string @go(Name,*string)

	// The interval of the synchronization with the source data. Possible values are Hour and Day.
	recurrence?: null | string @go(Recurrence,*string)

	// The synchronization with the source data's start time.
	startTime?: null | string @go(StartTime,*string)
}

#SnapshotScheduleParameters: {
	// The name of the snapshot schedule.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The interval of the synchronization with the source data. Possible values are Hour and Day.
	// +kubebuilder:validation:Optional
	recurrence?: null | string @go(Recurrence,*string)

	// The synchronization with the source data's start time.
	// +kubebuilder:validation:Optional
	startTime?: null | string @go(StartTime,*string)
}

// DataShareSpec defines the desired state of DataShare
#DataShareSpec: {
	forProvider: #DataShareParameters @go(ForProvider)

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
	initProvider?: #DataShareInitParameters @go(InitProvider)
}

// DataShareStatus defines the observed state of DataShare.
#DataShareStatus: {
	atProvider?: #DataShareObservation @go(AtProvider)
}

// DataShare is the Schema for the DataShares API. Manages a Data Share.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#DataShare: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.kind) || (has(self.initProvider) && has(self.initProvider.kind))",message="spec.forProvider.kind is a required parameter"
	spec:    #DataShareSpec   @go(Spec)
	status?: #DataShareStatus @go(Status)
}

// DataShareList contains a list of DataShares
#DataShareList: {
	items: [...#DataShare] @go(Items,[]DataShare)
}