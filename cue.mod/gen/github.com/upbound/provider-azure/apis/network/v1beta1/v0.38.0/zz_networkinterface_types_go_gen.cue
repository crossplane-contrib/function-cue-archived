// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/network/v1beta1

package v1beta1

#NetworkInterfaceIPConfigurationInitParameters: {
	// The Frontend IP Configuration ID of a Gateway SKU Load Balancer.
	gatewayLoadBalancerFrontendIpConfigurationId?: null | string @go(GatewayLoadBalancerFrontendIPConfigurationID,*string)

	// A name used for this IP Configuration.
	name?: null | string @go(Name,*string)

	// Is this the Primary IP Configuration? Must be true for the first ip_configuration when multiple are specified. Defaults to false.
	primary?: null | bool @go(Primary,*bool)

	// The Static IP Address which should be used.
	privateIpAddress?: null | string @go(PrivateIPAddress,*string)

	// The allocation method used for the Private IP Address. Possible values are Dynamic and Static.
	privateIpAddressAllocation?: null | string @go(PrivateIPAddressAllocation,*string)

	// The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4.
	privateIpAddressVersion?: null | string @go(PrivateIPAddressVersion,*string)

	// Reference to a Public IP Address to associate with this NIC
	publicIpAddressId?: null | string @go(PublicIPAddressID,*string)
}

#NetworkInterfaceIPConfigurationObservation: {
	// The Frontend IP Configuration ID of a Gateway SKU Load Balancer.
	gatewayLoadBalancerFrontendIpConfigurationId?: null | string @go(GatewayLoadBalancerFrontendIPConfigurationID,*string)

	// A name used for this IP Configuration.
	name?: null | string @go(Name,*string)

	// Is this the Primary IP Configuration? Must be true for the first ip_configuration when multiple are specified. Defaults to false.
	primary?: null | bool @go(Primary,*bool)

	// The Static IP Address which should be used.
	privateIpAddress?: null | string @go(PrivateIPAddress,*string)

	// The allocation method used for the Private IP Address. Possible values are Dynamic and Static.
	privateIpAddressAllocation?: null | string @go(PrivateIPAddressAllocation,*string)

	// The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4.
	privateIpAddressVersion?: null | string @go(PrivateIPAddressVersion,*string)

	// Reference to a Public IP Address to associate with this NIC
	publicIpAddressId?: null | string @go(PublicIPAddressID,*string)

	// The ID of the Subnet where this Network Interface should be located in.
	subnetId?: null | string @go(SubnetID,*string)
}

#NetworkInterfaceIPConfigurationParameters: {
	// The Frontend IP Configuration ID of a Gateway SKU Load Balancer.
	// +kubebuilder:validation:Optional
	gatewayLoadBalancerFrontendIpConfigurationId?: null | string @go(GatewayLoadBalancerFrontendIPConfigurationID,*string)

	// A name used for this IP Configuration.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Is this the Primary IP Configuration? Must be true for the first ip_configuration when multiple are specified. Defaults to false.
	// +kubebuilder:validation:Optional
	primary?: null | bool @go(Primary,*bool)

	// The Static IP Address which should be used.
	// +kubebuilder:validation:Optional
	privateIpAddress?: null | string @go(PrivateIPAddress,*string)

	// The allocation method used for the Private IP Address. Possible values are Dynamic and Static.
	// +kubebuilder:validation:Optional
	privateIpAddressAllocation?: null | string @go(PrivateIPAddressAllocation,*string)

	// The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4.
	// +kubebuilder:validation:Optional
	privateIpAddressVersion?: null | string @go(PrivateIPAddressVersion,*string)

	// Reference to a Public IP Address to associate with this NIC
	// +kubebuilder:validation:Optional
	publicIpAddressId?: null | string @go(PublicIPAddressID,*string)

	// The ID of the Subnet where this Network Interface should be located in.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.Subnet
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	subnetId?: null | string @go(SubnetID,*string)
}

#NetworkInterfaceInitParameters: {
	// A list of IP Addresses defining the DNS Servers which should be used for this Network Interface.
	dnsServers?: [...null | string] @go(DNSServers,[]*string)

	// Specifies the Edge Zone within the Azure Region where this Network Interface should exist. Changing this forces a new Network Interface to be created.
	edgeZone?: null | string @go(EdgeZone,*string)

	// Should Accelerated Networking be enabled? Defaults to false.
	enableAcceleratedNetworking?: null | bool @go(EnableAcceleratedNetworking,*bool)

	// Should IP Forwarding be enabled? Defaults to false.
	enableIpForwarding?: null | bool @go(EnableIPForwarding,*bool)

	// One or more ip_configuration blocks as defined below.
	ipConfiguration?: [...#NetworkInterfaceIPConfigurationInitParameters] @go(IPConfiguration,[]NetworkInterfaceIPConfigurationInitParameters)

	// The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network.
	internalDnsNameLabel?: null | string @go(InternalDNSNameLabel,*string)

	// The location where the Network Interface should exist. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#NetworkInterfaceObservation: {
	// If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set.
	appliedDnsServers?: [...null | string] @go(AppliedDNSServers,[]*string)

	// A list of IP Addresses defining the DNS Servers which should be used for this Network Interface.
	dnsServers?: [...null | string] @go(DNSServers,[]*string)

	// Specifies the Edge Zone within the Azure Region where this Network Interface should exist. Changing this forces a new Network Interface to be created.
	edgeZone?: null | string @go(EdgeZone,*string)

	// Should Accelerated Networking be enabled? Defaults to false.
	enableAcceleratedNetworking?: null | bool @go(EnableAcceleratedNetworking,*bool)

	// Should IP Forwarding be enabled? Defaults to false.
	enableIpForwarding?: null | bool @go(EnableIPForwarding,*bool)

	// The ID of the Network Interface.
	id?: null | string @go(ID,*string)

	// One or more ip_configuration blocks as defined below.
	ipConfiguration?: [...#NetworkInterfaceIPConfigurationObservation] @go(IPConfiguration,[]NetworkInterfaceIPConfigurationObservation)

	// The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network.
	internalDnsNameLabel?: null | string @go(InternalDNSNameLabel,*string)

	// Even if internal_dns_name_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal_domain_name_suffix.
	internalDomainNameSuffix?: null | string @go(InternalDomainNameSuffix,*string)

	// The location where the Network Interface should exist. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// The Media Access Control (MAC) Address of the Network Interface.
	macAddress?: null | string @go(MacAddress,*string)

	// The first private IP address of the network interface.
	privateIpAddress?: null | string @go(PrivateIPAddress,*string)

	// The private IP addresses of the network interface.
	privateIpAddresses?: [...null | string] @go(PrivateIPAddresses,[]*string)

	// The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The ID of the Virtual Machine which this Network Interface is connected to.
	virtualMachineId?: null | string @go(VirtualMachineID,*string)
}

#NetworkInterfaceParameters: {
	// A list of IP Addresses defining the DNS Servers which should be used for this Network Interface.
	// +kubebuilder:validation:Optional
	dnsServers?: [...null | string] @go(DNSServers,[]*string)

	// Specifies the Edge Zone within the Azure Region where this Network Interface should exist. Changing this forces a new Network Interface to be created.
	// +kubebuilder:validation:Optional
	edgeZone?: null | string @go(EdgeZone,*string)

	// Should Accelerated Networking be enabled? Defaults to false.
	// +kubebuilder:validation:Optional
	enableAcceleratedNetworking?: null | bool @go(EnableAcceleratedNetworking,*bool)

	// Should IP Forwarding be enabled? Defaults to false.
	// +kubebuilder:validation:Optional
	enableIpForwarding?: null | bool @go(EnableIPForwarding,*bool)

	// One or more ip_configuration blocks as defined below.
	// +kubebuilder:validation:Optional
	ipConfiguration?: [...#NetworkInterfaceIPConfigurationParameters] @go(IPConfiguration,[]NetworkInterfaceIPConfigurationParameters)

	// The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network.
	// +kubebuilder:validation:Optional
	internalDnsNameLabel?: null | string @go(InternalDNSNameLabel,*string)

	// The location where the Network Interface should exist. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// NetworkInterfaceSpec defines the desired state of NetworkInterface
#NetworkInterfaceSpec: {
	forProvider: #NetworkInterfaceParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #NetworkInterfaceInitParameters @go(InitProvider)
}

// NetworkInterfaceStatus defines the observed state of NetworkInterface.
#NetworkInterfaceStatus: {
	atProvider?: #NetworkInterfaceObservation @go(AtProvider)
}

// NetworkInterface is the Schema for the NetworkInterfaces API. Manages a Network Interface.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#NetworkInterface: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.ipConfiguration) || (has(self.initProvider) && has(self.initProvider.ipConfiguration))",message="spec.forProvider.ipConfiguration is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || (has(self.initProvider) && has(self.initProvider.location))",message="spec.forProvider.location is a required parameter"
	spec:    #NetworkInterfaceSpec   @go(Spec)
	status?: #NetworkInterfaceStatus @go(Status)
}

// NetworkInterfaceList contains a list of NetworkInterfaces
#NetworkInterfaceList: {
	items: [...#NetworkInterface] @go(Items,[]NetworkInterface)
}