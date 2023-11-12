// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1

package v1beta1

// Tag represents user-provided metadata that can be associated
// with a IAM role. For more information about tagging,
// see Tagging IAM Identities (https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
// in the IAM User Guide.
#Tag: {
	// The key name that can be used to look up or retrieve the associated value.
	// For example, Department or Cost Center are common choices.
	key: string @go(Key)

	// The value associated with this tag. For example, tags with a key name of
	// Department could have values such as Human Resources, Accounting, and Support.
	// Tags with a key name of Cost Center might have values that consist of the
	// number associated with the different cost centers in your company. Typically,
	// many resources have tags with the same key name but with different values.
	//
	// AWS always interprets the tag Value as a single string. If you need to store
	// an array, you can store comma-separated values in the string. However, you
	// must interpret the value in your code.
	// +optional
	value?: string @go(Value)
}

// RoleParameters define the desired state of an AWS IAM Role.
#RoleParameters: {
	// AssumeRolePolicyDocument is the the trust relationship policy document
	// that grants an entity permission to assume the role.
	// +immutable
	assumeRolePolicyDocument: string @go(AssumeRolePolicyDocument)

	// Description is a description of the role.
	// +optional
	description?: null | string @go(Description,*string)

	// MaxSessionDuration is the duration (in seconds) that you want to set for the specified
	// role. The default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
	// Default: 3600
	// +optional
	maxSessionDuration?: null | int32 @go(MaxSessionDuration,*int32)

	// Path is the path to the role.
	// Default: /
	// +immutable
	// +optional
	path?: null | string @go(Path,*string)

	// PermissionsBoundary is the ARN of the policy that is used to set the permissions boundary for the role.
	// +immutable
	// +optional
	permissionsBoundary?: null | string @go(PermissionsBoundary,*string)

	// Tags. For more information about
	// tagging, see Tagging IAM Identities (https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
	// in the IAM User Guide.
	// +immutable
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)
}

// An RoleSpec defines the desired state of an Role.
#RoleSpec: {
	forProvider: #RoleParameters @go(ForProvider)
}

// RoleExternalStatus keeps the state for the external resource
#RoleExternalStatus: {
	// ARN is the Amazon Resource Name (ARN) specifying the role. For more information
	// about ARNs and how to use them in policies, see IAM Identifiers (http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
	// in the IAM User Guide guide.
	arn: string @go(ARN)

	// RoleID is the stable and unique string identifying the role. For more information about
	// IDs, see IAM Identifiers (http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
	// in the Using IAM guide.
	roleID: string @go(RoleID)
}

// An RoleStatus represents the observed state of an Role.
#RoleStatus: {
	atProvider?: #RoleExternalStatus @go(AtProvider)
}

// An Role is a managed resource that represents an AWS IAM Role.
// +kubebuilder:printcolumn:name="ARN",type="string",JSONPath=".status.atProvider.arn"
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws},shortName=iamrole
#Role: {
	spec:    #RoleSpec   @go(Spec)
	status?: #RoleStatus @go(Status)
}

// RoleList contains a list of Roles
#RoleList: {
	items: [...#Role] @go(Items,[]Role)
}