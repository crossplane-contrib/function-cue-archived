// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-azure/apis/database/v1alpha3

package v1alpha3

// OperationCreateServer is the operation type for creating a new mysql
// server.
#OperationCreateServer: "createServer"

// OperationCreateFirewallRules is the operation type for creating a
// firewall rule.
#OperationCreateFirewallRules: "createFirewallRules"

// VirtualNetworkRuleProperties defines the properties of a VirtualNetworkRule.
#VirtualNetworkRuleProperties: {
	// VirtualNetworkSubnetID - The ARM resource id of the virtual network
	// subnet.
	virtualNetworkSubnetId?: string @go(VirtualNetworkSubnetID)

	// IgnoreMissingVnetServiceEndpoint - Create firewall rule before the
	// virtual network has vnet service endpoint enabled.
	ignoreMissingVnetServiceEndpoint?: bool @go(IgnoreMissingVnetServiceEndpoint)
}

// A VirtualNetworkRuleStatus represents the observed state of a
// VirtualNetworkRule.
#VirtualNetworkRuleStatus: {
	// State of this virtual network rule.
	state?: string @go(State)

	// A Message containing details about the state of this virtual network
	// rule, if any.
	message?: string @go(Message)

	// ID - Resource ID
	id?: string @go(ID)

	// Type - Resource type.
	type?: string @go(Type)
}

// A PostgreSQLVirtualNetworkRuleSpec defines the desired state of a PostgreSQLVirtualNetworkRule.
#PostgreSQLVirtualNetworkRuleSpec: {
	// ServerName - Name of the Virtual Network Rule's PostgreSQLServer.
	serverName?: string @go(ServerName)

	// ResourceGroupName - Name of the Virtual Network Rule's resource group.
	resourceGroupName?: string @go(ResourceGroupName)

	// VirtualNetworkRuleProperties - Resource properties.
	properties: #VirtualNetworkRuleProperties @go(VirtualNetworkRuleProperties)
}

// A PostgreSQLServerVirtualNetworkRule is a managed resource that represents
// an Azure PostgreSQL Database virtual network rule.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="STATE",type="string",JSONPath=".status.state"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#PostgreSQLServerVirtualNetworkRule: {
	spec:    #PostgreSQLVirtualNetworkRuleSpec @go(Spec)
	status?: #VirtualNetworkRuleStatus         @go(Status)
}

// PostgreSQLServerVirtualNetworkRuleList contains a list of PostgreSQLServerVirtualNetworkRule.
#PostgreSQLServerVirtualNetworkRuleList: {
	items: [...#PostgreSQLServerVirtualNetworkRule] @go(Items,[]PostgreSQLServerVirtualNetworkRule)
}

// A MySQLVirtualNetworkRuleSpec defines the desired state of a MySQLVirtualNetworkRule.
#MySQLVirtualNetworkRuleSpec: {
	// ServerName - Name of the Virtual Network Rule's server.
	serverName?: string @go(ServerName)

	// ResourceGroupName - Name of the Virtual Network Rule's resource group.
	resourceGroupName?: string @go(ResourceGroupName)

	// VirtualNetworkRuleProperties - Resource properties.
	properties: #VirtualNetworkRuleProperties @go(VirtualNetworkRuleProperties)
}

// A MySQLServerVirtualNetworkRule is a managed resource that represents an
// Azure MySQL Database virtual network rule.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="STATE",type="string",JSONPath=".status.state"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#MySQLServerVirtualNetworkRule: {
	spec:    #MySQLVirtualNetworkRuleSpec @go(Spec)
	status?: #VirtualNetworkRuleStatus    @go(Status)
}

// MySQLServerVirtualNetworkRuleList contains a list of
// MySQLServerVirtualNetworkRule.
#MySQLServerVirtualNetworkRuleList: {
	items: [...#MySQLServerVirtualNetworkRule] @go(Items,[]MySQLServerVirtualNetworkRule)
}