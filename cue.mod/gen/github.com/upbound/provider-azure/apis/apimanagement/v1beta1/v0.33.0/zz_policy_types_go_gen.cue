// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/apimanagement/v1beta1

package v1beta1

#PolicyObservation_2: {
	// The ID of the API Management service. Changing this forces a new API Management service Policy to be created.
	apiManagementId?: null | string @go(APIManagementID,*string)

	// The ID of the API Management service Policy.
	id?: null | string @go(ID,*string)

	// The XML Content for this Policy as a string.
	xmlContent?: null | string @go(XMLContent,*string)

	// A link to a Policy XML Document, which must be publicly available.
	xmlLink?: null | string @go(XMLLink,*string)
}

#PolicyParameters_2: {
	// The ID of the API Management service. Changing this forces a new API Management service Policy to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/apimanagement/v1beta1.Management
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	apiManagementId?: null | string @go(APIManagementID,*string)

	// The XML Content for this Policy as a string.
	// +kubebuilder:validation:Optional
	xmlContent?: null | string @go(XMLContent,*string)

	// A link to a Policy XML Document, which must be publicly available.
	// +kubebuilder:validation:Optional
	xmlLink?: null | string @go(XMLLink,*string)
}

// PolicySpec defines the desired state of Policy
#PolicySpec: {
	forProvider: #PolicyParameters_2 @go(ForProvider)
}

// PolicyStatus defines the observed state of Policy.
#PolicyStatus: {
	atProvider?: #PolicyObservation_2 @go(AtProvider)
}

// Policy is the Schema for the Policys API. Manages a API Management service Policy.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Policy: {
	spec:    #PolicySpec   @go(Spec)
	status?: #PolicyStatus @go(Status)
}

// PolicyList contains a list of Policys
#PolicyList: {
	items: [...#Policy] @go(Items,[]Policy)
}