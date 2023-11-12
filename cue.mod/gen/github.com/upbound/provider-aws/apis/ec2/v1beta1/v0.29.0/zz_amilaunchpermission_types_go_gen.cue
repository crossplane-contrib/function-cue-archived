// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

#AMILaunchPermissionObservation: {
	// Launch permission ID.
	id?: null | string @go(ID,*string)
}

#AMILaunchPermissionParameters: {
	// AWS account ID for the launch permission.
	// +kubebuilder:validation:Optional
	accountId?: null | string @go(AccountID,*string)

	// Name of the group for the launch permission. Valid values: "all".
	// +kubebuilder:validation:Optional
	group?: null | string @go(Group,*string)

	// ID of the AMI.
	// +crossplane:generate:reference:type=AMI
	// +kubebuilder:validation:Optional
	imageId?: null | string @go(ImageID,*string)

	// ARN of an organization for the launch permission.
	// +kubebuilder:validation:Optional
	organizationArn?: null | string @go(OrganizationArn,*string)

	// ARN of an organizational unit for the launch permission.
	// +kubebuilder:validation:Optional
	organizationalUnitArn?: null | string @go(OrganizationalUnitArn,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// AMILaunchPermissionSpec defines the desired state of AMILaunchPermission
#AMILaunchPermissionSpec: {
	forProvider: #AMILaunchPermissionParameters @go(ForProvider)
}

// AMILaunchPermissionStatus defines the observed state of AMILaunchPermission.
#AMILaunchPermissionStatus: {
	atProvider?: #AMILaunchPermissionObservation @go(AtProvider)
}

// AMILaunchPermission is the Schema for the AMILaunchPermissions API. Adds a launch permission to an Amazon Machine Image (AMI).
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#AMILaunchPermission: {
	spec:    #AMILaunchPermissionSpec   @go(Spec)
	status?: #AMILaunchPermissionStatus @go(Status)
}

// AMILaunchPermissionList contains a list of AMILaunchPermissions
#AMILaunchPermissionList: {
	items: [...#AMILaunchPermission] @go(Items,[]AMILaunchPermission)
}