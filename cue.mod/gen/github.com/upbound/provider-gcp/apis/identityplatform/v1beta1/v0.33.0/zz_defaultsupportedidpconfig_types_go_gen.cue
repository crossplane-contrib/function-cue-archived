// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/identityplatform/v1beta1

package v1beta1

#DefaultSupportedIdPConfigObservation: {
	// If this IDP allows the user to sign in
	enabled?: null | bool @go(Enabled,*bool)

	// an identifier for the resource with format projects/{{project}}/defaultSupportedIdpConfigs/{{idp_id}}
	id?: null | string @go(ID,*string)

	// ID of the IDP. Possible values include:
	idpId?: null | string @go(IdPID,*string)

	// The name of the DefaultSupportedIdpConfig resource
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#DefaultSupportedIdPConfigParameters: {
	// If this IDP allows the user to sign in
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// ID of the IDP. Possible values include:
	// +kubebuilder:validation:Optional
	idpId?: null | string @go(IdPID,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// DefaultSupportedIdPConfigSpec defines the desired state of DefaultSupportedIdPConfig
#DefaultSupportedIdPConfigSpec: {
	forProvider: #DefaultSupportedIdPConfigParameters @go(ForProvider)
}

// DefaultSupportedIdPConfigStatus defines the observed state of DefaultSupportedIdPConfig.
#DefaultSupportedIdPConfigStatus: {
	atProvider?: #DefaultSupportedIdPConfigObservation @go(AtProvider)
}

// DefaultSupportedIdPConfig is the Schema for the DefaultSupportedIdPConfigs API. Configurations options for authenticating with a the standard set of Identity Toolkit-trusted IDPs.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#DefaultSupportedIdPConfig: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.clientIdSecretRef)",message="clientIdSecretRef is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.clientSecretSecretRef)",message="clientSecretSecretRef is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.idpId)",message="idpId is a required parameter"
	spec:    #DefaultSupportedIdPConfigSpec   @go(Spec)
	status?: #DefaultSupportedIdPConfigStatus @go(Status)
}

// DefaultSupportedIdPConfigList contains a list of DefaultSupportedIdPConfigs
#DefaultSupportedIdPConfigList: {
	items: [...#DefaultSupportedIdPConfig] @go(Items,[]DefaultSupportedIdPConfig)
}