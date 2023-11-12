// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/directconnect/v1beta1

package v1beta1

#HostedPrivateVirtualInterfaceObservation: {
	amazonSideAsn?: null | string @go(AmazonSideAsn,*string)

	// The ARN of the virtual interface.
	arn?: null | string @go(Arn,*string)

	// The Direct Connect endpoint on which the virtual interface terminates.
	awsDevice?: null | string @go(AwsDevice,*string)

	// The ID of the virtual interface.
	id?: null | string @go(ID,*string)

	// Indicates whether jumbo frames (9001 MTU) are supported.
	jumboFrameCapable?: null | bool @go(JumboFrameCapable,*bool)
}

#HostedPrivateVirtualInterfaceParameters: {
	// The address family for the BGP peer. ipv4  or ipv6.
	// +kubebuilder:validation:Required
	addressFamily?: null | string @go(AddressFamily,*string)

	// The IPv4 CIDR address to use to send traffic to Amazon. Required for IPv4 BGP peers.
	// +kubebuilder:validation:Optional
	amazonAddress?: null | string @go(AmazonAddress,*string)

	// The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.
	// +kubebuilder:validation:Required
	bgpAsn?: null | float64 @go(BGPAsn,*float64)

	// The authentication key for BGP configuration.
	// +kubebuilder:validation:Optional
	bgpAuthKey?: null | string @go(BGPAuthKey,*string)

	// The ID of the Direct Connect connection (or LAG) on which to create the virtual interface.
	// +crossplane:generate:reference:type=Connection
	// +kubebuilder:validation:Optional
	connectionId?: null | string @go(ConnectionID,*string)

	// The IPv4 CIDR destination address to which Amazon should send traffic. Required for IPv4 BGP peers.
	// +kubebuilder:validation:Optional
	customerAddress?: null | string @go(CustomerAddress,*string)

	// The maximum transmission unit (MTU) is the size, in bytes, of the largest permissible packet that can be passed over the connection. The MTU of a virtual private interface can be either 1500 or 9001 (jumbo frames). Default is 1500.
	// +kubebuilder:validation:Optional
	mtu?: null | float64 @go(Mtu,*float64)

	// The name for the virtual interface.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The AWS account that will own the new virtual interface.
	// +kubebuilder:validation:Required
	ownerAccountId?: null | string @go(OwnerAccountID,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The VLAN ID.
	// +kubebuilder:validation:Required
	vlan?: null | float64 @go(Vlan,*float64)
}

// HostedPrivateVirtualInterfaceSpec defines the desired state of HostedPrivateVirtualInterface
#HostedPrivateVirtualInterfaceSpec: {
	forProvider: #HostedPrivateVirtualInterfaceParameters @go(ForProvider)
}

// HostedPrivateVirtualInterfaceStatus defines the observed state of HostedPrivateVirtualInterface.
#HostedPrivateVirtualInterfaceStatus: {
	atProvider?: #HostedPrivateVirtualInterfaceObservation @go(AtProvider)
}

// HostedPrivateVirtualInterface is the Schema for the HostedPrivateVirtualInterfaces API. Provides a Direct Connect hosted private virtual interface resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#HostedPrivateVirtualInterface: {
	spec:    #HostedPrivateVirtualInterfaceSpec   @go(Spec)
	status?: #HostedPrivateVirtualInterfaceStatus @go(Status)
}

// HostedPrivateVirtualInterfaceList contains a list of HostedPrivateVirtualInterfaces
#HostedPrivateVirtualInterfaceList: {
	items: [...#HostedPrivateVirtualInterface] @go(Items,[]HostedPrivateVirtualInterface)
}