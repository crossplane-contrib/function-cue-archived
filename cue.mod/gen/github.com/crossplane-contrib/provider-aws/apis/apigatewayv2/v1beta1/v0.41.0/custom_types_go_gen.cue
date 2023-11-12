// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/apigatewayv2/v1beta1

package v1beta1

// CustomVPCLinkParameters includes the custom fields.
#CustomVPCLinkParameters: {
	// SecurityGroupIDs is the list of IDs for the SecurityGroups.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.SecurityGroup
	// +crossplane:generate:reference:refFieldName=SecurityGroupIDRefs
	// +crossplane:generate:reference:selectorFieldName=SecurityGroupIDSelector
	securityGroupIds?: [...string] @go(SecurityGroupIDs,[]string)

	// SecurityGroupIDs is the list of IDs for the SecurityGroups.
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.Subnet
	// +crossplane:generate:reference:refFieldName=SubnetIDRefs
	// +crossplane:generate:reference:selectorFieldName=SubnetIDSelector
	subnetIds?: [...string] @go(SubnetIDs,[]string)
}