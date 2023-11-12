// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/healthcareapis/v1beta1

package v1beta1

#HealthcareWorkspaceObservation: {
	// The ID of the Healthcare Workspace.
	id?: null | string @go(ID,*string)

	// Specifies the Azure Region where the Healthcare Workspace should be created. Changing this forces a new Healthcare Workspace to be created.
	location?: null | string @go(Location,*string)
	privateEndpointConnection?: [...#PrivateEndpointConnectionObservation] @go(PrivateEndpointConnection,[]PrivateEndpointConnectionObservation)

	// Specifies the name of the Resource Group where the Healthcare Workspace should exist. Changing this forces a new Healthcare Workspace to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the Healthcare Workspace.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#HealthcareWorkspaceParameters: {
	// Specifies the Azure Region where the Healthcare Workspace should be created. Changing this forces a new Healthcare Workspace to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Specifies the name of the Resource Group where the Healthcare Workspace should exist. Changing this forces a new Healthcare Workspace to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the Healthcare Workspace.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#PrivateEndpointConnectionObservation: {
	// The ID of the Healthcare Workspace.
	id?: null | string @go(ID,*string)

	// Specifies the name of the Healthcare Workspace. Changing this forces a new Healthcare Workspace to be created.
	name?: null | string @go(Name,*string)
}

#PrivateEndpointConnectionParameters: {
}

// HealthcareWorkspaceSpec defines the desired state of HealthcareWorkspace
#HealthcareWorkspaceSpec: {
	forProvider: #HealthcareWorkspaceParameters @go(ForProvider)
}

// HealthcareWorkspaceStatus defines the observed state of HealthcareWorkspace.
#HealthcareWorkspaceStatus: {
	atProvider?: #HealthcareWorkspaceObservation @go(AtProvider)
}

// HealthcareWorkspace is the Schema for the HealthcareWorkspaces API. Manages a Healthcare Workspace.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#HealthcareWorkspace: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	spec:    #HealthcareWorkspaceSpec   @go(Spec)
	status?: #HealthcareWorkspaceStatus @go(Status)
}

// HealthcareWorkspaceList contains a list of HealthcareWorkspaces
#HealthcareWorkspaceList: {
	items: [...#HealthcareWorkspace] @go(Items,[]HealthcareWorkspace)
}