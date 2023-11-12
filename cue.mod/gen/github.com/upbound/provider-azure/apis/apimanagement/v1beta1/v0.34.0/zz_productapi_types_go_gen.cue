// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/apimanagement/v1beta1

package v1beta1

#ProductAPIObservation: {
	// The name of the API Management Service. Changing this forces a new resource to be created.
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The Name of the API Management API within the API Management Service. Changing this forces a new resource to be created.
	apiName?: null | string @go(APIName,*string)

	// The ID of the API Management Product API.
	id?: null | string @go(ID,*string)

	// The ID of the API Management Product within the API Management Service. Changing this forces a new resource to be created.
	productId?: null | string @go(ProductID,*string)

	// The name of the Resource Group in which the API Management Service exists. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#ProductAPIParameters: {
	// The name of the API Management Service. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=Management
	// +kubebuilder:validation:Optional
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The Name of the API Management API within the API Management Service. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=API
	// +kubebuilder:validation:Optional
	apiName?: null | string @go(APIName,*string)

	// The ID of the API Management Product within the API Management Service. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=Product
	// +kubebuilder:validation:Optional
	productId?: null | string @go(ProductID,*string)

	// The name of the Resource Group in which the API Management Service exists. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

// ProductAPISpec defines the desired state of ProductAPI
#ProductAPISpec: {
	forProvider: #ProductAPIParameters @go(ForProvider)
}

// ProductAPIStatus defines the observed state of ProductAPI.
#ProductAPIStatus: {
	atProvider?: #ProductAPIObservation @go(AtProvider)
}

// ProductAPI is the Schema for the ProductAPIs API. Manages an API Management API Assignment to a Product.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#ProductAPI: {
	spec:    #ProductAPISpec   @go(Spec)
	status?: #ProductAPIStatus @go(Status)
}

// ProductAPIList contains a list of ProductAPIs
#ProductAPIList: {
	items: [...#ProductAPI] @go(Items,[]ProductAPI)
}