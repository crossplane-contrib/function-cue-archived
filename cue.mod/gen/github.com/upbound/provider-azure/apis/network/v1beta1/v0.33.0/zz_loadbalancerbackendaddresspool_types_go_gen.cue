// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/network/v1beta1

package v1beta1

#LoadBalancerBackendAddressPoolObservation: {
	// The Backend IP Configurations associated with this Backend Address Pool.
	backendIpConfigurations?: [...null | string] @go(BackendIPConfigurations,[]*string)

	// The ID of the Backend Address Pool.
	id?: null | string @go(ID,*string)

	// An array of the Load Balancing Inbound NAT Rules associated with this Backend Address Pool.
	inboundNatRules?: [...null | string] @go(InboundNATRules,[]*string)

	// The Load Balancing Rules associated with this Backend Address Pool.
	loadBalancingRules?: [...null | string] @go(LoadBalancingRules,[]*string)

	// The ID of the Load Balancer in which to create the Backend Address Pool. Changing this forces a new resource to be created.
	loadbalancerId?: null | string @go(LoadbalancerID,*string)

	// An array of the Load Balancing Outbound Rules associated with this Backend Address Pool.
	outboundRules?: [...null | string] @go(OutboundRules,[]*string)

	// One or more tunnel_interface blocks as defined below.
	tunnelInterface?: [...#TunnelInterfaceObservation] @go(TunnelInterface,[]TunnelInterfaceObservation)

	// The ID of the Virtual Network within which the Backend Address Pool should exist.
	virtualNetworkId?: null | string @go(VirtualNetworkID,*string)
}

#LoadBalancerBackendAddressPoolParameters: {
	// The ID of the Load Balancer in which to create the Backend Address Pool. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=LoadBalancer
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	loadbalancerId?: null | string @go(LoadbalancerID,*string)

	// One or more tunnel_interface blocks as defined below.
	// +kubebuilder:validation:Optional
	tunnelInterface?: [...#TunnelInterfaceParameters] @go(TunnelInterface,[]TunnelInterfaceParameters)

	// The ID of the Virtual Network within which the Backend Address Pool should exist.
	// +kubebuilder:validation:Optional
	virtualNetworkId?: null | string @go(VirtualNetworkID,*string)
}

#TunnelInterfaceObservation: {
	// The unique identifier of this Gateway Lodbalancer Tunnel Interface.
	identifier?: null | float64 @go(Identifier,*float64)

	// The port number that this Gateway Lodbalancer Tunnel Interface listens to.
	port?: null | float64 @go(Port,*float64)

	// The protocol used for this Gateway Lodbalancer Tunnel Interface. Possible values are None, Native and VXLAN.
	protocol?: null | string @go(Protocol,*string)

	// The traffic type of this Gateway Lodbalancer Tunnel Interface. Possible values are None, Internal and External.
	type?: null | string @go(Type,*string)
}

#TunnelInterfaceParameters: {
	// The unique identifier of this Gateway Lodbalancer Tunnel Interface.
	// +kubebuilder:validation:Required
	identifier?: null | float64 @go(Identifier,*float64)

	// The port number that this Gateway Lodbalancer Tunnel Interface listens to.
	// +kubebuilder:validation:Required
	port?: null | float64 @go(Port,*float64)

	// The protocol used for this Gateway Lodbalancer Tunnel Interface. Possible values are None, Native and VXLAN.
	// +kubebuilder:validation:Required
	protocol?: null | string @go(Protocol,*string)

	// The traffic type of this Gateway Lodbalancer Tunnel Interface. Possible values are None, Internal and External.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

// LoadBalancerBackendAddressPoolSpec defines the desired state of LoadBalancerBackendAddressPool
#LoadBalancerBackendAddressPoolSpec: {
	forProvider: #LoadBalancerBackendAddressPoolParameters @go(ForProvider)
}

// LoadBalancerBackendAddressPoolStatus defines the observed state of LoadBalancerBackendAddressPool.
#LoadBalancerBackendAddressPoolStatus: {
	atProvider?: #LoadBalancerBackendAddressPoolObservation @go(AtProvider)
}

// LoadBalancerBackendAddressPool is the Schema for the LoadBalancerBackendAddressPools API. Manages a Load Balancer Backend Address Pool.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#LoadBalancerBackendAddressPool: {
	spec:    #LoadBalancerBackendAddressPoolSpec   @go(Spec)
	status?: #LoadBalancerBackendAddressPoolStatus @go(Status)
}

// LoadBalancerBackendAddressPoolList contains a list of LoadBalancerBackendAddressPools
#LoadBalancerBackendAddressPoolList: {
	items: [...#LoadBalancerBackendAddressPool] @go(Items,[]LoadBalancerBackendAddressPool)
}