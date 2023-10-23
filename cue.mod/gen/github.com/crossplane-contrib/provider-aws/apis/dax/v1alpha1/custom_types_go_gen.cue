// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/dax/v1alpha1

package v1alpha1

// CustomClusterParameters includes the custom fields of Cluster.
#CustomClusterParameters: {
	// IAMRoleARN contains the ARN of an IAMRole
	// +immutable
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1.RoleARN()
	iamRoleARN?: null | string @go(IAMRoleARN,*string)

	// ParameterGroupName contains the name of the ParameterGroup
	// +immutable
	// +crossplane:generate:reference:type=ParameterGroup
	parameterGroupName?: null | string @go(ParameterGroupName,*string)

	// SubnetGroupName contains the name of the SubnetGroup
	// +immutable
	// +crossplane:generate:reference:type=SubnetGroup
	subnetGroupName?: null | string @go(SubnetGroupName,*string)

	// SecurityGroupIDs is the list of IDs for the SecurityGroups
	// +immutable
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.SecurityGroup
	// +crossplane:generate:reference:refFieldName=SecurityGroupIDRefs
	// +crossplane:generate:reference:selectorFieldName=SecurityGroupIDSelector
	securityGroupIds?: [...null | string] @go(SecurityGroupIDs,[]*string)

	// The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications
	// will be sent.
	//
	// The Amazon SNS topic owner must be same as the DAX cluster owner.
	// +optional
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/sns/v1beta1.Topic
	// +crossplane:generate:reference:extractor=github.com/crossplane-contrib/provider-aws/apis/sns/v1beta1.SNSTopicARN()
	notificationTopicARN?: null | string @go(NotificationTopicARN,*string)
}

// CustomParameterGroupParameters includes the custom fields of ParameterGroup
#CustomParameterGroupParameters: {
	// An array of name-value pairs for the parameters in the group. Each element
	// in the array represents a single parameter.
	//
	// record-ttl-millis and query-ttl-millis are the only supported parameter names.
	// For more details, see Configuring TTL Settings (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.cluster-management.html#DAX.cluster-management.custom-settings.ttl).
	parameterNameValues?: [...null | #ParameterNameValue] @go(ParameterNameValues,[]*ParameterNameValue)
}

// CustomSubnetGroupParameters includes the custom fields of SubnetGroup
#CustomSubnetGroupParameters: {
	// SubnetIds is the list of Ids for the Subnets.
	// +crossplane:generate:reference:refFieldName=SubnetIDRefs
	// +crossplane:generate:reference:selectorFieldName=SubnetIDSelector
	// +crossplane:generate:reference:type=github.com/crossplane-contrib/provider-aws/apis/ec2/v1beta1.Subnet
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)
}