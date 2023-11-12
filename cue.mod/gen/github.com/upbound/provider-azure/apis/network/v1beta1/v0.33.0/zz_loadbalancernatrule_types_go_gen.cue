// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/network/v1beta1

package v1beta1

#LoadBalancerNatRuleObservation: {
	// Specifies a reference to backendAddressPool resource.
	backendAddressPoolId?: null | string @go(BackendAddressPoolID,*string)

	// The ID of the Load Balancer NAT Rule.
	backendIpConfigurationId?: null | string @go(BackendIPConfigurationID,*string)

	// The port used for internal connections on the endpoint. Possible values range between 1 and 65535, inclusive.
	backendPort?: null | float64 @go(BackendPort,*float64)

	// Are the Floating IPs enabled for this Load Balancer Rule? A "floating” IP is reassigned to a secondary server in case the primary server fails. Required to configure a SQL AlwaysOn Availability Group. Defaults to false.
	enableFloatingIp?: null | bool @go(EnableFloatingIP,*bool)

	// Is TCP Reset enabled for this Load Balancer Rule?
	enableTcpReset?: null | bool @go(EnableTCPReset,*bool)

	// The ID of the Load Balancer NAT Rule.
	frontendIpConfigurationId?: null | string @go(FrontendIPConfigurationID,*string)

	// The name of the frontend IP configuration exposing this rule.
	frontendIpConfigurationName?: null | string @go(FrontendIPConfigurationName,*string)

	// The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 1 and 65534, inclusive.
	frontendPort?: null | float64 @go(FrontendPort,*float64)

	// The port range end for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeStart. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. Acceptable values range from 1 to 65534, inclusive.
	frontendPortEnd?: null | float64 @go(FrontendPortEnd,*float64)

	// The port range start for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeEnd. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. Acceptable values range from 1 to 65534, inclusive.
	frontendPortStart?: null | float64 @go(FrontendPortStart,*float64)

	// The ID of the Load Balancer NAT Rule.
	id?: null | string @go(ID,*string)

	// Specifies the idle timeout in minutes for TCP connections. Valid values are between 4 and 30 minutes. Defaults to 4 minutes.
	idleTimeoutInMinutes?: null | float64 @go(IdleTimeoutInMinutes,*float64)

	// The ID of the Load Balancer in which to create the NAT Rule. Changing this forces a new resource to be created.
	loadbalancerId?: null | string @go(LoadbalancerID,*string)

	// The transport protocol for the external endpoint. Possible values are Udp, Tcp or All.
	protocol?: null | string @go(Protocol,*string)

	// The name of the resource group in which to create the resource. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#LoadBalancerNatRuleParameters: {
	// Specifies a reference to backendAddressPool resource.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.LoadBalancerBackendAddressPool
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	backendAddressPoolId?: null | string @go(BackendAddressPoolID,*string)

	// The port used for internal connections on the endpoint. Possible values range between 1 and 65535, inclusive.
	// +kubebuilder:validation:Optional
	backendPort?: null | float64 @go(BackendPort,*float64)

	// Are the Floating IPs enabled for this Load Balancer Rule? A "floating” IP is reassigned to a secondary server in case the primary server fails. Required to configure a SQL AlwaysOn Availability Group. Defaults to false.
	// +kubebuilder:validation:Optional
	enableFloatingIp?: null | bool @go(EnableFloatingIP,*bool)

	// Is TCP Reset enabled for this Load Balancer Rule?
	// +kubebuilder:validation:Optional
	enableTcpReset?: null | bool @go(EnableTCPReset,*bool)

	// The name of the frontend IP configuration exposing this rule.
	// +kubebuilder:validation:Optional
	frontendIpConfigurationName?: null | string @go(FrontendIPConfigurationName,*string)

	// The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 1 and 65534, inclusive.
	// +kubebuilder:validation:Optional
	frontendPort?: null | float64 @go(FrontendPort,*float64)

	// The port range end for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeStart. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. Acceptable values range from 1 to 65534, inclusive.
	// +kubebuilder:validation:Optional
	frontendPortEnd?: null | float64 @go(FrontendPortEnd,*float64)

	// The port range start for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeEnd. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. Acceptable values range from 1 to 65534, inclusive.
	// +kubebuilder:validation:Optional
	frontendPortStart?: null | float64 @go(FrontendPortStart,*float64)

	// Specifies the idle timeout in minutes for TCP connections. Valid values are between 4 and 30 minutes. Defaults to 4 minutes.
	// +kubebuilder:validation:Optional
	idleTimeoutInMinutes?: null | float64 @go(IdleTimeoutInMinutes,*float64)

	// The ID of the Load Balancer in which to create the NAT Rule. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=LoadBalancer
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	loadbalancerId?: null | string @go(LoadbalancerID,*string)

	// The transport protocol for the external endpoint. Possible values are Udp, Tcp or All.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// The name of the resource group in which to create the resource. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

// LoadBalancerNatRuleSpec defines the desired state of LoadBalancerNatRule
#LoadBalancerNatRuleSpec: {
	forProvider: #LoadBalancerNatRuleParameters @go(ForProvider)
}

// LoadBalancerNatRuleStatus defines the observed state of LoadBalancerNatRule.
#LoadBalancerNatRuleStatus: {
	atProvider?: #LoadBalancerNatRuleObservation @go(AtProvider)
}

// LoadBalancerNatRule is the Schema for the LoadBalancerNatRules API. Manages a Load Balancer NAT Rule.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#LoadBalancerNatRule: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.backendPort)",message="backendPort is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.frontendIpConfigurationName)",message="frontendIpConfigurationName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.protocol)",message="protocol is a required parameter"
	spec:    #LoadBalancerNatRuleSpec   @go(Spec)
	status?: #LoadBalancerNatRuleStatus @go(Status)
}

// LoadBalancerNatRuleList contains a list of LoadBalancerNatRules
#LoadBalancerNatRuleList: {
	items: [...#LoadBalancerNatRule] @go(Items,[]LoadBalancerNatRule)
}