// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/athena/v1beta1

package v1beta1

#DataCatalogObservation: {
	// ARN of the data catalog.
	arn?: null | string @go(Arn,*string)

	// Description of the data catalog.
	description?: null | string @go(Description,*string)

	// Name of the data catalog.
	id?: null | string @go(ID,*string)

	// Key value pairs that specifies the Lambda function or functions to use for the data catalog. The mapping used depends on the catalog type.
	parameters?: {[string]: null | string} @go(Parameters,map[string]*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// Type of data catalog: LAMBDA for a federated catalog, GLUE for AWS Glue Catalog, or HIVE for an external hive metastore.
	type?: null | string @go(Type,*string)
}

#DataCatalogParameters: {
	// Description of the data catalog.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Key value pairs that specifies the Lambda function or functions to use for the data catalog. The mapping used depends on the catalog type.
	// +kubebuilder:validation:Optional
	parameters?: {[string]: null | string} @go(Parameters,map[string]*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Type of data catalog: LAMBDA for a federated catalog, GLUE for AWS Glue Catalog, or HIVE for an external hive metastore.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// DataCatalogSpec defines the desired state of DataCatalog
#DataCatalogSpec: {
	forProvider: #DataCatalogParameters @go(ForProvider)
}

// DataCatalogStatus defines the observed state of DataCatalog.
#DataCatalogStatus: {
	atProvider?: #DataCatalogObservation @go(AtProvider)
}

// DataCatalog is the Schema for the DataCatalogs API. Provides an Athena data catalog.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DataCatalog: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.description)",message="description is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.parameters)",message="parameters is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.type)",message="type is a required parameter"
	spec:    #DataCatalogSpec   @go(Spec)
	status?: #DataCatalogStatus @go(Status)
}

// DataCatalogList contains a list of DataCatalogs
#DataCatalogList: {
	items: [...#DataCatalog] @go(Items,[]DataCatalog)
}