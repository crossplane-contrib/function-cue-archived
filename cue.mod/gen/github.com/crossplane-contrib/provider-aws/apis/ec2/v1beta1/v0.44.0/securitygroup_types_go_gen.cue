// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1

package v1beta1

// SecurityGroupParameters define the desired state of an AWS VPC Security
// Group.
#SecurityGroupParameters: {
	// Region is the region you'd like your SecurityGroup to be created in.
	// +optional
	region?: null | string @go(Region,*string)

	// A description of the security group.
	// +immutable
	description: string @go(Description)

	// The name of the security group.
	// +immutable
	groupName: string @go(GroupName)

	// One or more inbound rules associated with the security group.
	// +optional
	ingress?: [...#IPPermission] @go(Ingress,[]IPPermission)

	// [EC2-VPC] One or more outbound rules associated with the security group.
	// +optional
	egress?: [...#IPPermission] @go(Egress,[]IPPermission)

	// Tags represents to current ec2 tags.
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)

	// VPCID is the ID of the VPC.
	// +optional
	// +immutable
	// +crossplane:generate:reference:type=VPC
	vpcId?: null | string @go(VPCID,*string)

	// Dont manage the ingress settings for the created resource
	ignoreIngress?: null | bool @go(IgnoreIngress,*bool)

	// Dont manage the egress settings for the created resource
	ignoreEgress?: null | bool @go(IgnoreEgress,*bool)
}

// IPRange describes an IPv4 range.
#IPRange: {
	// The IPv4 CIDR range. You can either specify a CIDR range or a source security
	// group, not both. To specify a single IPv4 address, use the /32 prefix length.
	cidrIp: string @go(CIDRIP)

	// A description for the security group rule that references this IPv4 address
	// range.
	//
	// Constraints: Up to 255 characters in length. Allowed characters are a-z,
	// A-Z, 0-9, spaces, and ._-:/()#,@[]+=&;{}!$*
	// +optional
	description?: null | string @go(Description,*string)
}

// IPv6Range describes an IPv6 range.
#IPv6Range: {
	// The IPv6 CIDR range. You can either specify a CIDR range or a source security
	// group, not both. To specify a single IPv6 address, use the /128 prefix length.
	cidrIPv6: string @go(CIDRIPv6)

	// A description for the security group rule that references this IPv6 address
	// range.
	//
	// Constraints: Up to 255 characters in length. Allowed characters are a-z,
	// A-Z, 0-9, spaces, and ._-:/()#,@[]+=&;{}!$*
	// +optional
	description?: null | string @go(Description,*string)
}

// PrefixListID describes a prefix list ID.
#PrefixListID: {
	// A description for the security group rule that references this prefix list
	// ID.
	//
	// Constraints: Up to 255 characters in length. Allowed characters are a-z,
	// A-Z, 0-9, spaces, and ._-:/()#,@[]+=;{}!$*
	// +optional
	description?: null | string @go(Description,*string)

	// The ID of the prefix.
	prefixListId: string @go(PrefixListID)
}

// UserIDGroupPair describes a security group and AWS account ID pair.
#UserIDGroupPair: {
	// A description for the security group rule that references this user ID group
	// pair.
	//
	// Constraints: Up to 255 characters in length. Allowed characters are a-z,
	// A-Z, 0-9, spaces, and ._-:/()#,@[]+=;{}!$*
	// +optional
	description?: null | string @go(Description,*string)

	// The ID of the security group.
	// +optional
	// +crossplane:generate:reference:type=SecurityGroup
	groupId?: null | string @go(GroupID,*string)

	// The name of the security group. In a request, use this parameter for a security
	// group in EC2-Classic or a default VPC only. For a security group in a nondefault
	// VPC, use the security group ID.
	//
	// For a referenced security group in another VPC, this value is not returned
	// if the referenced security group is deleted.
	// +optional
	groupName?: null | string @go(GroupName,*string)

	// The ID of an AWS account.
	//
	// For a referenced security group in another VPC, the account ID of the referenced
	// security group is returned in the response. If the referenced security group
	// is deleted, this value is not returned.
	//
	// [EC2-Classic] Required when adding or removing rules that reference a security
	// group in another AWS account.
	// +optional
	userId?: null | string @go(UserID,*string)

	// The ID of the VPC for the referenced security group, if applicable.
	// +optional
	// +crossplane:generate:reference:type=VPC
	vpcId?: null | string @go(VPCID,*string)

	// The ID of the VPC peering connection, if applicable.
	// +optional
	vpcPeeringConnectionId?: null | string @go(VPCPeeringConnectionID,*string)
}

// IPPermission Describes a set of permissions for a security group rule.
#IPPermission: {
	// The start of port range for the TCP and UDP protocols, or an ICMP/ICMPv6
	// type number. A value of -1 indicates all ICMP/ICMPv6 types. If you specify
	// all ICMP/ICMPv6 types, you must specify all codes.
	// +optional
	fromPort?: null | int32 @go(FromPort,*int32)

	// The IP protocol name (tcp, udp, icmp, icmpv6) or number (see Protocol Numbers
	// (http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)).
	//
	// [VPC only] Use -1 to specify all protocols. When authorizing security group
	// rules, specifying -1 or a protocol number other than tcp, udp, icmp, or icmpv6
	// allows traffic on all ports, regardless of any port range you specify. For
	// tcp, udp, and icmp, you must specify a port range. For icmpv6, the port range
	// is optional; if you omit the port range, traffic for all types and codes
	// is allowed.
	ipProtocol: string @go(IPProtocol)

	// The IPv4 ranges.
	// +optional
	ipRanges?: [...#IPRange] @go(IPRanges,[]IPRange)

	// The IPv6 ranges.
	//
	// [VPC only]
	// +optional
	ipv6Ranges?: [...#IPv6Range] @go(IPv6Ranges,[]IPv6Range)

	// PrefixListIDs for an AWS service. With outbound rules, this
	// is the AWS service to access through a VPC endpoint from instances associated
	// with the security group.
	//
	// [VPC only]
	// +optional
	prefixListIds?: [...#PrefixListID] @go(PrefixListIDs,[]PrefixListID)

	// The end of port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code.
	// A value of -1 indicates all ICMP/ICMPv6 codes. If you specify all ICMP/ICMPv6
	// types, you must specify all codes.
	// +optional
	toPort?: null | int32 @go(ToPort,*int32)

	// UserIDGroupPairs are the source security group and AWS account ID pairs.
	// It contains one or more accounts and security groups to allow flows from
	// security groups of other accounts.
	// +optional
	userIdGroupPairs?: [...#UserIDGroupPair] @go(UserIDGroupPairs,[]UserIDGroupPair)
}

// A SecurityGroupSpec defines the desired state of a SecurityGroup.
#SecurityGroupSpec: {
	forProvider: #SecurityGroupParameters @go(ForProvider)
}

// SecurityGroupObservation keeps the state for the external resource
#SecurityGroupObservation: {
	// The AWS account ID of the owner of the security group.
	ownerId: string @go(OwnerID)

	// SecurityGroupID is the ID of the SecurityGroup.
	securityGroupID: string @go(SecurityGroupID)
}

// A SecurityGroupStatus represents the observed state of a SecurityGroup.
#SecurityGroupStatus: {
	atProvider?: #SecurityGroupObservation @go(AtProvider)
}

// A SecurityGroup is a managed resource that represents an AWS VPC Security
// Group.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="ID",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="VPC",type="string",JSONPath=".spec.forProvider.vpcId"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
// +kubebuilder:storageversion
#SecurityGroup: {
	spec:    #SecurityGroupSpec   @go(Spec)
	status?: #SecurityGroupStatus @go(Status)
}

// SecurityGroupList contains a list of SecurityGroups
#SecurityGroupList: {
	items: [...#SecurityGroup] @go(Items,[]SecurityGroup)
}