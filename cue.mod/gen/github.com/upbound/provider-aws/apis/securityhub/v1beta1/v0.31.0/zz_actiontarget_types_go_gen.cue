// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/securityhub/v1beta1

package v1beta1

#ActionTargetObservation: {
	// Amazon Resource Name (ARN) of the Security Hub custom action target.
	arn?: null | string @go(Arn,*string)
	id?:  null | string @go(ID,*string)
}

#ActionTargetParameters: {
	// The name of the custom action target.
	// +kubebuilder:validation:Required
	description?: null | string @go(Description,*string)

	// The description for the custom action target.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// ActionTargetSpec defines the desired state of ActionTarget
#ActionTargetSpec: {
	forProvider: #ActionTargetParameters @go(ForProvider)
}

// ActionTargetStatus defines the observed state of ActionTarget.
#ActionTargetStatus: {
	atProvider?: #ActionTargetObservation @go(AtProvider)
}

// ActionTarget is the Schema for the ActionTargets API. Creates Security Hub custom action.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ActionTarget: {
	spec:    #ActionTargetSpec   @go(Spec)
	status?: #ActionTargetStatus @go(Status)
}

// ActionTargetList contains a list of ActionTargets
#ActionTargetList: {
	items: [...#ActionTarget] @go(Items,[]ActionTarget)
}