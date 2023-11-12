// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/apimanagement/v1beta1

package v1beta1

#ProductTagObservation: {
	// The name of the API Management Service. Changing this forces a new resource to be created.
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The name of the API Management product. Changing this forces a new resource to be created.
	apiManagementProductId?: null | string @go(APIManagementProductID,*string)

	// The ID of the API Management Product.
	id?: null | string @go(ID,*string)

	// The name which should be used for this API Management Tag. Changing this forces a new API Management Tag to be created.
	name?: null | string @go(Name,*string)

	// The name of the Resource Group in which the API Management Service should be exist. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#ProductTagParameters: {
	// The name of the API Management Service. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/apimanagement/v1beta1.Management
	// +kubebuilder:validation:Optional
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The name of the API Management product. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/apimanagement/v1beta1.Product
	// +kubebuilder:validation:Optional
	apiManagementProductId?: null | string @go(APIManagementProductID,*string)

	// The name which should be used for this API Management Tag. Changing this forces a new API Management Tag to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/apimanagement/v1beta1.Tag
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The name of the Resource Group in which the API Management Service should be exist. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

// ProductTagSpec defines the desired state of ProductTag
#ProductTagSpec: {
	forProvider: #ProductTagParameters @go(ForProvider)
}

// ProductTagStatus defines the observed state of ProductTag.
#ProductTagStatus: {
	atProvider?: #ProductTagObservation @go(AtProvider)
}

// ProductTag is the Schema for the ProductTags API. Manages an API Management Product tag
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#ProductTag: {
	spec:    #ProductTagSpec   @go(Spec)
	status?: #ProductTagStatus @go(Status)
}

// ProductTagList contains a list of ProductTags
#ProductTagList: {
	items: [...#ProductTag] @go(Items,[]ProductTag)
}