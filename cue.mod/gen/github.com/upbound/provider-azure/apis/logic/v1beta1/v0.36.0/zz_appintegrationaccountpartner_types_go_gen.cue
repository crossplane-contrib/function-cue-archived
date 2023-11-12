// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/logic/v1beta1

package v1beta1

#AppIntegrationAccountPartnerInitParameters: {
	// A business_identity block as documented below.
	businessIdentity?: [...#BusinessIdentityInitParameters] @go(BusinessIdentity,[]BusinessIdentityInitParameters)

	// A JSON mapping of any Metadata for this Logic App Integration Account Partner.
	metadata?: null | string @go(Metadata,*string)
}

#AppIntegrationAccountPartnerObservation: {
	// A business_identity block as documented below.
	businessIdentity?: [...#BusinessIdentityObservation] @go(BusinessIdentity,[]BusinessIdentityObservation)

	// The ID of the Logic App Integration Account Partner.
	id?: null | string @go(ID,*string)

	// The name of the Logic App Integration Account. Changing this forces a new Logic App Integration Account Partner to be created.
	integrationAccountName?: null | string @go(IntegrationAccountName,*string)

	// A JSON mapping of any Metadata for this Logic App Integration Account Partner.
	metadata?: null | string @go(Metadata,*string)

	// The name of the Resource Group where the Logic App Integration Account Partner should exist. Changing this forces a new Logic App Integration Account Partner to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#AppIntegrationAccountPartnerParameters: {
	// A business_identity block as documented below.
	// +kubebuilder:validation:Optional
	businessIdentity?: [...#BusinessIdentityParameters] @go(BusinessIdentity,[]BusinessIdentityParameters)

	// The name of the Logic App Integration Account. Changing this forces a new Logic App Integration Account Partner to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/logic/v1beta1.AppIntegrationAccount
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	integrationAccountName?: null | string @go(IntegrationAccountName,*string)

	// A JSON mapping of any Metadata for this Logic App Integration Account Partner.
	// +kubebuilder:validation:Optional
	metadata?: null | string @go(Metadata,*string)

	// The name of the Resource Group where the Logic App Integration Account Partner should exist. Changing this forces a new Logic App Integration Account Partner to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#BusinessIdentityInitParameters: {
	// The authenticating body that provides unique business identities to organizations.
	qualifier?: null | string @go(Qualifier,*string)

	// The value that identifies the documents that your logic apps receive.
	value?: null | string @go(Value,*string)
}

#BusinessIdentityObservation: {
	// The authenticating body that provides unique business identities to organizations.
	qualifier?: null | string @go(Qualifier,*string)

	// The value that identifies the documents that your logic apps receive.
	value?: null | string @go(Value,*string)
}

#BusinessIdentityParameters: {
	// The authenticating body that provides unique business identities to organizations.
	// +kubebuilder:validation:Optional
	qualifier?: null | string @go(Qualifier,*string)

	// The value that identifies the documents that your logic apps receive.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

// AppIntegrationAccountPartnerSpec defines the desired state of AppIntegrationAccountPartner
#AppIntegrationAccountPartnerSpec: {
	forProvider: #AppIntegrationAccountPartnerParameters @go(ForProvider)

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
	initProvider?: #AppIntegrationAccountPartnerInitParameters @go(InitProvider)
}

// AppIntegrationAccountPartnerStatus defines the observed state of AppIntegrationAccountPartner.
#AppIntegrationAccountPartnerStatus: {
	atProvider?: #AppIntegrationAccountPartnerObservation @go(AtProvider)
}

// AppIntegrationAccountPartner is the Schema for the AppIntegrationAccountPartners API. Manages a Logic App Integration Account Partner.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#AppIntegrationAccountPartner: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.businessIdentity) || has(self.initProvider.businessIdentity)",message="businessIdentity is a required parameter"
	spec:    #AppIntegrationAccountPartnerSpec   @go(Spec)
	status?: #AppIntegrationAccountPartnerStatus @go(Status)
}

// AppIntegrationAccountPartnerList contains a list of AppIntegrationAccountPartners
#AppIntegrationAccountPartnerList: {
	items: [...#AppIntegrationAccountPartner] @go(Items,[]AppIntegrationAccountPartner)
}