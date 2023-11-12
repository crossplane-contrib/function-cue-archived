// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/apimanagement/v1beta1

package v1beta1

#CertificateInitParameters_2: {
	// The Client ID of the User Assigned Managed Identity to use for retrieving certificate.
	keyVaultIdentityClientId?: null | string @go(KeyVaultIdentityClientID,*string)
}

#CertificateObservation_2: {
	// The Name of the API Management Service where this Service should be created. Changing this forces a new resource to be created.
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The Expiration Date of this Certificate, formatted as an RFC3339 string.
	expiration?: null | string @go(Expiration,*string)

	// The ID of the API Management Certificate.
	id?: null | string @go(ID,*string)

	// The Client ID of the User Assigned Managed Identity to use for retrieving certificate.
	keyVaultIdentityClientId?: null | string @go(KeyVaultIdentityClientID,*string)

	// The ID of the Key Vault Secret containing the SSL Certificate, which must be of the type application/x-pkcs12.
	keyVaultSecretId?: null | string @go(KeyVaultSecretID,*string)

	// The Name of the Resource Group where the API Management Service exists. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The Subject of this Certificate.
	subject?: null | string @go(Subject,*string)

	// The Thumbprint of this Certificate.
	thumbprint?: null | string @go(Thumbprint,*string)
}

#CertificateParameters_2: {
	// The Name of the API Management Service where this Service should be created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/apimanagement/v1beta1.Management
	// +kubebuilder:validation:Optional
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The Client ID of the User Assigned Managed Identity to use for retrieving certificate.
	// +kubebuilder:validation:Optional
	keyVaultIdentityClientId?: null | string @go(KeyVaultIdentityClientID,*string)

	// The ID of the Key Vault Secret containing the SSL Certificate, which must be of the type application/x-pkcs12.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/keyvault/v1beta1.Certificate
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("secret_id",true)
	// +kubebuilder:validation:Optional
	keyVaultSecretId?: null | string @go(KeyVaultSecretID,*string)

	// The Name of the Resource Group where the API Management Service exists. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

// CertificateSpec defines the desired state of Certificate
#CertificateSpec: {
	forProvider: #CertificateParameters_2 @go(ForProvider)

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
	initProvider?: #CertificateInitParameters_2 @go(InitProvider)
}

// CertificateStatus defines the observed state of Certificate.
#CertificateStatus: {
	atProvider?: #CertificateObservation_2 @go(AtProvider)
}

// Certificate is the Schema for the Certificates API. Manages an Certificate within an API Management Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Certificate: {
	spec:    #CertificateSpec   @go(Spec)
	status?: #CertificateStatus @go(Status)
}

// CertificateList contains a list of Certificates
#CertificateList: {
	items: [...#Certificate] @go(Items,[]Certificate)
}