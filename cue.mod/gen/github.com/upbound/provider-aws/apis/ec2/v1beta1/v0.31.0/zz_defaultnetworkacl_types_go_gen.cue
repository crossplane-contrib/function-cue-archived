// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

#DefaultNetworkACLObservation: {
	// ARN of the Default Network ACL
	arn?: null | string @go(Arn,*string)

	// ID of the Default Network ACL
	id?: null | string @go(ID,*string)

	// ID of the AWS account that owns the Default Network ACL
	ownerId?: null | string @go(OwnerID,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// ID of the associated VPC
	vpcId?: null | string @go(VPCID,*string)
}

#DefaultNetworkACLParameters: {
	// Network ACL ID to manage. This attribute is exported from aws_vpc, or manually found via the AWS Console.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.VPC
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("default_network_acl_id",true)
	// +kubebuilder:validation:Optional
	defaultNetworkAclId?: null | string @go(DefaultNetworkACLID,*string)

	// Configuration block for an egress rule. Detailed below.
	// +kubebuilder:validation:Optional
	egress?: [...#EgressParameters] @go(Egress,[]EgressParameters)

	// Configuration block for an ingress rule. Detailed below.
	// +kubebuilder:validation:Optional
	ingress?: [...#IngressParameters] @go(Ingress,[]IngressParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// List of Subnet IDs to apply the ACL to. See the notes above on Managing Subnets in the Default Network ACL
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.Subnet
	// +crossplane:generate:reference:refFieldName=SubnetIDRefs
	// +crossplane:generate:reference:selectorFieldName=SubnetIDSelector
	// +kubebuilder:validation:Optional
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#EgressObservation: {
}

#EgressParameters: {
	// The action to take.
	// +kubebuilder:validation:Required
	action?: null | string @go(Action,*string)

	// The CIDR block to match. This must be a valid network mask.
	// +kubebuilder:validation:Optional
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The from port to match.
	// +kubebuilder:validation:Required
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	// +kubebuilder:validation:Optional
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	// +kubebuilder:validation:Required
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	// +kubebuilder:validation:Required
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	// +kubebuilder:validation:Required
	toPort?: null | float64 @go(ToPort,*float64)
}

#IngressObservation: {
}

#IngressParameters: {
	// The action to take.
	// +kubebuilder:validation:Required
	action?: null | string @go(Action,*string)

	// The CIDR block to match. This must be a valid network mask.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.DefaultVPC
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("cidr_block",true)
	// +kubebuilder:validation:Optional
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The from port to match.
	// +kubebuilder:validation:Required
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	// +kubebuilder:validation:Optional
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	// +kubebuilder:validation:Required
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	// +kubebuilder:validation:Required
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	// +kubebuilder:validation:Required
	toPort?: null | float64 @go(ToPort,*float64)
}

// DefaultNetworkACLSpec defines the desired state of DefaultNetworkACL
#DefaultNetworkACLSpec: {
	forProvider: #DefaultNetworkACLParameters @go(ForProvider)
}

// DefaultNetworkACLStatus defines the observed state of DefaultNetworkACL.
#DefaultNetworkACLStatus: {
	atProvider?: #DefaultNetworkACLObservation @go(AtProvider)
}

// DefaultNetworkACL is the Schema for the DefaultNetworkACLs API. Manage a default network ACL.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DefaultNetworkACL: {
	spec:    #DefaultNetworkACLSpec   @go(Spec)
	status?: #DefaultNetworkACLStatus @go(Status)
}

// DefaultNetworkACLList contains a list of DefaultNetworkACLs
#DefaultNetworkACLList: {
	items: [...#DefaultNetworkACL] @go(Items,[]DefaultNetworkACL)
}