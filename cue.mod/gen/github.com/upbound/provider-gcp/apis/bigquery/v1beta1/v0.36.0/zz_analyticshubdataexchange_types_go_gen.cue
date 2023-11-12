// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/bigquery/v1beta1

package v1beta1

#AnalyticsHubDataExchangeInitParameters: {
	// The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
	dataExchangeId?: null | string @go(DataExchangeID,*string)

	// Description of the data exchange.
	description?: null | string @go(Description,*string)

	// Human-readable display name of the data exchange. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), and must not start or end with spaces.
	displayName?: null | string @go(DisplayName,*string)

	// Documentation describing the data exchange.
	documentation?: null | string @go(Documentation,*string)

	// Base64 encoded image representing the data exchange.
	icon?: null | string @go(Icon,*string)

	// The name of the location this data exchange.
	location?: null | string @go(Location,*string)

	// Email or URL of the primary point of contact of the data exchange.
	primaryContact?: null | string @go(PrimaryContact,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#AnalyticsHubDataExchangeObservation: {
	// The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
	dataExchangeId?: null | string @go(DataExchangeID,*string)

	// Description of the data exchange.
	description?: null | string @go(Description,*string)

	// Human-readable display name of the data exchange. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), and must not start or end with spaces.
	displayName?: null | string @go(DisplayName,*string)

	// Documentation describing the data exchange.
	documentation?: null | string @go(Documentation,*string)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/dataExchanges/{{data_exchange_id}}
	id?: null | string @go(ID,*string)

	// Base64 encoded image representing the data exchange.
	icon?: null | string @go(Icon,*string)

	// Number of listings contained in the data exchange.
	listingCount?: null | float64 @go(ListingCount,*float64)

	// The name of the location this data exchange.
	location?: null | string @go(Location,*string)

	// The resource name of the data exchange, for example:
	// "projects/myproject/locations/US/dataExchanges/123"
	name?: null | string @go(Name,*string)

	// Email or URL of the primary point of contact of the data exchange.
	primaryContact?: null | string @go(PrimaryContact,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#AnalyticsHubDataExchangeParameters: {
	// The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
	// +kubebuilder:validation:Optional
	dataExchangeId?: null | string @go(DataExchangeID,*string)

	// Description of the data exchange.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Human-readable display name of the data exchange. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), and must not start or end with spaces.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// Documentation describing the data exchange.
	// +kubebuilder:validation:Optional
	documentation?: null | string @go(Documentation,*string)

	// Base64 encoded image representing the data exchange.
	// +kubebuilder:validation:Optional
	icon?: null | string @go(Icon,*string)

	// The name of the location this data exchange.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Email or URL of the primary point of contact of the data exchange.
	// +kubebuilder:validation:Optional
	primaryContact?: null | string @go(PrimaryContact,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// AnalyticsHubDataExchangeSpec defines the desired state of AnalyticsHubDataExchange
#AnalyticsHubDataExchangeSpec: {
	forProvider: #AnalyticsHubDataExchangeParameters @go(ForProvider)

	// THIS IS AN ALPHA FIELD. Do not use it in production. It is not honored
	// unless the relevant Crossplane feature flag is enabled, and may be
	// changed or removed without notice.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #AnalyticsHubDataExchangeInitParameters @go(InitProvider)
}

// AnalyticsHubDataExchangeStatus defines the observed state of AnalyticsHubDataExchange.
#AnalyticsHubDataExchangeStatus: {
	atProvider?: #AnalyticsHubDataExchangeObservation @go(AtProvider)
}

// AnalyticsHubDataExchange is the Schema for the AnalyticsHubDataExchanges API. A Bigquery Analytics Hub data exchange
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#AnalyticsHubDataExchange: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.dataExchangeId) || has(self.initProvider.dataExchangeId)",message="dataExchangeId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.displayName) || has(self.initProvider.displayName)",message="displayName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || has(self.initProvider.location)",message="location is a required parameter"
	spec:    #AnalyticsHubDataExchangeSpec   @go(Spec)
	status?: #AnalyticsHubDataExchangeStatus @go(Status)
}

// AnalyticsHubDataExchangeList contains a list of AnalyticsHubDataExchanges
#AnalyticsHubDataExchangeList: {
	items: [...#AnalyticsHubDataExchange] @go(Items,[]AnalyticsHubDataExchange)
}