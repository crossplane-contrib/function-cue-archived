// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/maps/v1beta1

package v1beta1

#AccountObservation: {
	// The ID of the Azure Maps Account.
	id?: null | string @go(ID,*string)

	// The name of the Resource Group in which the Azure Maps Account should exist. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU of the Azure Maps Account. Possible values are S0, S1 and G2. Changing this forces a new resource to be created.
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags to assign to the Azure Maps Account.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A unique identifier for the Maps Account.
	xMsClientId?: null | string @go(XMSClientID,*string)
}

#AccountParameters: {
	// The name of the Resource Group in which the Azure Maps Account should exist. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The SKU of the Azure Maps Account. Possible values are S0, S1 and G2. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags to assign to the Azure Maps Account.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// AccountSpec defines the desired state of Account
#AccountSpec: {
	forProvider: #AccountParameters @go(ForProvider)
}

// AccountStatus defines the observed state of Account.
#AccountStatus: {
	atProvider?: #AccountObservation @go(AtProvider)
}

// Account is the Schema for the Accounts API. Manages an Azure Maps Account.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Account: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.skuName)",message="skuName is a required parameter"
	spec:    #AccountSpec   @go(Spec)
	status?: #AccountStatus @go(Status)
}

// AccountList contains a list of Accounts
#AccountList: {
	items: [...#Account] @go(Items,[]Account)
}