// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/dbforpostgresql/v1beta1

package v1beta1

#VirtualNetworkRuleObservation: {
	// The ID of the PostgreSQL Virtual Network Rule.
	id?: null | string @go(ID,*string)

	// Should the Virtual Network Rule be created before the Subnet has the Virtual Network Service Endpoint enabled?
	ignoreMissingVnetServiceEndpoint?: null | bool @go(IgnoreMissingVnetServiceEndpoint,*bool)

	// The name of the resource group where the PostgreSQL server resides. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The name of the SQL Server to which this PostgreSQL virtual network rule will be applied to. Changing this forces a new resource to be created.
	serverName?: null | string @go(ServerName,*string)

	// The ID of the subnet that the PostgreSQL server will be connected to.
	subnetId?: null | string @go(SubnetID,*string)
}

#VirtualNetworkRuleParameters: {
	// Should the Virtual Network Rule be created before the Subnet has the Virtual Network Service Endpoint enabled?
	// +kubebuilder:validation:Optional
	ignoreMissingVnetServiceEndpoint?: null | bool @go(IgnoreMissingVnetServiceEndpoint,*bool)

	// The name of the resource group where the PostgreSQL server resides. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The name of the SQL Server to which this PostgreSQL virtual network rule will be applied to. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=Server
	// +kubebuilder:validation:Optional
	serverName?: null | string @go(ServerName,*string)

	// The ID of the subnet that the PostgreSQL server will be connected to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.Subnet
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	subnetId?: null | string @go(SubnetID,*string)
}

// VirtualNetworkRuleSpec defines the desired state of VirtualNetworkRule
#VirtualNetworkRuleSpec: {
	forProvider: #VirtualNetworkRuleParameters @go(ForProvider)
}

// VirtualNetworkRuleStatus defines the observed state of VirtualNetworkRule.
#VirtualNetworkRuleStatus: {
	atProvider?: #VirtualNetworkRuleObservation @go(AtProvider)
}

// VirtualNetworkRule is the Schema for the VirtualNetworkRules API. Manages a PostgreSQL Virtual Network Rule.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#VirtualNetworkRule: {
	spec:    #VirtualNetworkRuleSpec   @go(Spec)
	status?: #VirtualNetworkRuleStatus @go(Status)
}

// VirtualNetworkRuleList contains a list of VirtualNetworkRules
#VirtualNetworkRuleList: {
	items: [...#VirtualNetworkRule] @go(Items,[]VirtualNetworkRule)
}