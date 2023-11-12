// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/datashare/v1beta1

package v1beta1

#DataSetBlobStorageInitParameters: {
	// The path of the file in the storage container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	filePath?: null | string @go(FilePath,*string)

	// The path of the folder in the storage container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	folderPath?: null | string @go(FolderPath,*string)

	// A storage_account block as defined below. Changing this forces a new resource to be created.
	storageAccount?: [...#StorageAccountInitParameters] @go(StorageAccount,[]StorageAccountInitParameters)
}

#DataSetBlobStorageObservation: {
	// The name of the storage account container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	containerName?: null | string @go(ContainerName,*string)

	// The ID of the Data Share in which this Data Share Blob Storage Dataset should be created. Changing this forces a new Data Share Blob Storage Dataset to be created.
	dataShareId?: null | string @go(DataShareID,*string)

	// The name of the Data Share Dataset.
	displayName?: null | string @go(DisplayName,*string)

	// The path of the file in the storage container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	filePath?: null | string @go(FilePath,*string)

	// The path of the folder in the storage container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	folderPath?: null | string @go(FolderPath,*string)

	// The ID of the Data Share Blob Storage Dataset.
	id?: null | string @go(ID,*string)

	// A storage_account block as defined below. Changing this forces a new resource to be created.
	storageAccount?: [...#StorageAccountObservation] @go(StorageAccount,[]StorageAccountObservation)
}

#DataSetBlobStorageParameters: {
	// The name of the storage account container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Container
	// +kubebuilder:validation:Optional
	containerName?: null | string @go(ContainerName,*string)

	// The ID of the Data Share in which this Data Share Blob Storage Dataset should be created. Changing this forces a new Data Share Blob Storage Dataset to be created.
	// +crossplane:generate:reference:type=DataShare
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dataShareId?: null | string @go(DataShareID,*string)

	// The path of the file in the storage container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	// +kubebuilder:validation:Optional
	filePath?: null | string @go(FilePath,*string)

	// The path of the folder in the storage container to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	// +kubebuilder:validation:Optional
	folderPath?: null | string @go(FolderPath,*string)

	// A storage_account block as defined below. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	storageAccount?: [...#StorageAccountParameters] @go(StorageAccount,[]StorageAccountParameters)
}

#StorageAccountInitParameters: {
	// The subscription id of the storage account to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	subscriptionId?: null | string @go(SubscriptionID,*string)
}

#StorageAccountObservation: {
	// The name of the storage account to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	name?: null | string @go(Name,*string)

	// The resource group name of the storage account to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The subscription id of the storage account to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	subscriptionId?: null | string @go(SubscriptionID,*string)
}

#StorageAccountParameters: {
	// The name of the storage account to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Account
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The resource group name of the storage account to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The subscription id of the storage account to be shared with the receiver. Changing this forces a new Data Share Blob Storage Dataset to be created.
	// +kubebuilder:validation:Optional
	subscriptionId?: null | string @go(SubscriptionID,*string)
}

// DataSetBlobStorageSpec defines the desired state of DataSetBlobStorage
#DataSetBlobStorageSpec: {
	forProvider: #DataSetBlobStorageParameters @go(ForProvider)

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
	initProvider?: #DataSetBlobStorageInitParameters @go(InitProvider)
}

// DataSetBlobStorageStatus defines the observed state of DataSetBlobStorage.
#DataSetBlobStorageStatus: {
	atProvider?: #DataSetBlobStorageObservation @go(AtProvider)
}

// DataSetBlobStorage is the Schema for the DataSetBlobStorages API. Manages a Data Share Blob Storage Dataset.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#DataSetBlobStorage: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.storageAccount) || (has(self.initProvider) && has(self.initProvider.storageAccount))",message="spec.forProvider.storageAccount is a required parameter"
	spec:    #DataSetBlobStorageSpec   @go(Spec)
	status?: #DataSetBlobStorageStatus @go(Status)
}

// DataSetBlobStorageList contains a list of DataSetBlobStorages
#DataSetBlobStorageList: {
	items: [...#DataSetBlobStorage] @go(Items,[]DataSetBlobStorage)
}