// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/appengine/v1beta1

package v1beta1

#NetworkSettingsObservation: {
	// The ingress settings for version or service.
	// Default value is INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED.
	// Possible values are: INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED, INGRESS_TRAFFIC_ALLOWED_ALL, INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY, INGRESS_TRAFFIC_ALLOWED_INTERNAL_AND_LB.
	ingressTrafficAllowed?: null | string @go(IngressTrafficAllowed,*string)
}

#NetworkSettingsParameters: {
	// The ingress settings for version or service.
	// Default value is INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED.
	// Possible values are: INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED, INGRESS_TRAFFIC_ALLOWED_ALL, INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY, INGRESS_TRAFFIC_ALLOWED_INTERNAL_AND_LB.
	// +kubebuilder:validation:Optional
	ingressTrafficAllowed?: null | string @go(IngressTrafficAllowed,*string)
}

#ServiceNetworkSettingsObservation: {
	// an identifier for the resource with format apps/{{project}}/services/{{service}}
	id?: null | string @go(ID,*string)

	// Ingress settings for this service. Will apply to all versions.
	// Structure is documented below.
	networkSettings?: [...#NetworkSettingsObservation] @go(NetworkSettings,[]NetworkSettingsObservation)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The name of the service these settings apply to.
	service?: null | string @go(Service,*string)
}

#ServiceNetworkSettingsParameters: {
	// Ingress settings for this service. Will apply to all versions.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	networkSettings?: [...#NetworkSettingsParameters] @go(NetworkSettings,[]NetworkSettingsParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The name of the service these settings apply to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/appengine/v1beta1.StandardAppVersion
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("service",false)
	// +kubebuilder:validation:Optional
	service?: null | string @go(Service,*string)
}

// ServiceNetworkSettingsSpec defines the desired state of ServiceNetworkSettings
#ServiceNetworkSettingsSpec: {
	forProvider: #ServiceNetworkSettingsParameters @go(ForProvider)
}

// ServiceNetworkSettingsStatus defines the observed state of ServiceNetworkSettings.
#ServiceNetworkSettingsStatus: {
	atProvider?: #ServiceNetworkSettingsObservation @go(AtProvider)
}

// ServiceNetworkSettings is the Schema for the ServiceNetworkSettingss API. A NetworkSettings resource is a container for ingress settings for a version or service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ServiceNetworkSettings: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.networkSettings)",message="networkSettings is a required parameter"
	spec:    #ServiceNetworkSettingsSpec   @go(Spec)
	status?: #ServiceNetworkSettingsStatus @go(Status)
}

// ServiceNetworkSettingsList contains a list of ServiceNetworkSettingss
#ServiceNetworkSettingsList: {
	items: [...#ServiceNetworkSettings] @go(Items,[]ServiceNetworkSettings)
}