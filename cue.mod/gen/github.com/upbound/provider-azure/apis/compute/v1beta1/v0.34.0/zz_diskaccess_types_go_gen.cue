// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/compute/v1beta1

package v1beta1

#DiskAccessObservation: {
	// The ID of the Disk Access resource.
	id?: null | string @go(ID,*string)

	// The Azure Region where the Disk Access should exist. Changing this forces a new Disk to be created.
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Disk Access should exist. Changing this forces a new Disk Access to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags which should be assigned to the Disk Access.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#DiskAccessParameters: {
	// The Azure Region where the Disk Access should exist. Changing this forces a new Disk to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Disk Access should exist. Changing this forces a new Disk Access to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags which should be assigned to the Disk Access.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// DiskAccessSpec defines the desired state of DiskAccess
#DiskAccessSpec: {
	forProvider: #DiskAccessParameters @go(ForProvider)
}

// DiskAccessStatus defines the observed state of DiskAccess.
#DiskAccessStatus: {
	atProvider?: #DiskAccessObservation @go(AtProvider)
}

// DiskAccess is the Schema for the DiskAccesss API. Manages a Disk Access.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#DiskAccess: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	spec:    #DiskAccessSpec   @go(Spec)
	status?: #DiskAccessStatus @go(Status)
}

// DiskAccessList contains a list of DiskAccesss
#DiskAccessList: {
	items: [...#DiskAccess] @go(Items,[]DiskAccess)
}