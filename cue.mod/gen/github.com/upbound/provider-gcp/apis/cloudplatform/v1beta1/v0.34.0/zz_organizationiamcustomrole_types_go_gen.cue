// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1

package v1beta1

#OrganizationIAMCustomRoleObservation: {
	// The current deleted state of the role.
	deleted?: null | bool @go(Deleted,*bool)

	// A human-readable description for the role.
	description?: null | string @go(Description,*string)

	// an identifier for the resource with the format organizations/{{org_id}}/roles/{{role_id}}
	id?: null | string @go(ID,*string)

	// The name of the role in the format organizations/{{org_id}}/roles/{{role_id}}. Like id, this field can be used as a reference in other resources such as IAM role bindings.
	name?: null | string @go(Name,*string)

	// The numeric ID of the organization in which you want to create a custom role.
	orgId?: null | string @go(OrgID,*string)

	// The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified.
	permissions?: [...null | string] @go(Permissions,[]*string)

	// The role id to use for this role.
	roleId?: null | string @go(RoleID,*string)

	// The current launch stage of the role.
	// Defaults to GA.
	// List of possible stages is here.
	stage?: null | string @go(Stage,*string)

	// A human-readable title for the role.
	title?: null | string @go(Title,*string)
}

#OrganizationIAMCustomRoleParameters: {
	// A human-readable description for the role.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The numeric ID of the organization in which you want to create a custom role.
	// +kubebuilder:validation:Optional
	orgId?: null | string @go(OrgID,*string)

	// The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified.
	// +kubebuilder:validation:Optional
	permissions?: [...null | string] @go(Permissions,[]*string)

	// The role id to use for this role.
	// +kubebuilder:validation:Optional
	roleId?: null | string @go(RoleID,*string)

	// The current launch stage of the role.
	// Defaults to GA.
	// List of possible stages is here.
	// +kubebuilder:validation:Optional
	stage?: null | string @go(Stage,*string)

	// A human-readable title for the role.
	// +kubebuilder:validation:Optional
	title?: null | string @go(Title,*string)
}

// OrganizationIAMCustomRoleSpec defines the desired state of OrganizationIAMCustomRole
#OrganizationIAMCustomRoleSpec: {
	forProvider: #OrganizationIAMCustomRoleParameters @go(ForProvider)
}

// OrganizationIAMCustomRoleStatus defines the observed state of OrganizationIAMCustomRole.
#OrganizationIAMCustomRoleStatus: {
	atProvider?: #OrganizationIAMCustomRoleObservation @go(AtProvider)
}

// OrganizationIAMCustomRole is the Schema for the OrganizationIAMCustomRoles API. Allows management of a customized Cloud IAM organization role.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#OrganizationIAMCustomRole: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.orgId)",message="orgId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.permissions)",message="permissions is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.roleId)",message="roleId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.title)",message="title is a required parameter"
	spec:    #OrganizationIAMCustomRoleSpec   @go(Spec)
	status?: #OrganizationIAMCustomRoleStatus @go(Status)
}

// OrganizationIAMCustomRoleList contains a list of OrganizationIAMCustomRoles
#OrganizationIAMCustomRoleList: {
	items: [...#OrganizationIAMCustomRole] @go(Items,[]OrganizationIAMCustomRole)
}