// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-azure/apis/keyvault/v1alpha1

package v1alpha1

// KeyVaultSecretAttributesParameters defines the desired state of an Azure Key Vault Secret Attributes.
// KeyVaultSecretAttributesParameters contains WRITE-ONLY fields.
#KeyVaultSecretAttributesParameters: {
	// Enabled - Determines whether the object is enabled.
	enabled?: null | bool @go(Enabled,*bool)
}

// KeyVaultSecretParameters defines the desired state of an Azure Key Vault Secret.
// https://docs.microsoft.com/en-us/rest/api/keyvault/#secret-operations
#KeyVaultSecretParameters: {
	// VaultBaseURL - The vault name, for example https://myvault.vault.azure.net.
	vaultBaseUrl: string @go(VaultBaseURL)

	// Name - The name of the secret
	name: string @go(Name)

	// ContentType - Type of the secret value such as a password
	// +optional
	contentType?: null | string @go(ContentType,*string)

	// SecretAttributes - The secret management attributes
	// +optional
	attributes?: null | #KeyVaultSecretAttributesParameters @go(SecretAttributes,*KeyVaultSecretAttributesParameters)

	// Tags - Application-specific metadata in the form of key-value pairs
	// +optional
	tags: {[string]: string} @go(Tags,map[string]string)
}

// A KeyVaultSecretSpec defines the desired state of a Secret.
#KeyVaultSecretSpec: {
	forProvider: #KeyVaultSecretParameters @go(ForProvider)
}

// KeyVaultSecretAttributesObservation represents the observed state of an Azure Key Vault Secret Attributes.
// KeyVaultSecretAttributesObservation contains READ-ONLY fields.
#KeyVaultSecretAttributesObservation: {
	// RecoveryLevel - READ-ONLY;
	// Reflects the deletion recovery level currently in effect for secrets in the
	// current vault. If it contains 'Purgeable', the secret can be permanently
	// deleted by a privileged user; otherwise, only the system can purge the secret,
	// at the end of the retention interval.
	// Possible values include:
	// 'Purgeable',
	// 'RecoverablePurgeable',
	// 'Recoverable',
	// 'RecoverableProtectedSubscription',
	// 'CustomizedRecoverablePurgeable',
	// 'CustomizedRecoverable',
	// 'CustomizedRecoverableProtectedSubscription'
	recoveryLevel?: string @go(RecoveryLevel)
}

// KeyVaultSecretObservation represents the observed state of the Secret object in Azure.
#KeyVaultSecretObservation: {
	// ID - The secret id.
	id?: string @go(ID)

	// Attributes - The secret management attributes.
	attributes?: null | #KeyVaultSecretAttributesObservation @go(Attributes,*KeyVaultSecretAttributesObservation)

	// Kid - READ-ONLY; If this is a secret backing a KV certificate, then this field specifies the corresponding key backing the KV certificate.
	kid?: null | string @go(Kid,*string)

	// Managed - READ-ONLY; True if the secret's lifetime is managed by key vault. If this is a secret backing a certificate, then managed will be true.
	managed?: null | bool @go(Managed,*bool)
}

// A KeyVaultSecretStatus represents the observed state of a Secret.
#KeyVaultSecretStatus: {
	atProvider?: #KeyVaultSecretObservation @go(AtProvider)
}

// A KeyVaultSecret is a managed resource that represents an Azure KeyVaultSecret cluster.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure},shortName=kvsecret
#KeyVaultSecret: {
	spec:    #KeyVaultSecretSpec   @go(Spec)
	status?: #KeyVaultSecretStatus @go(Status)
}

// KeyVaultSecretList contains a list of Secret.
#KeyVaultSecretList: {
	items: [...#KeyVaultSecret] @go(Items,[]KeyVaultSecret)
}