// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1

package v1beta1

// PolicyParameters define the desired state of an AWS IAM Policy.
#PolicyParameters: {
	// A description of the policy.
	// +optional
	description?: null | string @go(Description,*string)

	// The path to the policy.
	// +optional
	path?: null | string @go(Path,*string)

	// The JSON policy document that is the content for the policy.
	document: string @go(Document)

	// The name of the policy.
	name: string @go(Name)

	// Tags. For more information about
	// tagging, see Tagging IAM Identities (https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
	// in the IAM User Guide.
	// +immutable
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)
}

// A PolicySpec defines the desired state of a Policy.
#PolicySpec: {
	forProvider: #PolicyParameters @go(ForProvider)
}

// PolicyObservation keeps the state for the external resource
#PolicyObservation: {
	// The Amazon PolicyObservation Name (ARN) of the policy
	arn?: string @go(ARN)

	// The number of entities (users, groups, and roles) that the policy is attached
	// to.
	attachmentCount?: int32 @go(AttachmentCount)

	// The identifier for the version of the policy that is set as the default version.
	defaultVersionId?: string @go(DefaultVersionID)

	// Specifies whether the policy can be attached to an IAM user, group, or role.
	isAttachable?: bool @go(IsAttachable)

	// The number of entities (users and roles) for which the policy is used to
	// set the permissions boundary.
	permissionsBoundaryUsageCount?: int32 @go(PermissionsBoundaryUsageCount)

	// The stable and unique string identifying the policy.
	policyId?: string @go(PolicyID)
}

// A PolicyStatus represents the observed state of a Policy.
#PolicyStatus: {
	atProvider?: #PolicyObservation @go(AtProvider)
}

// A Policy is a managed resource that represents an AWS IAM Policy.
// +kubebuilder:printcolumn:name="ARN",type="string",JSONPath=".status.atProvider.arn"
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Policy: {
	spec:    #PolicySpec   @go(Spec)
	status?: #PolicyStatus @go(Status)
}

// PolicyList contains a list of Policies
#PolicyList: {
	items: [...#Policy] @go(Items,[]Policy)
}