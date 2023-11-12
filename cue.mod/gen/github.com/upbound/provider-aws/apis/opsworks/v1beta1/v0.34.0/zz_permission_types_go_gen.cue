// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/opsworks/v1beta1

package v1beta1

#PermissionObservation: {
	// Whether the user is allowed to use SSH to communicate with the instance
	allowSsh?: null | bool @go(AllowSSH,*bool)

	// Whether the user is allowed to use sudo to elevate privileges
	allowSudo?: null | bool @go(AllowSudo,*bool)

	// The computed id of the permission. Please note that this is only used internally to identify the permission. This value is not used in aws.
	id?: null | string @go(ID,*string)

	// The users permission level. Mus be one of deny, show, deploy, manage, iam_only
	level?: null | string @go(Level,*string)

	// The stack to set the permissions for
	stackId?: null | string @go(StackID,*string)

	// The user's IAM ARN to set permissions for
	userArn?: null | string @go(UserArn,*string)
}

#PermissionParameters: {
	// Whether the user is allowed to use SSH to communicate with the instance
	// +kubebuilder:validation:Optional
	allowSsh?: null | bool @go(AllowSSH,*bool)

	// Whether the user is allowed to use sudo to elevate privileges
	// +kubebuilder:validation:Optional
	allowSudo?: null | bool @go(AllowSudo,*bool)

	// The users permission level. Mus be one of deny, show, deploy, manage, iam_only
	// +kubebuilder:validation:Optional
	level?: null | string @go(Level,*string)

	// The stack to set the permissions for
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/opsworks/v1beta1.Stack
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	stackId?: null | string @go(StackID,*string)

	// The user's IAM ARN to set permissions for
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.User
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	userArn?: null | string @go(UserArn,*string)
}

// PermissionSpec defines the desired state of Permission
#PermissionSpec: {
	forProvider: #PermissionParameters @go(ForProvider)
}

// PermissionStatus defines the observed state of Permission.
#PermissionStatus: {
	atProvider?: #PermissionObservation @go(AtProvider)
}

// Permission is the Schema for the Permissions API. Provides an OpsWorks permission resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Permission: {
	spec:    #PermissionSpec   @go(Spec)
	status?: #PermissionStatus @go(Status)
}

// PermissionList contains a list of Permissions
#PermissionList: {
	items: [...#Permission] @go(Items,[]Permission)
}