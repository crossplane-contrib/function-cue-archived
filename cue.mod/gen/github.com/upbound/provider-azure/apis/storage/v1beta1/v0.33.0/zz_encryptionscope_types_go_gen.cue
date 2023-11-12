// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/storage/v1beta1

package v1beta1

#EncryptionScopeObservation: {
	// The ID of the Storage Encryption Scope.
	id?: null | string @go(ID,*string)

	// Is a secondary layer of encryption with Platform Managed Keys for data applied? Changing this forces a new resource to be created.
	infrastructureEncryptionRequired?: null | bool @go(InfrastructureEncryptionRequired,*bool)

	// The ID of the Key Vault Key. Required when source is Microsoft.KeyVault.
	keyVaultKeyId?: null | string @go(KeyVaultKeyID,*string)

	// The source of the Storage Encryption Scope. Possible values are Microsoft.KeyVault and Microsoft.Storage.
	source?: null | string @go(Source,*string)

	// The ID of the Storage Account where this Storage Encryption Scope is created. Changing this forces a new Storage Encryption Scope to be created.
	storageAccountId?: null | string @go(StorageAccountID,*string)
}

#EncryptionScopeParameters: {
	// Is a secondary layer of encryption with Platform Managed Keys for data applied? Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	infrastructureEncryptionRequired?: null | bool @go(InfrastructureEncryptionRequired,*bool)

	// The ID of the Key Vault Key. Required when source is Microsoft.KeyVault.
	// +kubebuilder:validation:Optional
	keyVaultKeyId?: null | string @go(KeyVaultKeyID,*string)

	// The source of the Storage Encryption Scope. Possible values are Microsoft.KeyVault and Microsoft.Storage.
	// +kubebuilder:validation:Optional
	source?: null | string @go(Source,*string)

	// The ID of the Storage Account where this Storage Encryption Scope is created. Changing this forces a new Storage Encryption Scope to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Account
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	storageAccountId?: null | string @go(StorageAccountID,*string)
}

// EncryptionScopeSpec defines the desired state of EncryptionScope
#EncryptionScopeSpec: {
	forProvider: #EncryptionScopeParameters @go(ForProvider)
}

// EncryptionScopeStatus defines the observed state of EncryptionScope.
#EncryptionScopeStatus: {
	atProvider?: #EncryptionScopeObservation @go(AtProvider)
}

// EncryptionScope is the Schema for the EncryptionScopes API. Manages a Storage Encryption Scope.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#EncryptionScope: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.source)",message="source is a required parameter"
	spec:    #EncryptionScopeSpec   @go(Spec)
	status?: #EncryptionScopeStatus @go(Status)
}

// EncryptionScopeList contains a list of EncryptionScopes
#EncryptionScopeList: {
	items: [...#EncryptionScope] @go(Items,[]EncryptionScope)
}