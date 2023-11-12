// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/confidentialledger/v1beta1

package v1beta1

#AzureadBasedServicePrincipalInitParameters: {
	// Specifies the Ledger Role to grant this AzureAD Service Principal. Possible values are Administrator, Contributor and Reader.
	ledgerRoleName?: null | string @go(LedgerRoleName,*string)

	// Specifies the Principal ID of the AzureAD Service Principal.
	principalId?: null | string @go(PrincipalID,*string)

	// Specifies the Tenant ID for this AzureAD Service Principal.
	tenantId?: null | string @go(TenantID,*string)
}

#AzureadBasedServicePrincipalObservation: {
	// Specifies the Ledger Role to grant this AzureAD Service Principal. Possible values are Administrator, Contributor and Reader.
	ledgerRoleName?: null | string @go(LedgerRoleName,*string)

	// Specifies the Principal ID of the AzureAD Service Principal.
	principalId?: null | string @go(PrincipalID,*string)

	// Specifies the Tenant ID for this AzureAD Service Principal.
	tenantId?: null | string @go(TenantID,*string)
}

#AzureadBasedServicePrincipalParameters: {
	// Specifies the Ledger Role to grant this AzureAD Service Principal. Possible values are Administrator, Contributor and Reader.
	// +kubebuilder:validation:Optional
	ledgerRoleName?: null | string @go(LedgerRoleName,*string)

	// Specifies the Principal ID of the AzureAD Service Principal.
	// +kubebuilder:validation:Optional
	principalId?: null | string @go(PrincipalID,*string)

	// Specifies the Tenant ID for this AzureAD Service Principal.
	// +kubebuilder:validation:Optional
	tenantId?: null | string @go(TenantID,*string)
}

#CertificateBasedSecurityPrincipalInitParameters: {
	// Specifies the Ledger Role to grant this Certificate Security Principal. Possible values are Administrator, Contributor and Reader.
	ledgerRoleName?: null | string @go(LedgerRoleName,*string)

	// The public key, in PEM format, of the certificate used by this identity to authenticate with the Confidential Ledger.
	pemPublicKey?: null | string @go(PemPublicKey,*string)
}

#CertificateBasedSecurityPrincipalObservation: {
	// Specifies the Ledger Role to grant this Certificate Security Principal. Possible values are Administrator, Contributor and Reader.
	ledgerRoleName?: null | string @go(LedgerRoleName,*string)

	// The public key, in PEM format, of the certificate used by this identity to authenticate with the Confidential Ledger.
	pemPublicKey?: null | string @go(PemPublicKey,*string)
}

#CertificateBasedSecurityPrincipalParameters: {
	// Specifies the Ledger Role to grant this Certificate Security Principal. Possible values are Administrator, Contributor and Reader.
	// +kubebuilder:validation:Optional
	ledgerRoleName?: null | string @go(LedgerRoleName,*string)

	// The public key, in PEM format, of the certificate used by this identity to authenticate with the Confidential Ledger.
	// +kubebuilder:validation:Optional
	pemPublicKey?: null | string @go(PemPublicKey,*string)
}

#LedgerInitParameters: {
	// A list of azuread_based_service_principal blocks as defined below.
	azureadBasedServicePrincipal?: [...#AzureadBasedServicePrincipalInitParameters] @go(AzureadBasedServicePrincipal,[]AzureadBasedServicePrincipalInitParameters)

	// A list of certificate_based_security_principal blocks as defined below.
	certificateBasedSecurityPrincipal?: [...#CertificateBasedSecurityPrincipalInitParameters] @go(CertificateBasedSecurityPrincipal,[]CertificateBasedSecurityPrincipalInitParameters)

	// Specifies the type of Confidential Ledger. Possible values are Private and Public. Changing this forces a new resource to be created.
	ledgerType?: null | string @go(LedgerType,*string)

	// Specifies the supported Azure location where the Confidential Ledger exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// A mapping of tags to assign to the Confidential Ledger.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#LedgerObservation: {
	// A list of azuread_based_service_principal blocks as defined below.
	azureadBasedServicePrincipal?: [...#AzureadBasedServicePrincipalObservation] @go(AzureadBasedServicePrincipal,[]AzureadBasedServicePrincipalObservation)

	// A list of certificate_based_security_principal blocks as defined below.
	certificateBasedSecurityPrincipal?: [...#CertificateBasedSecurityPrincipalObservation] @go(CertificateBasedSecurityPrincipal,[]CertificateBasedSecurityPrincipalObservation)

	// The ID of this Confidential Ledger.
	id?: null | string @go(ID,*string)

	// The Identity Service Endpoint for this Confidential Ledger.
	identityServiceEndpoint?: null | string @go(IdentityServiceEndpoint,*string)

	// The Endpoint for this Confidential Ledger.
	ledgerEndpoint?: null | string @go(LedgerEndpoint,*string)

	// Specifies the type of Confidential Ledger. Possible values are Private and Public. Changing this forces a new resource to be created.
	ledgerType?: null | string @go(LedgerType,*string)

	// Specifies the supported Azure location where the Confidential Ledger exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Confidential Ledger exists. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the Confidential Ledger.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#LedgerParameters: {
	// A list of azuread_based_service_principal blocks as defined below.
	// +kubebuilder:validation:Optional
	azureadBasedServicePrincipal?: [...#AzureadBasedServicePrincipalParameters] @go(AzureadBasedServicePrincipal,[]AzureadBasedServicePrincipalParameters)

	// A list of certificate_based_security_principal blocks as defined below.
	// +kubebuilder:validation:Optional
	certificateBasedSecurityPrincipal?: [...#CertificateBasedSecurityPrincipalParameters] @go(CertificateBasedSecurityPrincipal,[]CertificateBasedSecurityPrincipalParameters)

	// Specifies the type of Confidential Ledger. Possible values are Private and Public. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	ledgerType?: null | string @go(LedgerType,*string)

	// Specifies the supported Azure location where the Confidential Ledger exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Confidential Ledger exists. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the Confidential Ledger.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// LedgerSpec defines the desired state of Ledger
#LedgerSpec: {
	forProvider: #LedgerParameters @go(ForProvider)

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
	initProvider?: #LedgerInitParameters @go(InitProvider)
}

// LedgerStatus defines the observed state of Ledger.
#LedgerStatus: {
	atProvider?: #LedgerObservation @go(AtProvider)
}

// Ledger is the Schema for the Ledgers API. Manages a Confidential Ledger.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Ledger: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.azureadBasedServicePrincipal) || has(self.initProvider.azureadBasedServicePrincipal)",message="azureadBasedServicePrincipal is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.ledgerType) || has(self.initProvider.ledgerType)",message="ledgerType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || has(self.initProvider.location)",message="location is a required parameter"
	spec:    #LedgerSpec   @go(Spec)
	status?: #LedgerStatus @go(Status)
}

// LedgerList contains a list of Ledgers
#LedgerList: {
	items: [...#Ledger] @go(Items,[]Ledger)
}