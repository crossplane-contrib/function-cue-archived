// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/filestore/v1beta1

package v1beta1

#BackupInitParameters: {
	// A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected.
	description?: null | string @go(Description,*string)

	// Resource labels to represent user-provided metadata.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Name of the file share in the source Cloud Filestore instance that the backup is created from.
	sourceFileShare?: null | string @go(SourceFileShare,*string)
}

#BackupObservation: {
	// The amount of bytes needed to allocate a full copy of the snapshot content.
	capacityGb?: null | string @go(CapacityGb,*string)

	// The time when the snapshot was created in RFC3339 text format.
	createTime?: null | string @go(CreateTime,*string)

	// A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected.
	description?: null | string @go(Description,*string)

	// Amount of bytes that will be downloaded if the backup is restored.
	downloadBytes?: null | string @go(DownloadBytes,*string)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/backups/{{name}}
	id?: null | string @go(ID,*string)

	// KMS key name used for data encryption.
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// Resource labels to represent user-provided metadata.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the location of the instance. This can be a region for ENTERPRISE tier instances.
	location?: null | string @go(Location,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Name of the file share in the source Cloud Filestore instance that the backup is created from.
	sourceFileShare?: null | string @go(SourceFileShare,*string)

	// The resource name of the source Cloud Filestore instance, in the format projects/{projectId}/locations/{locationId}/instances/{instanceId}, used to create this backup.
	sourceInstance?: null | string @go(SourceInstance,*string)

	// The service tier of the source Cloud Filestore instance that this backup is created from.
	sourceInstanceTier?: null | string @go(SourceInstanceTier,*string)

	// The backup state.
	state?: null | string @go(State,*string)

	// The size of the storage used by the backup. As backups share storage, this number is expected to change with backup creation/deletion.
	storageBytes?: null | string @go(StorageBytes,*string)
}

#BackupParameters: {
	// A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Resource labels to represent user-provided metadata.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the location of the instance. This can be a region for ENTERPRISE tier instances.
	// +kubebuilder:validation:Required
	location?: null | string @go(Location,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Name of the file share in the source Cloud Filestore instance that the backup is created from.
	// +kubebuilder:validation:Optional
	sourceFileShare?: null | string @go(SourceFileShare,*string)

	// The resource name of the source Cloud Filestore instance, in the format projects/{projectId}/locations/{locationId}/instances/{instanceId}, used to create this backup.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/filestore/v1beta1.Instance
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	sourceInstance?: null | string @go(SourceInstance,*string)
}

// BackupSpec defines the desired state of Backup
#BackupSpec: {
	forProvider: #BackupParameters @go(ForProvider)

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
	initProvider?: #BackupInitParameters @go(InitProvider)
}

// BackupStatus defines the observed state of Backup.
#BackupStatus: {
	atProvider?: #BackupObservation @go(AtProvider)
}

// Backup is the Schema for the Backups API. A Google Cloud Filestore backup.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Backup: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.sourceFileShare) || has(self.initProvider.sourceFileShare)",message="sourceFileShare is a required parameter"
	spec:    #BackupSpec   @go(Spec)
	status?: #BackupStatus @go(Status)
}

// BackupList contains a list of Backups
#BackupList: {
	items: [...#Backup] @go(Items,[]Backup)
}