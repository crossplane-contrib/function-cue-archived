// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/identityplatform/v1beta1

package v1beta1

#IdPConfigIdPCertificatesObservation: {
}

#SpConfigSpCertificatesObservation: {
	// (Output)
	// The x509 certificate
	x509Certificate?: null | string @go(X509Certificate,*string)
}

#SpConfigSpCertificatesParameters: {
}

#TenantInboundSAMLConfigIdPConfigObservation: {
	// Unique identifier for all SAML entities
	idpEntityId?: null | string @go(IdPEntityID,*string)

	// Indicates if outbounding SAMLRequest should be signed.
	signRequest?: null | bool @go(SignRequest,*bool)

	// URL to send Authentication request to.
	ssoUrl?: null | string @go(SsoURL,*string)
}

#TenantInboundSAMLConfigIdPConfigParameters: {
	// Unique identifier for all SAML entities
	// +kubebuilder:validation:Required
	idpEntityId?: null | string @go(IdPEntityID,*string)

	// Indicates if outbounding SAMLRequest should be signed.
	// +kubebuilder:validation:Optional
	signRequest?: null | bool @go(SignRequest,*bool)

	// URL to send Authentication request to.
	// +kubebuilder:validation:Required
	ssoUrl?: null | string @go(SsoURL,*string)
}

#TenantInboundSAMLConfigObservation: {
	// Human friendly display name.
	displayName?: null | string @go(DisplayName,*string)

	// If this config allows users to sign in with the provider.
	enabled?: null | bool @go(Enabled,*bool)

	// an identifier for the resource with format projects/{{project}}/tenants/{{tenant}}/inboundSamlConfigs/{{name}}
	id?: null | string @go(ID,*string)

	// SAML IdP configuration when the project acts as the relying party
	// Structure is documented below.
	idpConfig?: [...#TenantInboundSAMLConfigIdPConfigObservation] @go(IdPConfig,[]TenantInboundSAMLConfigIdPConfigObservation)

	// The name of the InboundSamlConfig resource. Must start with 'saml.' and can only have alphanumeric characters,
	// hyphens, underscores or periods. The part after 'saml.' must also start with a lowercase letter, end with an
	// alphanumeric character, and have at least 2 characters.
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// SAML SP (Service Provider) configuration when the project acts as the relying party to receive
	// and accept an authentication assertion issued by a SAML identity provider.
	// Structure is documented below.
	spConfig?: [...#TenantInboundSAMLConfigSpConfigObservation] @go(SpConfig,[]TenantInboundSAMLConfigSpConfigObservation)

	// The name of the tenant where this inbound SAML config resource exists
	tenant?: null | string @go(Tenant,*string)
}

#TenantInboundSAMLConfigParameters: {
	// Human friendly display name.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// If this config allows users to sign in with the provider.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// SAML IdP configuration when the project acts as the relying party
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	idpConfig?: [...#TenantInboundSAMLConfigIdPConfigParameters] @go(IdPConfig,[]TenantInboundSAMLConfigIdPConfigParameters)

	// The name of the InboundSamlConfig resource. Must start with 'saml.' and can only have alphanumeric characters,
	// hyphens, underscores or periods. The part after 'saml.' must also start with a lowercase letter, end with an
	// alphanumeric character, and have at least 2 characters.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// SAML SP (Service Provider) configuration when the project acts as the relying party to receive
	// and accept an authentication assertion issued by a SAML identity provider.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	spConfig?: [...#TenantInboundSAMLConfigSpConfigParameters] @go(SpConfig,[]TenantInboundSAMLConfigSpConfigParameters)

	// The name of the tenant where this inbound SAML config resource exists
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/identityplatform/v1beta1.Tenant
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",true)
	// +kubebuilder:validation:Optional
	tenant?: null | string @go(Tenant,*string)
}

#TenantInboundSAMLConfigSpConfigObservation: {
	// Callback URI where responses from IDP are handled. Must start with https://.
	callbackUri?: null | string @go(CallbackURI,*string)

	// (Output)
	// The IDP's certificate data to verify the signature in the SAMLResponse issued by the IDP.
	// Structure is documented below.
	spCertificates?: [...#SpConfigSpCertificatesObservation] @go(SpCertificates,[]SpConfigSpCertificatesObservation)

	// Unique identifier for all SAML entities.
	spEntityId?: null | string @go(SpEntityID,*string)
}

#TenantInboundSAMLConfigSpConfigParameters: {
	// Callback URI where responses from IDP are handled. Must start with https://.
	// +kubebuilder:validation:Required
	callbackUri?: null | string @go(CallbackURI,*string)

	// Unique identifier for all SAML entities.
	// +kubebuilder:validation:Required
	spEntityId?: null | string @go(SpEntityID,*string)
}

// TenantInboundSAMLConfigSpec defines the desired state of TenantInboundSAMLConfig
#TenantInboundSAMLConfigSpec: {
	forProvider: #TenantInboundSAMLConfigParameters @go(ForProvider)
}

// TenantInboundSAMLConfigStatus defines the observed state of TenantInboundSAMLConfig.
#TenantInboundSAMLConfigStatus: {
	atProvider?: #TenantInboundSAMLConfigObservation @go(AtProvider)
}

// TenantInboundSAMLConfig is the Schema for the TenantInboundSAMLConfigs API. Inbound SAML configuration for a Identity Toolkit tenant.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#TenantInboundSAMLConfig: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.displayName)",message="displayName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.idpConfig)",message="idpConfig is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.spConfig)",message="spConfig is a required parameter"
	spec:    #TenantInboundSAMLConfigSpec   @go(Spec)
	status?: #TenantInboundSAMLConfigStatus @go(Status)
}

// TenantInboundSAMLConfigList contains a list of TenantInboundSAMLConfigs
#TenantInboundSAMLConfigList: {
	items: [...#TenantInboundSAMLConfig] @go(Items,[]TenantInboundSAMLConfig)
}