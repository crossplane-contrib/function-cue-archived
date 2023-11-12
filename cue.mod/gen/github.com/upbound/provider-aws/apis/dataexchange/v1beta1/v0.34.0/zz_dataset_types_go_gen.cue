// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/dataexchange/v1beta1

package v1beta1

#DataSetObservation: {
	// The Amazon Resource Name of this data set.
	arn?: null | string @go(Arn,*string)

	// The type of asset that is added to a data set. Valid values are: S3_SNAPSHOT, REDSHIFT_DATA_SHARE, and API_GATEWAY_API.
	assetType?: null | string @go(AssetType,*string)

	// A description for the data set.
	description?: null | string @go(Description,*string)

	// The Id of the data set.
	id?: null | string @go(ID,*string)

	// The name of the data set.
	name?: null | string @go(Name,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#DataSetParameters: {
	// The type of asset that is added to a data set. Valid values are: S3_SNAPSHOT, REDSHIFT_DATA_SHARE, and API_GATEWAY_API.
	// +kubebuilder:validation:Optional
	assetType?: null | string @go(AssetType,*string)

	// A description for the data set.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The name of the data set.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// DataSetSpec defines the desired state of DataSet
#DataSetSpec: {
	forProvider: #DataSetParameters @go(ForProvider)
}

// DataSetStatus defines the observed state of DataSet.
#DataSetStatus: {
	atProvider?: #DataSetObservation @go(AtProvider)
}

// DataSet is the Schema for the DataSets API. Provides a DataExchange DataSet
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DataSet: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.assetType)",message="assetType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.description)",message="description is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #DataSetSpec   @go(Spec)
	status?: #DataSetStatus @go(Status)
}

// DataSetList contains a list of DataSets
#DataSetList: {
	items: [...#DataSet] @go(Items,[]DataSet)
}