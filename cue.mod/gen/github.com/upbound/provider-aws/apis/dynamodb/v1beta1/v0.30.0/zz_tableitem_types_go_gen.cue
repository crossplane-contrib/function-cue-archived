// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/dynamodb/v1beta1

package v1beta1

#TableItemObservation: {
	id?: null | string @go(ID,*string)
}

#TableItemParameters: {
	// Hash key to use for lookups and identification of the item
	// +kubebuilder:validation:Required
	hashKey?: null | string @go(HashKey,*string)

	// JSON representation of a map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item.
	// +kubebuilder:validation:Required
	item?: null | string @go(Item,*string)

	// Range key to use for lookups and identification of the item. Required if there is range key defined in the table.
	// +kubebuilder:validation:Optional
	rangeKey?: null | string @go(RangeKey,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Name of the table to contain the item.
	// +crossplane:generate:reference:type=Table
	// +kubebuilder:validation:Optional
	tableName?: null | string @go(TableName,*string)
}

// TableItemSpec defines the desired state of TableItem
#TableItemSpec: {
	forProvider: #TableItemParameters @go(ForProvider)
}

// TableItemStatus defines the observed state of TableItem.
#TableItemStatus: {
	atProvider?: #TableItemObservation @go(AtProvider)
}

// TableItem is the Schema for the TableItems API. Provides a DynamoDB table item resource
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#TableItem: {
	spec:    #TableItemSpec   @go(Spec)
	status?: #TableItemStatus @go(Status)
}

// TableItemList contains a list of TableItems
#TableItemList: {
	items: [...#TableItem] @go(Items,[]TableItem)
}