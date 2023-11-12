// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/portal/v1beta1

package v1beta1

#DashboardObservation: {
	// JSON data representing dashboard body. See above for details on how to obtain this from the Portal.
	dashboardProperties?: null | string @go(DashboardProperties,*string)

	// The ID of the Dashboard.
	id?: null | string @go(ID,*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Specifies the name of the Shared Dashboard. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// The name of the resource group in which to create the dashboard. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#DashboardParameters: {
	// JSON data representing dashboard body. See above for details on how to obtain this from the Portal.
	// +kubebuilder:validation:Optional
	dashboardProperties?: null | string @go(DashboardProperties,*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Specifies the name of the Shared Dashboard. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The name of the resource group in which to create the dashboard. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// DashboardSpec defines the desired state of Dashboard
#DashboardSpec: {
	forProvider: #DashboardParameters @go(ForProvider)
}

// DashboardStatus defines the observed state of Dashboard.
#DashboardStatus: {
	atProvider?: #DashboardObservation @go(AtProvider)
}

// Dashboard is the Schema for the Dashboards API. Manages a shared dashboard in the Azure Portal.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Dashboard: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.dashboardProperties)",message="dashboardProperties is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #DashboardSpec   @go(Spec)
	status?: #DashboardStatus @go(Status)
}

// DashboardList contains a list of Dashboards
#DashboardList: {
	items: [...#Dashboard] @go(Items,[]Dashboard)
}