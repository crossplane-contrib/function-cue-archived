// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ssm/v1beta1

package v1beta1

#PatchGroupObservation: {
	// The ID of the patch baseline to register the patch group with.
	baselineId?: null | string @go(BaselineID,*string)

	// The name of the patch group and ID of the patch baseline separated by a comma (,).
	id?: null | string @go(ID,*string)

	// The name of the patch group that should be registered with the patch baseline.
	patchGroup?: null | string @go(PatchGroup,*string)
}

#PatchGroupParameters: {
	// The ID of the patch baseline to register the patch group with.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ssm/v1beta1.PatchBaseline
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	baselineId?: null | string @go(BaselineID,*string)

	// The name of the patch group that should be registered with the patch baseline.
	// +kubebuilder:validation:Optional
	patchGroup?: null | string @go(PatchGroup,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// PatchGroupSpec defines the desired state of PatchGroup
#PatchGroupSpec: {
	forProvider: #PatchGroupParameters @go(ForProvider)
}

// PatchGroupStatus defines the observed state of PatchGroup.
#PatchGroupStatus: {
	atProvider?: #PatchGroupObservation @go(AtProvider)
}

// PatchGroup is the Schema for the PatchGroups API. Provides an SSM Patch Group resource
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#PatchGroup: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.patchGroup)",message="patchGroup is a required parameter"
	spec:    #PatchGroupSpec   @go(Spec)
	status?: #PatchGroupStatus @go(Status)
}

// PatchGroupList contains a list of PatchGroups
#PatchGroupList: {
	items: [...#PatchGroup] @go(Items,[]PatchGroup)
}