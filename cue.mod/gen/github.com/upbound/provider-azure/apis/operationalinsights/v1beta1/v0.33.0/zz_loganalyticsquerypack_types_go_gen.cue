// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/operationalinsights/v1beta1

package v1beta1

#LogAnalyticsQueryPackObservation: {
	// The ID of the Log Analytics Query Pack.
	id?: null | string @go(ID,*string)

	// The Azure Region where the Log Analytics Query Pack should exist. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Log Analytics Query Pack should exist. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags which should be assigned to the Log Analytics Query Pack.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#LogAnalyticsQueryPackParameters: {
	// The Azure Region where the Log Analytics Query Pack should exist. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Log Analytics Query Pack should exist. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags which should be assigned to the Log Analytics Query Pack.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// LogAnalyticsQueryPackSpec defines the desired state of LogAnalyticsQueryPack
#LogAnalyticsQueryPackSpec: {
	forProvider: #LogAnalyticsQueryPackParameters @go(ForProvider)
}

// LogAnalyticsQueryPackStatus defines the observed state of LogAnalyticsQueryPack.
#LogAnalyticsQueryPackStatus: {
	atProvider?: #LogAnalyticsQueryPackObservation @go(AtProvider)
}

// LogAnalyticsQueryPack is the Schema for the LogAnalyticsQueryPacks API. Manages a Log Analytics Query Pack.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#LogAnalyticsQueryPack: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	spec:    #LogAnalyticsQueryPackSpec   @go(Spec)
	status?: #LogAnalyticsQueryPackStatus @go(Status)
}

// LogAnalyticsQueryPackList contains a list of LogAnalyticsQueryPacks
#LogAnalyticsQueryPackList: {
	items: [...#LogAnalyticsQueryPack] @go(Items,[]LogAnalyticsQueryPack)
}