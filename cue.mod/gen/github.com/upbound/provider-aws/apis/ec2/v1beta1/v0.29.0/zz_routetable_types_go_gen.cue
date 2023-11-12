// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

#RouteTableObservation: {
	// The ARN of the route table.
	arn?: null | string @go(Arn,*string)

	// The ID of the routing table.
	id?: null | string @go(ID,*string)

	// The ID of the AWS account that owns the route table.
	ownerId?: null | string @go(OwnerID,*string)

	// A list of virtual gateways for propagation.
	propagatingVgws?: [...null | string] @go(PropagatingVgws,[]*string)

	// A list of route objects. Their keys are documented below. This argument is processed in attribute-as-blocks mode.
	// This means that omitting this argument is interpreted as ignoring any existing routes. To remove all managed routes an empty list should be specified. See the example above.
	route?: [...#RouteTableRouteObservation] @go(Route,[]RouteTableRouteObservation)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#RouteTableParameters: {
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The VPC ID.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.VPC
	// +kubebuilder:validation:Optional
	vpcId?: null | string @go(VPCID,*string)
}

#RouteTableRouteObservation: {
	// Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone.
	carrierGatewayId?: null | string @go(CarrierGatewayID,*string)

	// The CIDR block of the route.
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The Amazon Resource Name (ARN) of a core network.
	coreNetworkArn?: null | string @go(CoreNetworkArn,*string)

	// The ID of a managed prefix list destination of the route.
	destinationPrefixListId?: null | string @go(DestinationPrefixListID,*string)

	// Identifier of a VPC Egress Only Internet Gateway.
	egressOnlyGatewayId?: null | string @go(EgressOnlyGatewayID,*string)

	// Identifier of a VPC internet gateway or a virtual private gateway.
	gatewayId?: null | string @go(GatewayID,*string)

	// The Ipv6 CIDR block of the route.
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// Identifier of an EC2 instance.
	instanceId?: null | string @go(InstanceID,*string)

	// Identifier of a Outpost local gateway.
	localGatewayId?: null | string @go(LocalGatewayID,*string)

	// Identifier of a VPC NAT gateway.
	natGatewayId?: null | string @go(NATGatewayID,*string)

	// Identifier of an EC2 network interface.
	networkInterfaceId?: null | string @go(NetworkInterfaceID,*string)

	// Identifier of an EC2 Transit Gateway.
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// Identifier of a VPC Endpoint.
	vpcEndpointId?: null | string @go(VPCEndpointID,*string)

	// Identifier of a VPC peering connection.
	vpcPeeringConnectionId?: null | string @go(VPCPeeringConnectionID,*string)
}

#RouteTableRouteParameters: {
}

// RouteTableSpec defines the desired state of RouteTable
#RouteTableSpec: {
	forProvider: #RouteTableParameters @go(ForProvider)
}

// RouteTableStatus defines the observed state of RouteTable.
#RouteTableStatus: {
	atProvider?: #RouteTableObservation @go(AtProvider)
}

// RouteTable is the Schema for the RouteTables API. Provides a resource to create a VPC routing table.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#RouteTable: {
	spec:    #RouteTableSpec   @go(Spec)
	status?: #RouteTableStatus @go(Status)
}

// RouteTableList contains a list of RouteTables
#RouteTableList: {
	items: [...#RouteTable] @go(Items,[]RouteTable)
}