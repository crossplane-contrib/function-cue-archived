// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ssoadmin/v1beta1

package v1beta1

#PermissionSetInlinePolicyObservation: {
	// The Amazon Resource Names (ARNs) of the Permission Set and SSO Instance, separated by a comma (,).
	id?: null | string @go(ID,*string)

	// The IAM inline policy to attach to a Permission Set.
	inlinePolicy?: null | string @go(InlinePolicy,*string)

	// The Amazon Resource Name (ARN) of the SSO Instance under which the operation will be executed.
	instanceArn?: null | string @go(InstanceArn,*string)

	// The Amazon Resource Name (ARN) of the Permission Set.
	permissionSetArn?: null | string @go(PermissionSetArn,*string)
}

#PermissionSetInlinePolicyParameters: {
	// The IAM inline policy to attach to a Permission Set.
	// +kubebuilder:validation:Optional
	inlinePolicy?: null | string @go(InlinePolicy,*string)

	// The Amazon Resource Name (ARN) of the SSO Instance under which the operation will be executed.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ssoadmin/v1beta1.PermissionSet
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("instance_arn",false)
	// +kubebuilder:validation:Optional
	instanceArn?: null | string @go(InstanceArn,*string)

	// The Amazon Resource Name (ARN) of the Permission Set.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ssoadmin/v1beta1.PermissionSet
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	permissionSetArn?: null | string @go(PermissionSetArn,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// PermissionSetInlinePolicySpec defines the desired state of PermissionSetInlinePolicy
#PermissionSetInlinePolicySpec: {
	forProvider: #PermissionSetInlinePolicyParameters @go(ForProvider)
}

// PermissionSetInlinePolicyStatus defines the observed state of PermissionSetInlinePolicy.
#PermissionSetInlinePolicyStatus: {
	atProvider?: #PermissionSetInlinePolicyObservation @go(AtProvider)
}

// PermissionSetInlinePolicy is the Schema for the PermissionSetInlinePolicys API. Manages an IAM inline policy for a Single Sign-On (SSO) Permission Set
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#PermissionSetInlinePolicy: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.inlinePolicy)",message="inlinePolicy is a required parameter"
	spec:    #PermissionSetInlinePolicySpec   @go(Spec)
	status?: #PermissionSetInlinePolicyStatus @go(Status)
}

// PermissionSetInlinePolicyList contains a list of PermissionSetInlinePolicys
#PermissionSetInlinePolicyList: {
	items: [...#PermissionSetInlinePolicy] @go(Items,[]PermissionSetInlinePolicy)
}