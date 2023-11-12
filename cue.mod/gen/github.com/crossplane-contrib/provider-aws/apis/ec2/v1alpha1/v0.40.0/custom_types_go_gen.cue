// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/ec2/v1alpha1

package v1alpha1

// CustomLaunchTemplateParameters includes the custom fields of LaunchTemplate.
#CustomLaunchTemplateParameters: {
	// Metadata tagging key value pairs
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)
}

// CustomVPCEndpointServiceConfigurationParameters contains the additional fields
// for VPCEndpointServiceConfigurationParameter.
#CustomVPCEndpointServiceConfigurationParameters: {
	// Metadata tagging key value pairs
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)

	// The Amazon Resource Names (ARNs) of one or more Gateway Load Balancers.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/elbv2/v1alpha1.LoadBalancer
	// +crossplane:generate:reference:refFieldName=GatewayLoadBalancerARNRefs
	// +crossplane:generate:reference:selectorFieldName=GatewayLoadBalancerARNSelector
	gatewayLoadBalancerARNs?: [...null | string] @go(GatewayLoadBalancerARNs,[]*string)

	// The Amazon Resource Names (ARNs) of one or more Network Load Balancers for
	// your service.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/elbv2/v1alpha1.LoadBalancer
	// +crossplane:generate:reference:refFieldName=NetworkLoadBalancerARNRefs
	// +crossplane:generate:reference:selectorFieldName=NetworkLoadBalancerARNSelector
	networkLoadBalancerARNs?: [...null | string] @go(NetworkLoadBalancerARNs,[]*string)
}

// CustomLaunchTemplateVersionParameters includes the custom fields of LaunchTemplateVersion.
#CustomLaunchTemplateVersionParameters: {
	// The ID of the Launch Template. You must specify this parameter in the request.
	// +crossplane:generate:reference:type=LaunchTemplate
	launchTemplateId?: null | string @go(LaunchTemplateID,*string)

	// The Name of the Launch Template. You must specify this parameter in the request.
	// +crossplane:generate:reference:type=LaunchTemplate
	launchTemplateName?: null | string @go(LaunchTemplateName,*string)
}

// CustomVolumeParameters contains the additional fields for VolumeParameters.
#CustomVolumeParameters: {
	// The identifier of the AWS Key Management Service (AWS KMS) customer master
	// key (CMK) to use for Amazon EBS encryption. If this parameter is not specified,
	// your AWS managed CMK for EBS is used. If KmsKeyId is specified, the encrypted
	// state must be true.
	//
	// You can specify the CMK using any of the following:
	//
	//    * Key ID. For example, 1234abcd-12ab-34cd-56ef-1234567890ab.
	//
	//    * Key alias. For example, alias/ExampleAlias.
	//
	//    * Key ARN. For example, arn:aws:kms:us-east-1:012345678910:key/1234abcd-12ab-34cd-56ef-1234567890ab.
	//
	//    * Alias ARN. For example, arn:aws:kms:us-east-1:012345678910:alias/ExampleAlias.
	//
	// AWS authenticates the CMK asynchronously. Therefore, if you specify an ID,
	// alias, or ARN that is not valid, the action can appear to complete, but eventually
	// fails.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/kms/v1alpha1.Key
	// +crossplane:generate:reference:refFieldName=KMSKeyIDRef
	// +crossplane:generate:reference:selectorFieldName=KMSKeyIDSelector
	kmsKeyId?: null | string @go(KMSKeyID,*string)
}

// CustomVPCPeeringConnectionParameters are custom parameters for VPCPeeringConnection
#CustomVPCPeeringConnectionParameters: {
	// The ID of the requester VPC. You must specify this parameter in the request.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.VPC
	vpcID?: null | string @go(VPCID,*string)

	// The ID of the VPC with which you are creating the VPC peering connection.
	// You must specify this parameter in the request.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.VPC
	peerVPCID?: null | string @go(PeerVPCID,*string)

	// Automatically accepts the peering connection. If this is not set, the peering connection
	// will be created, but will be in pending-acceptance state. This will only lead to an active
	// connection if both VPCs are in the same tenant.
	acceptRequest?: bool @go(AcceptRequest)

	// Metadata tagging key value pairs
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)

	// RequesterPeeringOptions describes the Requester VPC peering connection options.
	// +optional
	requesterPeeringOptions?: null | #VPCPeeringConnectionOptionsDescription @go(RequesterPeeringOptions,*VPCPeeringConnectionOptionsDescription)

	// AccepterRequesterPeeringOptions describes the Accepter VPC peering connection options.
	// +optional
	accepterPeeringOptions?: null | #VPCPeeringConnectionOptionsDescription @go(AccepterPeeringOptions,*VPCPeeringConnectionOptionsDescription)
}

// CustomTransitGatewayParameters are custom parameters for TransitGateway
#CustomTransitGatewayParameters: {
	// Metadata tagging key value pairs
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)
}

// CustomTransitGatewayVPCAttachmentParameters are custom parameters for TransitGatewayVPCAttachment
#CustomTransitGatewayVPCAttachmentParameters: {
	// The ID of the VPC.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.VPC
	vpcId?: null | string @go(VPCID,*string)

	// The IDs of one or more subnets. You can specify only one subnet per Availability
	// Zone. You must specify at least one subnet, but we recommend that you specify
	// two subnets for better availability. The transit gateway uses one IP address
	// from each specified subnet.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.Subnet
	// +crossplane:generate:reference:refFieldName=SubnetIDRefs
	// +crossplane:generate:reference:selectorFieldName=SubnetIDSelector
	subnetIds?: [...null | string] @go(SubnetIDs,[]*string)

	// The ID of the transit gateway.
	// +optional
	// +crossplane:generate:reference:type=TransitGateway
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// Metadata tagging key value pairs
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)
}

// CustomRouteParameters are custom parameters for Route
#CustomRouteParameters: {
	// The ID of a transit gateway.
	// +optional
	// +crossplane:generate:reference:type=TransitGateway
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// [IPv4 traffic only] The ID of a NAT gateway.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.NATGateway
	natGatewayId?: null | string @go(NATGatewayID,*string)

	// The ID of a VPC peering connection.
	// +crossplane:generate:reference:type=VPCPeeringConnection
	vpcPeeringConnectionId?: null | string @go(VPCPeeringConnectionID,*string)

	// The ID of the route table for the route.
	// provider-aws currently provides both a standalone Route resource
	// and a RouteTable resource with routes defined in-line.
	// At this time you cannot use a RouteTable with in-line routes
	// in conjunction with any Route resources.
	// Set the flag ignoreRoutes=true in RouteTable to use Route resource
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.RouteTable
	routeTableId?: null | string @go(RouteTableID,*string)

	// The ID of a NAT instance in your VPC. The operation fails if you specify
	// an instance ID unless exactly one network interface is attached.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/manualv1alpha1.Instance
	instanceId?: null | string @go(InstanceID,*string)

	// The ID of an internet gateway attached to your VPC.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.InternetGateway
	gatewayId?: null | string @go(GatewayID,*string)
}

// CustomVPCEndpointParameters are custom parameters for VPCEndpoint
#CustomVPCEndpointParameters: {
	// The ID of the VPC. You must specify this parameter in the request.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.VPC
	vpcId?: null | string @go(VPCID,*string)

	// (Interface endpoint) The ID of one or more security groups to associate with
	// the endpoint network interface.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.SecurityGroup
	// +crossplane:generate:reference:refFieldName=SecurityGroupIDRefs
	// +crossplane:generate:reference:selectorFieldName=SecurityGroupIDSelector
	securityGroupIds?: [...null | string] @go(SecurityGroupIDs,[]*string)

	// (Interface and Gateway Load Balancer endpoints) The ID of one or more subnets
	// in which to create an endpoint network interface. For a Gateway Load Balancer
	// endpoint, you can specify one subnet only.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.Subnet
	// +crossplane:generate:reference:refFieldName=SubnetIDRefs
	// +crossplane:generate:reference:selectorFieldName=SubnetIDSelector
	subnetIds?: [...null | string] @go(SubnetIDs,[]*string)

	// (Gateway endpoint) One or more route table IDs.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.RouteTable
	// +crossplane:generate:reference:refFieldName=RouteTableIDRefs
	// +crossplane:generate:reference:selectorFieldName=RouteTableIDSelector
	routeTableIds?: [...null | string] @go(RouteTableIDs,[]*string)
}

// CustomTransitGatewayRouteParameters are custom parameters for TransitGatewayRouteParameters
#CustomTransitGatewayRouteParameters: {
	// The ID of the attachment.
	// +optional
	// +crossplane:generate:reference:type=TransitGatewayVPCAttachment
	transitGatewayAttachmentId?: null | string @go(TransitGatewayAttachmentID,*string)

	// The ID of the transit gateway route table.
	// +optional
	// +crossplane:generate:reference:type=TransitGatewayRouteTable
	transitGatewayRouteTableId?: null | string @go(TransitGatewayRouteTableID,*string)
}

// CustomTransitGatewayRouteTableParameters are custom parameters for TransitGatewayRouteTableParameters
#CustomTransitGatewayRouteTableParameters: {
	// The ID of the transit gateway.
	// +optional
	// +crossplane:generate:reference:type=TransitGateway
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// Metadata tagging key value pairs
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)
}

// CustomFlowLogParameters are custom parameters for FlowLogParameters
#CustomFlowLogParameters: {
	// Metadata tagging key value pairs
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)

	// The ID of the subnet, network interface, or VPC for which you want to create
	// a flow log.
	//
	// Constraints: Maximum of 1000 resources
	// +optional
	resourceIDs: [...null | string] @go(ResourceIDs,[]*string)

	// The type of resource for which to create the flow log. For example, if you
	// specified a VPC ID for the ResourceId property, specify VPC for this property.
	// +optional
	resourceType?: null | string @go(ResourceType,*string)

	// The ID of the VPC for which you want to create a flow log.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.VPC
	vpcId?: null | string @go(VPCID,*string)

	// The ID of the TransitGateway for which you want to create a flow log.
	// +optional
	// +crossplane:generate:reference:type=TransitGateway
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// The ID of the TransitGatewayAttachment for which you want to create a flow log.
	// +optional
	// +crossplane:generate:reference:type=TransitGatewayVPCAttachment
	transitGatewayAttachmentId?: null | string @go(TransitGatewayAttachmentID,*string)

	// The ID of the one or more Subnets for which you want to create a flow log.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.Subnet
	subnetId?: null | string @go(SubnetID,*string)

	// The ID of the NetworkInterface for which you want to create a flow log.
	// +optional
	networkInterfaceId?: null | string @go(NetworkInterfaceID,*string)

	// The ARN for the IAM role that permits Amazon EC2
	// to publish flow logs to a CloudWatch Logs log group in your
	// account. \n If you specify LogDestinationType as s3, do not
	// specify DeliverLogsPermissionArn or LogGroupName.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1.RoleARN()
	deliverLogsPermissionArn?: null | string @go(DeliverLogsPermissionARN,*string)

	// The Amazon Resource Names (ARNs) of a CloudWatch Log Group.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/cloudwatchlogs/v1alpha1.LogGroup
	// +crossplane:generate:reference:extractor=github.com/crossplane-contrib/provider-aws/apis/cloudwatchlogs/v1alpha1.LogGroupARN()
	cloudWatchLogDestination?: null | string @go(CloudWatchLogDestination,*string)

	// The Amazon Resource Names (ARNs) of a CloudWatch Log Group.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/crossplane-contrib/provider-aws/apis/s3/v1beta1.BucketARN()
	s3BucketLogDestination?: null | string @go(S3BucketLogDestination,*string)

	// S3BucketSubfolder allows you to use a subfolder in a S3Bucket, if S3BucketLogDestination is used to determin the ARN of a Bucket managed by crossplane
	// S3BucketSubfolder starts and ends without an slash e.g. test/test2
	// You cannot use AWSLogs as a subfolder name. This is a reserved term.
	// +optional
	s3BucketSubfolder?: null | string @go(S3BucketSubfolder,*string)
}