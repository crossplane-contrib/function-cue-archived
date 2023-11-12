// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/athena/v1beta1

package v1beta1

#NamedQueryObservation: {
	// Database to which the query belongs.
	database?: null | string @go(Database,*string)

	// Brief explanation of the query. Maximum length of 1024.
	description?: null | string @go(Description,*string)

	// Unique ID of the query.
	id?: null | string @go(ID,*string)

	// Plain language name for the query. Maximum length of 128.
	name?: null | string @go(Name,*string)

	// Text of the query itself. In other words, all query statements. Maximum length of 262144.
	query?: null | string @go(Query,*string)

	// Workgroup to which the query belongs. Defaults to primary
	workgroup?: null | string @go(Workgroup,*string)
}

#NamedQueryParameters: {
	// Database to which the query belongs.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/athena/v1beta1.Database
	// +kubebuilder:validation:Optional
	database?: null | string @go(Database,*string)

	// Brief explanation of the query. Maximum length of 1024.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Plain language name for the query. Maximum length of 128.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Text of the query itself. In other words, all query statements. Maximum length of 262144.
	// +kubebuilder:validation:Optional
	query?: null | string @go(Query,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Workgroup to which the query belongs. Defaults to primary
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/athena/v1beta1.Workgroup
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	workgroup?: null | string @go(Workgroup,*string)
}

// NamedQuerySpec defines the desired state of NamedQuery
#NamedQuerySpec: {
	forProvider: #NamedQueryParameters @go(ForProvider)
}

// NamedQueryStatus defines the observed state of NamedQuery.
#NamedQueryStatus: {
	atProvider?: #NamedQueryObservation @go(AtProvider)
}

// NamedQuery is the Schema for the NamedQuerys API. Provides an Athena Named Query resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#NamedQuery: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.query)",message="query is a required parameter"
	spec:    #NamedQuerySpec   @go(Spec)
	status?: #NamedQueryStatus @go(Status)
}

// NamedQueryList contains a list of NamedQuerys
#NamedQueryList: {
	items: [...#NamedQuery] @go(Items,[]NamedQuery)
}