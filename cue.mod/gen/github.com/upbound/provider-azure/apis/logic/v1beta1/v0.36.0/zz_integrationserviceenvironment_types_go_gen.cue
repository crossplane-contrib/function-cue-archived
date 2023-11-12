// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/logic/v1beta1

package v1beta1

#IntegrationServiceEnvironmentInitParameters: {
	// The type of access endpoint to use for the Integration Service Environment. Possible Values are Internal and External. Changing this forces a new Integration Service Environment to be created.
	accessEndpointType?: null | string @go(AccessEndpointType,*string)

	// The Azure Region where the Integration Service Environment should exist. Changing this forces a new Integration Service Environment to be created.
	location?: null | string @go(Location,*string)

	// The SKU name and capacity of the Integration Service Environment. Possible values are Developer_0, Premium_0, Premium_1, Premium_2, Premium_3, Premium_4, Premium_5, Premium_6, Premium_7, Premium_8, Premium_9 and Premium_10.
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags which should be assigned to the Integration Service Environment.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#IntegrationServiceEnvironmentObservation: {
	// The type of access endpoint to use for the Integration Service Environment. Possible Values are Internal and External. Changing this forces a new Integration Service Environment to be created.
	accessEndpointType?: null | string @go(AccessEndpointType,*string)

	// The list of access endpoint IP addresses of connector.
	connectorEndpointIpAddresses?: [...null | string] @go(ConnectorEndpointIPAddresses,[]*string)

	// The list of outgoing IP addresses of connector.
	connectorOutboundIpAddresses?: [...null | string] @go(ConnectorOutboundIPAddresses,[]*string)

	// The ID of the Integration Service Environment.
	id?: null | string @go(ID,*string)

	// The Azure Region where the Integration Service Environment should exist. Changing this forces a new Integration Service Environment to be created.
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Integration Service Environment should exist. Changing this forces a new Integration Service Environment to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU name and capacity of the Integration Service Environment. Possible values are Developer_0, Premium_0, Premium_1, Premium_2, Premium_3, Premium_4, Premium_5, Premium_6, Premium_7, Premium_8, Premium_9 and Premium_10.
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags which should be assigned to the Integration Service Environment.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A list of virtual network subnet ids to be used by Integration Service Environment. Exactly four distinct ids to /27 subnets must be provided. Changing this forces a new Integration Service Environment to be created.
	virtualNetworkSubnetIds?: [...null | string] @go(VirtualNetworkSubnetIds,[]*string)

	// The list of access endpoint IP addresses of workflow.
	workflowEndpointIpAddresses?: [...null | string] @go(WorkflowEndpointIPAddresses,[]*string)

	// The list of outgoing IP addresses of workflow.
	workflowOutboundIpAddresses?: [...null | string] @go(WorkflowOutboundIPAddresses,[]*string)
}

#IntegrationServiceEnvironmentParameters: {
	// The type of access endpoint to use for the Integration Service Environment. Possible Values are Internal and External. Changing this forces a new Integration Service Environment to be created.
	// +kubebuilder:validation:Optional
	accessEndpointType?: null | string @go(AccessEndpointType,*string)

	// The Azure Region where the Integration Service Environment should exist. Changing this forces a new Integration Service Environment to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the Resource Group where the Integration Service Environment should exist. Changing this forces a new Integration Service Environment to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU name and capacity of the Integration Service Environment. Possible values are Developer_0, Premium_0, Premium_1, Premium_2, Premium_3, Premium_4, Premium_5, Premium_6, Premium_7, Premium_8, Premium_9 and Premium_10.
	// +kubebuilder:validation:Optional
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags which should be assigned to the Integration Service Environment.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A list of virtual network subnet ids to be used by Integration Service Environment. Exactly four distinct ids to /27 subnets must be provided. Changing this forces a new Integration Service Environment to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.Subnet
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("id",true)
	// +kubebuilder:validation:Optional
	virtualNetworkSubnetIds?: [...null | string] @go(VirtualNetworkSubnetIds,[]*string)
}

// IntegrationServiceEnvironmentSpec defines the desired state of IntegrationServiceEnvironment
#IntegrationServiceEnvironmentSpec: {
	forProvider: #IntegrationServiceEnvironmentParameters @go(ForProvider)

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
	initProvider?: #IntegrationServiceEnvironmentInitParameters @go(InitProvider)
}

// IntegrationServiceEnvironmentStatus defines the observed state of IntegrationServiceEnvironment.
#IntegrationServiceEnvironmentStatus: {
	atProvider?: #IntegrationServiceEnvironmentObservation @go(AtProvider)
}

// IntegrationServiceEnvironment is the Schema for the IntegrationServiceEnvironments API. Manages private and isolated Logic App instances within an Azure virtual network.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#IntegrationServiceEnvironment: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.accessEndpointType) || has(self.initProvider.accessEndpointType)",message="accessEndpointType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || has(self.initProvider.location)",message="location is a required parameter"
	spec:    #IntegrationServiceEnvironmentSpec   @go(Spec)
	status?: #IntegrationServiceEnvironmentStatus @go(Status)
}

// IntegrationServiceEnvironmentList contains a list of IntegrationServiceEnvironments
#IntegrationServiceEnvironmentList: {
	items: [...#IntegrationServiceEnvironment] @go(Items,[]IntegrationServiceEnvironment)
}