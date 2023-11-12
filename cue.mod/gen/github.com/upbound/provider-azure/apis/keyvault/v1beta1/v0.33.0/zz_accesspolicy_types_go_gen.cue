// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/keyvault/v1beta1

package v1beta1

#AccessPolicyObservation_2: {
	// The object ID of an Application in Azure Active Directory. Changing this forces a new resource to be created.
	applicationId?: null | string @go(ApplicationID,*string)

	// List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update.
	certificatePermissions?: [...null | string] @go(CertificatePermissions,[]*string)

	// Key Vault Access Policy ID.
	id?: null | string @go(ID,*string)

	// List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy and SetRotationPolicy.
	keyPermissions?: [...null | string] @go(KeyPermissions,[]*string)

	// Specifies the id of the Key Vault resource. Changing this forces a new resource to be created.
	keyVaultId?: null | string @go(KeyVaultID,*string)

	// The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID of a service principal can be fetched from  azuread_service_principal.object_id. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created.
	objectId?: null | string @go(ObjectID,*string)

	// List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
	secretPermissions?: [...null | string] @go(SecretPermissions,[]*string)

	// List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
	storagePermissions?: [...null | string] @go(StoragePermissions,[]*string)

	// The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Changing this forces a new resource to be created.
	tenantId?: null | string @go(TenantID,*string)
}

#AccessPolicyParameters_2: {
	// The object ID of an Application in Azure Active Directory. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	applicationId?: null | string @go(ApplicationID,*string)

	// List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update.
	// +kubebuilder:validation:Optional
	certificatePermissions?: [...null | string] @go(CertificatePermissions,[]*string)

	// List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy and SetRotationPolicy.
	// +kubebuilder:validation:Optional
	keyPermissions?: [...null | string] @go(KeyPermissions,[]*string)

	// Specifies the id of the Key Vault resource. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=Vault
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	keyVaultId?: null | string @go(KeyVaultID,*string)

	// The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID of a service principal can be fetched from  azuread_service_principal.object_id. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	objectId?: null | string @go(ObjectID,*string)

	// List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
	// +kubebuilder:validation:Optional
	secretPermissions?: [...null | string] @go(SecretPermissions,[]*string)

	// List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
	// +kubebuilder:validation:Optional
	storagePermissions?: [...null | string] @go(StoragePermissions,[]*string)

	// The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	tenantId?: null | string @go(TenantID,*string)
}

// AccessPolicySpec defines the desired state of AccessPolicy
#AccessPolicySpec: {
	forProvider: #AccessPolicyParameters_2 @go(ForProvider)
}

// AccessPolicyStatus defines the observed state of AccessPolicy.
#AccessPolicyStatus: {
	atProvider?: #AccessPolicyObservation_2 @go(AtProvider)
}

// AccessPolicy is the Schema for the AccessPolicys API. Manages a Key Vault Access Policy.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#AccessPolicy: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.objectId)",message="objectId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.tenantId)",message="tenantId is a required parameter"
	spec:    #AccessPolicySpec   @go(Spec)
	status?: #AccessPolicyStatus @go(Status)
}

// AccessPolicyList contains a list of AccessPolicys
#AccessPolicyList: {
	items: [...#AccessPolicy] @go(Items,[]AccessPolicy)
}