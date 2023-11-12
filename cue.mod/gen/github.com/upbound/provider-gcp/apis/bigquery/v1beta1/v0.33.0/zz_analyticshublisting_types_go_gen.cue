// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/bigquery/v1beta1

package v1beta1

#AnalyticsHubListingObservation: {
	// Shared dataset i.e. BigQuery dataset source.
	// Structure is documented below.
	bigqueryDataset?: [...#BigqueryDatasetObservation] @go(BigqueryDataset,[]BigqueryDatasetObservation)

	// Categories of the listing. Up to two categories are allowed.
	categories?: [...null | string] @go(Categories,[]*string)

	// The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
	dataExchangeId?: null | string @go(DataExchangeID,*string)

	// Details of the data provider who owns the source data.
	// Structure is documented below.
	dataProvider?: [...#DataProviderObservation] @go(DataProvider,[]DataProviderObservation)

	// Short description of the listing. The description must not contain Unicode non-characters and C0 and C1 control codes except tabs (HT), new lines (LF), carriage returns (CR), and page breaks (FF).
	description?: null | string @go(Description,*string)

	// Human-readable display name of the listing. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), ampersands (&) and can't start or end with spaces.
	displayName?: null | string @go(DisplayName,*string)

	// Documentation describing the listing.
	documentation?: null | string @go(Documentation,*string)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/dataExchanges/{{data_exchange_id}}/listings/{{listing_id}}
	id?: null | string @go(ID,*string)

	// Base64 encoded image representing the listing.
	icon?: null | string @go(Icon,*string)

	// The name of the location this data exchange listing.
	location?: null | string @go(Location,*string)

	// The resource name of the listing. e.g. "projects/myproject/locations/US/dataExchanges/123/listings/456"
	name?: null | string @go(Name,*string)

	// Email or URL of the listing publisher.
	primaryContact?: null | string @go(PrimaryContact,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Details of the publisher who owns the listing and who can share the source data.
	// Structure is documented below.
	publisher?: [...#PublisherObservation] @go(Publisher,[]PublisherObservation)

	// Email or URL of the request access of the listing. Subscribers can use this reference to request access.
	requestAccess?: null | string @go(RequestAccess,*string)
}

#AnalyticsHubListingParameters: {
	// Shared dataset i.e. BigQuery dataset source.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	bigqueryDataset?: [...#BigqueryDatasetParameters] @go(BigqueryDataset,[]BigqueryDatasetParameters)

	// Categories of the listing. Up to two categories are allowed.
	// +kubebuilder:validation:Optional
	categories?: [...null | string] @go(Categories,[]*string)

	// The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/bigquery/v1beta1.AnalyticsHubDataExchange
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("data_exchange_id",false)
	// +kubebuilder:validation:Optional
	dataExchangeId?: null | string @go(DataExchangeID,*string)

	// Details of the data provider who owns the source data.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	dataProvider?: [...#DataProviderParameters] @go(DataProvider,[]DataProviderParameters)

	// Short description of the listing. The description must not contain Unicode non-characters and C0 and C1 control codes except tabs (HT), new lines (LF), carriage returns (CR), and page breaks (FF).
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Human-readable display name of the listing. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), ampersands (&) and can't start or end with spaces.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// Documentation describing the listing.
	// +kubebuilder:validation:Optional
	documentation?: null | string @go(Documentation,*string)

	// Base64 encoded image representing the listing.
	// +kubebuilder:validation:Optional
	icon?: null | string @go(Icon,*string)

	// The name of the location this data exchange listing.
	// +kubebuilder:validation:Required
	location?: null | string @go(Location,*string)

	// Email or URL of the listing publisher.
	// +kubebuilder:validation:Optional
	primaryContact?: null | string @go(PrimaryContact,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Details of the publisher who owns the listing and who can share the source data.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	publisher?: [...#PublisherParameters] @go(Publisher,[]PublisherParameters)

	// Email or URL of the request access of the listing. Subscribers can use this reference to request access.
	// +kubebuilder:validation:Optional
	requestAccess?: null | string @go(RequestAccess,*string)
}

#BigqueryDatasetObservation: {
	// Resource name of the dataset source for this listing. e.g. projects/myproject/datasets/123
	dataset?: null | string @go(Dataset,*string)
}

#BigqueryDatasetParameters: {
	// Resource name of the dataset source for this listing. e.g. projects/myproject/datasets/123
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/bigquery/v1beta1.Dataset
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dataset?: null | string @go(Dataset,*string)
}

#DataProviderObservation: {
	// Name of the data provider.
	name?: null | string @go(Name,*string)

	// Email or URL of the data provider.
	primaryContact?: null | string @go(PrimaryContact,*string)
}

#DataProviderParameters: {
	// Name of the data provider.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// Email or URL of the data provider.
	// +kubebuilder:validation:Optional
	primaryContact?: null | string @go(PrimaryContact,*string)
}

#PublisherObservation: {
	// Name of the listing publisher.
	name?: null | string @go(Name,*string)

	// Email or URL of the listing publisher.
	primaryContact?: null | string @go(PrimaryContact,*string)
}

#PublisherParameters: {
	// Name of the listing publisher.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// Email or URL of the listing publisher.
	// +kubebuilder:validation:Optional
	primaryContact?: null | string @go(PrimaryContact,*string)
}

// AnalyticsHubListingSpec defines the desired state of AnalyticsHubListing
#AnalyticsHubListingSpec: {
	forProvider: #AnalyticsHubListingParameters @go(ForProvider)
}

// AnalyticsHubListingStatus defines the observed state of AnalyticsHubListing.
#AnalyticsHubListingStatus: {
	atProvider?: #AnalyticsHubListingObservation @go(AtProvider)
}

// AnalyticsHubListing is the Schema for the AnalyticsHubListings API. A Bigquery Analytics Hub data exchange listing
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#AnalyticsHubListing: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.bigqueryDataset)",message="bigqueryDataset is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.displayName)",message="displayName is a required parameter"
	spec:    #AnalyticsHubListingSpec   @go(Spec)
	status?: #AnalyticsHubListingStatus @go(Status)
}

// AnalyticsHubListingList contains a list of AnalyticsHubListings
#AnalyticsHubListingList: {
	items: [...#AnalyticsHubListing] @go(Items,[]AnalyticsHubListing)
}