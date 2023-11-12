// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/automation/v1beta1

package v1beta1

#AccountObservation: {
	// The DSC Server Endpoint associated with this Automation Account.
	dscServerEndpoint?: null | string @go(DSCServerEndpoint,*string)

	// An encryption block as defined below.
	encryption?: [...#EncryptionObservation] @go(Encryption,[]EncryptionObservation)

	// The URL of automation hybrid service which is used for hybrid worker on-boarding With this Automation Account.
	hybridServiceUrl?: null | string @go(HybridServiceURL,*string)

	// The ID of the Automation Account.
	id?: null | string @go(ID,*string)

	// An identity block as defined below.
	identity?: [...#IdentityObservation] @go(Identity,[]IdentityObservation)

	// Whether requests using non-AAD authentication are blocked. Defaults to true.
	localAuthenticationEnabled?: null | bool @go(LocalAuthenticationEnabled,*bool)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)
	privateEndpointConnection?: [...#PrivateEndpointConnectionObservation] @go(PrivateEndpointConnection,[]PrivateEndpointConnectionObservation)

	// Whether public network access is allowed for the container registry. Defaults to true.
	publicNetworkAccessEnabled?: null | bool @go(PublicNetworkAccessEnabled,*bool)

	// The name of the resource group in which the Automation Account is created. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU of the account. Possible values are Basic and Free.
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#AccountParameters: {
	// An encryption block as defined below.
	// +kubebuilder:validation:Optional
	encryption?: [...#EncryptionParameters] @go(Encryption,[]EncryptionParameters)

	// An identity block as defined below.
	// +kubebuilder:validation:Optional
	identity?: [...#IdentityParameters] @go(Identity,[]IdentityParameters)

	// Whether requests using non-AAD authentication are blocked. Defaults to true.
	// +kubebuilder:validation:Optional
	localAuthenticationEnabled?: null | bool @go(LocalAuthenticationEnabled,*bool)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Whether public network access is allowed for the container registry. Defaults to true.
	// +kubebuilder:validation:Optional
	publicNetworkAccessEnabled?: null | bool @go(PublicNetworkAccessEnabled,*bool)

	// The name of the resource group in which the Automation Account is created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU of the account. Possible values are Basic and Free.
	// +kubebuilder:validation:Optional
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#EncryptionObservation: {
	keySource?: null | string @go(KeySource,*string)

	// The ID of the Key Vault Key which should be used to Encrypt the data in this Automation Account.
	keyVaultKeyId?: null | string @go(KeyVaultKeyID,*string)

	// The User Assigned Managed Identity ID to be used for accessing the Customer Managed Key for encryption.
	userAssignedIdentityId?: null | string @go(UserAssignedIdentityID,*string)
}

#EncryptionParameters: {
	// +kubebuilder:validation:Optional
	keySource?: null | string @go(KeySource,*string)

	// The ID of the Key Vault Key which should be used to Encrypt the data in this Automation Account.
	// +kubebuilder:validation:Required
	keyVaultKeyId?: null | string @go(KeyVaultKeyID,*string)

	// The User Assigned Managed Identity ID to be used for accessing the Customer Managed Key for encryption.
	// +kubebuilder:validation:Optional
	userAssignedIdentityId?: null | string @go(UserAssignedIdentityID,*string)
}

#IdentityObservation: {
	// The ID of the User Assigned Identity which should be assigned to this Automation Account.
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// The Principal ID associated with this Managed Service Identity.
	principalId?: null | string @go(PrincipalID,*string)

	// The Tenant ID associated with this Managed Service Identity.
	tenantId?: null | string @go(TenantID,*string)

	// The type of identity used for this Automation Account. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned.
	type?: null | string @go(Type,*string)
}

#IdentityParameters: {
	// The ID of the User Assigned Identity which should be assigned to this Automation Account.
	// +kubebuilder:validation:Optional
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// The type of identity used for this Automation Account. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

#PrivateEndpointConnectionObservation: {
	// The ID of the Automation Account.
	id?: null | string @go(ID,*string)

	// Specifies the name of the Automation Account. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)
}

#PrivateEndpointConnectionParameters: {
}

// AccountSpec defines the desired state of Account
#AccountSpec: {
	forProvider: #AccountParameters @go(ForProvider)
}

// AccountStatus defines the observed state of Account.
#AccountStatus: {
	atProvider?: #AccountObservation @go(AtProvider)
}

// Account is the Schema for the Accounts API. Manages a Automation Account.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Account: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.skuName)",message="skuName is a required parameter"
	spec:    #AccountSpec   @go(Spec)
	status?: #AccountStatus @go(Status)
}

// AccountList contains a list of Accounts
#AccountList: {
	items: [...#Account] @go(Items,[]Account)
}