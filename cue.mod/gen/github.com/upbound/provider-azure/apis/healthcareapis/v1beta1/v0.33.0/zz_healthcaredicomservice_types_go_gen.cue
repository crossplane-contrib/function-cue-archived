// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/healthcareapis/v1beta1

package v1beta1

#AuthenticationObservation: {
	// The intended audience to receive authentication tokens for the service. The default value is https://dicom.azurehealthcareapis.azure.com
	audience?: [...null | string] @go(Audience,[]*string)

	// The Azure Active Directory (tenant) that serves as the authentication authority to access the service.
	// Authority must be registered to Azure AD and in the following format: https://{Azure-AD-endpoint}/{tenant-id}.
	authority?: null | string @go(Authority,*string)
}

#AuthenticationParameters: {
}

#HealthcareDICOMServiceObservation: {
	// The authentication block as defined below.
	authentication?: [...#AuthenticationObservation] @go(Authentication,[]AuthenticationObservation)

	// The ID of the Healthcare DICOM Service.
	id?: null | string @go(ID,*string)

	// An identity block as defined below.
	identity?: [...#IdentityObservation] @go(Identity,[]IdentityObservation)

	// Specifies the Azure Region where the Healthcare DICOM Service should be created. Changing this forces a new Healthcare DICOM Service to be created.
	location?: null | string @go(Location,*string)
	privateEndpoint?: [...#PrivateEndpointObservation] @go(PrivateEndpoint,[]PrivateEndpointObservation)

	// Whether to enabled public networks when data plane traffic coming from public networks while private endpoint is enabled. Defaults to true.
	publicNetworkAccessEnabled?: null | bool @go(PublicNetworkAccessEnabled,*bool)

	// The url of the Healthcare DICOM Services.
	serviceUrl?: null | string @go(ServiceURL,*string)

	// A mapping of tags to assign to the Healthcare DICOM Service.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the id of the Healthcare Workspace where the Healthcare DICOM Service should exist. Changing this forces a new Healthcare DICOM Service to be created.
	workspaceId?: null | string @go(WorkspaceID,*string)
}

#HealthcareDICOMServiceParameters: {
	// An identity block as defined below.
	// +kubebuilder:validation:Optional
	identity?: [...#IdentityParameters] @go(Identity,[]IdentityParameters)

	// Specifies the Azure Region where the Healthcare DICOM Service should be created. Changing this forces a new Healthcare DICOM Service to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Whether to enabled public networks when data plane traffic coming from public networks while private endpoint is enabled. Defaults to true.
	// +kubebuilder:validation:Optional
	publicNetworkAccessEnabled?: null | bool @go(PublicNetworkAccessEnabled,*bool)

	// A mapping of tags to assign to the Healthcare DICOM Service.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the id of the Healthcare Workspace where the Healthcare DICOM Service should exist. Changing this forces a new Healthcare DICOM Service to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/healthcareapis/v1beta1.HealthcareWorkspace
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	workspaceId?: null | string @go(WorkspaceID,*string)
}

#IdentityObservation: {
	// A list of User Assigned Identity IDs which should be assigned to this Healthcare DICOM service.
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// The ID of the Healthcare DICOM Service.
	principalId?: null | string @go(PrincipalID,*string)

	// The ID of the Healthcare DICOM Service.
	tenantId?: null | string @go(TenantID,*string)

	// The type of identity used for the Healthcare DICOM service. Possible values are UserAssigned, SystemAssigned and SystemAssigned, UserAssigned. If UserAssigned is set, an identity_ids must be set as well.
	type?: null | string @go(Type,*string)
}

#IdentityParameters: {
	// A list of User Assigned Identity IDs which should be assigned to this Healthcare DICOM service.
	// +kubebuilder:validation:Optional
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// The type of identity used for the Healthcare DICOM service. Possible values are UserAssigned, SystemAssigned and SystemAssigned, UserAssigned. If UserAssigned is set, an identity_ids must be set as well.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

#PrivateEndpointObservation: {
	// The ID of the Healthcare DICOM Service.
	id?: null | string @go(ID,*string)

	// Specifies the name of the Healthcare DICOM Service. Changing this forces a new Healthcare DICOM Service to be created.
	name?: null | string @go(Name,*string)
}

#PrivateEndpointParameters: {
}

// HealthcareDICOMServiceSpec defines the desired state of HealthcareDICOMService
#HealthcareDICOMServiceSpec: {
	forProvider: #HealthcareDICOMServiceParameters @go(ForProvider)
}

// HealthcareDICOMServiceStatus defines the observed state of HealthcareDICOMService.
#HealthcareDICOMServiceStatus: {
	atProvider?: #HealthcareDICOMServiceObservation @go(AtProvider)
}

// HealthcareDICOMService is the Schema for the HealthcareDICOMServices API. Manages a Healthcare DICOM (Digital Imaging and Communications in Medicine) Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#HealthcareDICOMService: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	spec:    #HealthcareDICOMServiceSpec   @go(Spec)
	status?: #HealthcareDICOMServiceStatus @go(Status)
}

// HealthcareDICOMServiceList contains a list of HealthcareDICOMServices
#HealthcareDICOMServiceList: {
	items: [...#HealthcareDICOMService] @go(Items,[]HealthcareDICOMService)
}