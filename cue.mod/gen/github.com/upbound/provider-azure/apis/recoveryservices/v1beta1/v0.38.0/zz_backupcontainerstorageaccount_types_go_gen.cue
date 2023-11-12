// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/recoveryservices/v1beta1

package v1beta1

#BackupContainerStorageAccountInitParameters: {
}

#BackupContainerStorageAccountObservation: {
	// The ID of the Backup Storage Account Container.
	id?: null | string @go(ID,*string)

	// The name of the vault where the storage account will be registered. Changing this forces a new resource to be created.
	recoveryVaultName?: null | string @go(RecoveryVaultName,*string)

	// Name of the resource group where the vault is located. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The ID of the Storage Account to be registered Changing this forces a new resource to be created.
	storageAccountId?: null | string @go(StorageAccountID,*string)
}

#BackupContainerStorageAccountParameters: {
	// The name of the vault where the storage account will be registered. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/recoveryservices/v1beta1.Vault
	// +kubebuilder:validation:Optional
	recoveryVaultName?: null | string @go(RecoveryVaultName,*string)

	// Name of the resource group where the vault is located. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The ID of the Storage Account to be registered Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Account
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	storageAccountId?: null | string @go(StorageAccountID,*string)
}

// BackupContainerStorageAccountSpec defines the desired state of BackupContainerStorageAccount
#BackupContainerStorageAccountSpec: {
	forProvider: #BackupContainerStorageAccountParameters @go(ForProvider)

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
	initProvider?: #BackupContainerStorageAccountInitParameters @go(InitProvider)
}

// BackupContainerStorageAccountStatus defines the observed state of BackupContainerStorageAccount.
#BackupContainerStorageAccountStatus: {
	atProvider?: #BackupContainerStorageAccountObservation @go(AtProvider)
}

// BackupContainerStorageAccount is the Schema for the BackupContainerStorageAccounts API. Manages a storage account container in an Azure Recovery Vault
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#BackupContainerStorageAccount: {
	spec:    #BackupContainerStorageAccountSpec   @go(Spec)
	status?: #BackupContainerStorageAccountStatus @go(Status)
}

// BackupContainerStorageAccountList contains a list of BackupContainerStorageAccounts
#BackupContainerStorageAccountList: {
	items: [...#BackupContainerStorageAccount] @go(Items,[]BackupContainerStorageAccount)
}