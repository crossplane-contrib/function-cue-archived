// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/storage/v1beta1

package v1beta1

#ObjectReplicationInitParameters: {
	// One or more rules blocks as defined below.
	rules?: [...#ObjectReplicationRulesInitParameters] @go(Rules,[]ObjectReplicationRulesInitParameters)
}

#ObjectReplicationObservation: {
	// The ID of the Object Replication in the destination storage account.
	destinationObjectReplicationId?: null | string @go(DestinationObjectReplicationID,*string)

	// The ID of the destination storage account. Changing this forces a new Storage Object Replication to be created.
	destinationStorageAccountId?: null | string @go(DestinationStorageAccountID,*string)

	// The ID of the Storage Object Replication in the destination storage account. It's composed as format source_object_replication_id;destination_object_replication_id.
	id?: null | string @go(ID,*string)

	// One or more rules blocks as defined below.
	rules?: [...#ObjectReplicationRulesObservation] @go(Rules,[]ObjectReplicationRulesObservation)

	// The ID of the Object Replication in the source storage account.
	sourceObjectReplicationId?: null | string @go(SourceObjectReplicationID,*string)

	// The ID of the source storage account. Changing this forces a new Storage Object Replication to be created.
	sourceStorageAccountId?: null | string @go(SourceStorageAccountID,*string)
}

#ObjectReplicationParameters: {
	// The ID of the destination storage account. Changing this forces a new Storage Object Replication to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Account
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	destinationStorageAccountId?: null | string @go(DestinationStorageAccountID,*string)

	// One or more rules blocks as defined below.
	// +kubebuilder:validation:Optional
	rules?: [...#ObjectReplicationRulesParameters] @go(Rules,[]ObjectReplicationRulesParameters)

	// The ID of the source storage account. Changing this forces a new Storage Object Replication to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Account
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	sourceStorageAccountId?: null | string @go(SourceStorageAccountID,*string)
}

#ObjectReplicationRulesInitParameters: {
	// The time after which the Block Blobs created will be copies to the destination. Possible values are OnlyNewObjects, Everything and time in RFC3339 format: 2006-01-02T15:04:00Z.
	copyBlobsCreatedAfter?: null | string @go(CopyBlobsCreatedAfter,*string)

	// Specifies a list of filters prefixes, the blobs whose names begin with which will be replicated.
	filterOutBlobsWithPrefix?: [...null | string] @go(FilterOutBlobsWithPrefix,[]*string)
}

#ObjectReplicationRulesObservation: {
	// The time after which the Block Blobs created will be copies to the destination. Possible values are OnlyNewObjects, Everything and time in RFC3339 format: 2006-01-02T15:04:00Z.
	copyBlobsCreatedAfter?: null | string @go(CopyBlobsCreatedAfter,*string)

	// The destination storage container name. Changing this forces a new Storage Object Replication to be created.
	destinationContainerName?: null | string @go(DestinationContainerName,*string)

	// Specifies a list of filters prefixes, the blobs whose names begin with which will be replicated.
	filterOutBlobsWithPrefix?: [...null | string] @go(FilterOutBlobsWithPrefix,[]*string)
	name?: null | string @go(Name,*string)

	// The source storage container name. Changing this forces a new Storage Object Replication to be created.
	sourceContainerName?: null | string @go(SourceContainerName,*string)
}

#ObjectReplicationRulesParameters: {
	// The time after which the Block Blobs created will be copies to the destination. Possible values are OnlyNewObjects, Everything and time in RFC3339 format: 2006-01-02T15:04:00Z.
	// +kubebuilder:validation:Optional
	copyBlobsCreatedAfter?: null | string @go(CopyBlobsCreatedAfter,*string)

	// The destination storage container name. Changing this forces a new Storage Object Replication to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Container
	// +kubebuilder:validation:Optional
	destinationContainerName?: null | string @go(DestinationContainerName,*string)

	// Specifies a list of filters prefixes, the blobs whose names begin with which will be replicated.
	// +kubebuilder:validation:Optional
	filterOutBlobsWithPrefix?: [...null | string] @go(FilterOutBlobsWithPrefix,[]*string)

	// The source storage container name. Changing this forces a new Storage Object Replication to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Container
	// +kubebuilder:validation:Optional
	sourceContainerName?: null | string @go(SourceContainerName,*string)
}

// ObjectReplicationSpec defines the desired state of ObjectReplication
#ObjectReplicationSpec: {
	forProvider: #ObjectReplicationParameters @go(ForProvider)

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
	initProvider?: #ObjectReplicationInitParameters @go(InitProvider)
}

// ObjectReplicationStatus defines the observed state of ObjectReplication.
#ObjectReplicationStatus: {
	atProvider?: #ObjectReplicationObservation @go(AtProvider)
}

// ObjectReplication is the Schema for the ObjectReplications API. Copy Block Blobs between a source storage account and a destination account
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#ObjectReplication: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.rules) || (has(self.initProvider) && has(self.initProvider.rules))",message="spec.forProvider.rules is a required parameter"
	spec:    #ObjectReplicationSpec   @go(Spec)
	status?: #ObjectReplicationStatus @go(Status)
}

// ObjectReplicationList contains a list of ObjectReplications
#ObjectReplicationList: {
	items: [...#ObjectReplication] @go(Items,[]ObjectReplication)
}