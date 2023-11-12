// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1

package v1beta1

// GroupUserMembershipParameters define the desired state of an AWS GroupUserMembership.
#GroupUserMembershipParameters: {
	// GroupName is the Amazon IAM Group Name (Group) of the IAM group you want to
	// add User to.
	// +immutable
	// +crossplane:generate:reference:type=Group
	groupName?: string @go(GroupName)

	// UserName presents the name of the User.
	// +immutable
	// +crossplane:generate:reference:type=User
	userName?: string @go(UserName)
}

// A GroupUserMembershipSpec defines the desired state of an
// GroupUserMembership.
#GroupUserMembershipSpec: {
	forProvider: #GroupUserMembershipParameters @go(ForProvider)
}

// GroupUserMembershipObservation keeps the state for the external resource
#GroupUserMembershipObservation: {
	// AttachedGroupARN is the arn for the attached group. If nil, the group
	// is not yet attached
	attachedGroupArn: string @go(AttachedGroupARN)
}

// A GroupUserMembershipStatus represents the observed state of a GroupUserMembership.
#GroupUserMembershipStatus: {
	atProvider?: #GroupUserMembershipObservation @go(AtProvider)
}

// A GroupUserMembership is a managed resource that represents an AWS IAM
// User group membership.
// +kubebuilder:printcolumn:name="USERNAME",type="string",JSONPath=".spec.forProvider.userName"
// +kubebuilder:printcolumn:name="GROUPNAME",type="string",JSONPath=".spec.forProvider.groupName"
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#GroupUserMembership: {
	spec:    #GroupUserMembershipSpec   @go(Spec)
	status?: #GroupUserMembershipStatus @go(Status)
}

// GroupUserMembershipList contains a list of GroupUserMemberships
#GroupUserMembershipList: {
	items: [...#GroupUserMembership] @go(Items,[]GroupUserMembership)
}