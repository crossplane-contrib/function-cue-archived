// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/security/v1beta1

package v1beta1

#SecurityCenterSettingInitParameters: {
	// Boolean flag to enable/disable data access.
	enabled?: null | bool @go(Enabled,*bool)

	// The setting to manage. Possible values are MCAS , WDATP and SENTINEL. Changing this forces a new resource to be created.
	settingName?: null | string @go(SettingName,*string)
}

#SecurityCenterSettingObservation: {
	// Boolean flag to enable/disable data access.
	enabled?: null | bool @go(Enabled,*bool)

	// The subscription security center setting id.
	id?: null | string @go(ID,*string)

	// The setting to manage. Possible values are MCAS , WDATP and SENTINEL. Changing this forces a new resource to be created.
	settingName?: null | string @go(SettingName,*string)
}

#SecurityCenterSettingParameters: {
	// Boolean flag to enable/disable data access.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// The setting to manage. Possible values are MCAS , WDATP and SENTINEL. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	settingName?: null | string @go(SettingName,*string)
}

// SecurityCenterSettingSpec defines the desired state of SecurityCenterSetting
#SecurityCenterSettingSpec: {
	forProvider: #SecurityCenterSettingParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #SecurityCenterSettingInitParameters @go(InitProvider)
}

// SecurityCenterSettingStatus defines the observed state of SecurityCenterSetting.
#SecurityCenterSettingStatus: {
	atProvider?: #SecurityCenterSettingObservation @go(AtProvider)
}

// SecurityCenterSetting is the Schema for the SecurityCenterSettings API. Manages the Data Access Settings for Azure Security Center.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#SecurityCenterSetting: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.enabled) || (has(self.initProvider) && has(self.initProvider.enabled))",message="spec.forProvider.enabled is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.settingName) || (has(self.initProvider) && has(self.initProvider.settingName))",message="spec.forProvider.settingName is a required parameter"
	spec:    #SecurityCenterSettingSpec   @go(Spec)
	status?: #SecurityCenterSettingStatus @go(Status)
}

// SecurityCenterSettingList contains a list of SecurityCenterSettings
#SecurityCenterSettingList: {
	items: [...#SecurityCenterSetting] @go(Items,[]SecurityCenterSetting)
}