// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

#DefaultRouteTableObservation: {
	// The ARN of the route table.
	arn?: null | string @go(Arn,*string)

	// ID of the default route table.
	defaultRouteTableId?: null | string @go(DefaultRouteTableID,*string)

	// ID of the route table.
	id?: null | string @go(ID,*string)

	// ID of the AWS account that owns the route table.
	ownerId?: null | string @go(OwnerID,*string)

	// List of virtual gateways for propagation.
	propagatingVgws?: [...null | string] @go(PropagatingVgws,[]*string)

	// Configuration block of routes. Detailed below. This argument is processed in attribute-as-blocks mode. This means that omitting this argument is interpreted as ignoring any existing routes. To remove all managed routes an empty list should be specified. See the example above.
	route?: [...#RouteObservation] @go(Route,[]RouteObservation)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// ID of the VPC.
	vpcId?: null | string @go(VPCID,*string)
}

#DefaultRouteTableParameters: {
	// ID of the default route table.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.VPC
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("default_route_table_id",true)
	// +kubebuilder:validation:Optional
	defaultRouteTableId?: null | string @go(DefaultRouteTableID,*string)

	// List of virtual gateways for propagation.
	// +kubebuilder:validation:Optional
	propagatingVgws?: [...null | string] @go(PropagatingVgws,[]*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Configuration block of routes. Detailed below. This argument is processed in attribute-as-blocks mode. This means that omitting this argument is interpreted as ignoring any existing routes. To remove all managed routes an empty list should be specified. See the example above.
	// +kubebuilder:validation:Optional
	route?: [...#RouteParameters] @go(Route,[]RouteParameters)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#RouteObservation: {
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

	// The Ipv6 CIDR block of the route
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// Identifier of an EC2 instance.
	instanceId?: null | string @go(InstanceID,*string)

	// Identifier of a VPC NAT gateway.
	natGatewayId?: null | string @go(NATGatewayID,*string)

	// Identifier of an EC2 network interface.
	networkInterfaceId?: null | string @go(NetworkInterfaceID,*string)

	// Identifier of an EC2 Transit Gateway.
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// Identifier of a VPC Endpoint. This route must be removed prior to VPC Endpoint deletion.
	vpcEndpointId?: null | string @go(VPCEndpointID,*string)

	// Identifier of a VPC peering connection.
	vpcPeeringConnectionId?: null | string @go(VPCPeeringConnectionID,*string)
}

#RouteParameters: {
	// The CIDR block of the route.
	// +kubebuilder:validation:Optional
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The Amazon Resource Name (ARN) of a core network.
	// +kubebuilder:validation:Optional
	coreNetworkArn?: null | string @go(CoreNetworkArn,*string)

	// The ID of a managed prefix list destination of the route.
	// +kubebuilder:validation:Optional
	destinationPrefixListId?: null | string @go(DestinationPrefixListID,*string)

	// Identifier of a VPC Egress Only Internet Gateway.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.EgressOnlyInternetGateway
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	egressOnlyGatewayId?: null | string @go(EgressOnlyGatewayID,*string)

	// Identifier of a VPC internet gateway or a virtual private gateway.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.InternetGateway
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	gatewayId?: null | string @go(GatewayID,*string)

	// The Ipv6 CIDR block of the route
	// +kubebuilder:validation:Optional
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// Identifier of an EC2 instance.
	// +kubebuilder:validation:Optional
	instanceId?: null | string @go(InstanceID,*string)

	// Identifier of a VPC NAT gateway.
	// +kubebuilder:validation:Optional
	natGatewayId?: null | string @go(NATGatewayID,*string)

	// Identifier of an EC2 network interface.
	// +kubebuilder:validation:Optional
	networkInterfaceId?: null | string @go(NetworkInterfaceID,*string)

	// Identifier of an EC2 Transit Gateway.
	// +kubebuilder:validation:Optional
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// Identifier of a VPC Endpoint. This route must be removed prior to VPC Endpoint deletion.
	// +kubebuilder:validation:Optional
	vpcEndpointId?: null | string @go(VPCEndpointID,*string)

	// Identifier of a VPC peering connection.
	// +kubebuilder:validation:Optional
	vpcPeeringConnectionId?: null | string @go(VPCPeeringConnectionID,*string)
}

// DefaultRouteTableSpec defines the desired state of DefaultRouteTable
#DefaultRouteTableSpec: {
	forProvider: #DefaultRouteTableParameters @go(ForProvider)
}

// DefaultRouteTableStatus defines the observed state of DefaultRouteTable.
#DefaultRouteTableStatus: {
	atProvider?: #DefaultRouteTableObservation @go(AtProvider)
}

// DefaultRouteTable is the Schema for the DefaultRouteTables API. Provides a resource to manage a default route table of a VPC.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DefaultRouteTable: {
	spec:    #DefaultRouteTableSpec   @go(Spec)
	status?: #DefaultRouteTableStatus @go(Status)
}

// DefaultRouteTableList contains a list of DefaultRouteTables
#DefaultRouteTableList: {
	items: [...#DefaultRouteTable] @go(Items,[]DefaultRouteTable)
}