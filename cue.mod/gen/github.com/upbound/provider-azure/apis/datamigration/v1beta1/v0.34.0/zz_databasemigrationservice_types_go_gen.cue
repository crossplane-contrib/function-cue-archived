// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/datamigration/v1beta1

package v1beta1

#DatabaseMigrationServiceObservation: {
	// The ID of Database Migration Service.
	id?: null | string @go(ID,*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Specify the name of the database migration service. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// Name of the resource group in which to create the database migration service. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU name of the database migration service. Possible values are Premium_4vCores, Standard_1vCores, Standard_2vCores and Standard_4vCores. Changing this forces a new resource to be created.
	skuName?: null | string @go(SkuName,*string)

	// The ID of the virtual subnet resource to which the database migration service should be joined. Changing this forces a new resource to be created.
	subnetId?: null | string @go(SubnetID,*string)

	// A mapping of tags to assigned to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#DatabaseMigrationServiceParameters: {
	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Specify the name of the database migration service. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Name of the resource group in which to create the database migration service. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU name of the database migration service. Possible values are Premium_4vCores, Standard_1vCores, Standard_2vCores and Standard_4vCores. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	skuName?: null | string @go(SkuName,*string)

	// The ID of the virtual subnet resource to which the database migration service should be joined. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.Subnet
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	subnetId?: null | string @go(SubnetID,*string)

	// A mapping of tags to assigned to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// DatabaseMigrationServiceSpec defines the desired state of DatabaseMigrationService
#DatabaseMigrationServiceSpec: {
	forProvider: #DatabaseMigrationServiceParameters @go(ForProvider)
}

// DatabaseMigrationServiceStatus defines the observed state of DatabaseMigrationService.
#DatabaseMigrationServiceStatus: {
	atProvider?: #DatabaseMigrationServiceObservation @go(AtProvider)
}

// DatabaseMigrationService is the Schema for the DatabaseMigrationServices API. Manage a Azure Database Migration Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#DatabaseMigrationService: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.skuName)",message="skuName is a required parameter"
	spec:    #DatabaseMigrationServiceSpec   @go(Spec)
	status?: #DatabaseMigrationServiceStatus @go(Status)
}

// DatabaseMigrationServiceList contains a list of DatabaseMigrationServices
#DatabaseMigrationServiceList: {
	items: [...#DatabaseMigrationService] @go(Items,[]DatabaseMigrationService)
}