// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudtrail/v1beta1

package v1beta1

#AdvancedEventSelectorFieldSelectorObservation: {
	// A list of values that includes events that match the last few characters of the event record field specified as the value of field.
	endsWith?: [...null | string] @go(EndsWith,[]*string)

	// A list of values that includes events that match the exact value of the event record field specified as the value of field. This is the only valid operator that you can use with the readOnly, eventCategory, and resources.type fields.
	equals?: [...null | string] @go(Equals,[]*string)

	// Specifies a field in an event record on which to filter events to be logged. You can specify only the following values: readOnly, eventSource, eventName, eventCategory, resources.type, resources.ARN.
	field?: null | string @go(Field,*string)

	// A list of values that excludes events that match the last few characters of the event record field specified as the value of field.
	notEndsWith?: [...null | string] @go(NotEndsWith,[]*string)

	// A list of values that excludes events that match the exact value of the event record field specified as the value of field.
	notEquals?: [...null | string] @go(NotEquals,[]*string)

	// A list of values that excludes events that match the first few characters of the event record field specified as the value of field.
	notStartsWith?: [...null | string] @go(NotStartsWith,[]*string)

	// A list of values that includes events that match the first few characters of the event record field specified as the value of field.
	startsWith?: [...null | string] @go(StartsWith,[]*string)
}

#AdvancedEventSelectorFieldSelectorParameters: {
	// A list of values that includes events that match the last few characters of the event record field specified as the value of field.
	// +kubebuilder:validation:Optional
	endsWith?: [...null | string] @go(EndsWith,[]*string)

	// A list of values that includes events that match the exact value of the event record field specified as the value of field. This is the only valid operator that you can use with the readOnly, eventCategory, and resources.type fields.
	// +kubebuilder:validation:Optional
	equals?: [...null | string] @go(Equals,[]*string)

	// Specifies a field in an event record on which to filter events to be logged. You can specify only the following values: readOnly, eventSource, eventName, eventCategory, resources.type, resources.ARN.
	// +kubebuilder:validation:Optional
	field?: null | string @go(Field,*string)

	// A list of values that excludes events that match the last few characters of the event record field specified as the value of field.
	// +kubebuilder:validation:Optional
	notEndsWith?: [...null | string] @go(NotEndsWith,[]*string)

	// A list of values that excludes events that match the exact value of the event record field specified as the value of field.
	// +kubebuilder:validation:Optional
	notEquals?: [...null | string] @go(NotEquals,[]*string)

	// A list of values that excludes events that match the first few characters of the event record field specified as the value of field.
	// +kubebuilder:validation:Optional
	notStartsWith?: [...null | string] @go(NotStartsWith,[]*string)

	// A list of values that includes events that match the first few characters of the event record field specified as the value of field.
	// +kubebuilder:validation:Optional
	startsWith?: [...null | string] @go(StartsWith,[]*string)
}

#EventDataStoreAdvancedEventSelectorObservation: {
	// Specifies the selector statements in an advanced event selector. Fields documented below.
	fieldSelector?: [...#AdvancedEventSelectorFieldSelectorObservation] @go(FieldSelector,[]AdvancedEventSelectorFieldSelectorObservation)

	// The name of the event data store.
	name?: null | string @go(Name,*string)
}

#EventDataStoreAdvancedEventSelectorParameters: {
	// Specifies the selector statements in an advanced event selector. Fields documented below.
	// +kubebuilder:validation:Optional
	fieldSelector?: [...#AdvancedEventSelectorFieldSelectorParameters] @go(FieldSelector,[]AdvancedEventSelectorFieldSelectorParameters)

	// The name of the event data store.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)
}

#EventDataStoreObservation: {
	// The advanced event selectors to use to select the events for the data store. For more information about how to use advanced event selectors, see Log events by using advanced event selectors in the CloudTrail User Guide.
	advancedEventSelector?: [...#EventDataStoreAdvancedEventSelectorObservation] @go(AdvancedEventSelector,[]EventDataStoreAdvancedEventSelectorObservation)

	// ARN of the event data store.
	arn?: null | string @go(Arn,*string)

	// Name of the event data store.
	id?: null | string @go(ID,*string)

	// Specifies whether the event data store includes events from all regions, or only from the region in which the event data store is created. Default: true.
	multiRegionEnabled?: null | bool @go(MultiRegionEnabled,*bool)

	// The name of the event data store.
	name?: null | string @go(Name,*string)

	// Specifies whether an event data store collects events logged for an organization in AWS Organizations. Default: false.
	organizationEnabled?: null | bool @go(OrganizationEnabled,*bool)

	// The retention period of the event data store, in days. You can set a retention period of up to 2555 days, the equivalent of seven years. Default: 2555.
	retentionPeriod?: null | float64 @go(RetentionPeriod,*float64)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// Specifies whether termination protection is enabled for the event data store. If termination protection is enabled, you cannot delete the event data store until termination protection is disabled. Default: true.
	terminationProtectionEnabled?: null | bool @go(TerminationProtectionEnabled,*bool)
}

#EventDataStoreParameters: {
	// The advanced event selectors to use to select the events for the data store. For more information about how to use advanced event selectors, see Log events by using advanced event selectors in the CloudTrail User Guide.
	// +kubebuilder:validation:Optional
	advancedEventSelector?: [...#EventDataStoreAdvancedEventSelectorParameters] @go(AdvancedEventSelector,[]EventDataStoreAdvancedEventSelectorParameters)

	// Specifies whether the event data store includes events from all regions, or only from the region in which the event data store is created. Default: true.
	// +kubebuilder:validation:Optional
	multiRegionEnabled?: null | bool @go(MultiRegionEnabled,*bool)

	// The name of the event data store.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Specifies whether an event data store collects events logged for an organization in AWS Organizations. Default: false.
	// +kubebuilder:validation:Optional
	organizationEnabled?: null | bool @go(OrganizationEnabled,*bool)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The retention period of the event data store, in days. You can set a retention period of up to 2555 days, the equivalent of seven years. Default: 2555.
	// +kubebuilder:validation:Optional
	retentionPeriod?: null | float64 @go(RetentionPeriod,*float64)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies whether termination protection is enabled for the event data store. If termination protection is enabled, you cannot delete the event data store until termination protection is disabled. Default: true.
	// +kubebuilder:validation:Optional
	terminationProtectionEnabled?: null | bool @go(TerminationProtectionEnabled,*bool)
}

// EventDataStoreSpec defines the desired state of EventDataStore
#EventDataStoreSpec: {
	forProvider: #EventDataStoreParameters @go(ForProvider)
}

// EventDataStoreStatus defines the observed state of EventDataStore.
#EventDataStoreStatus: {
	atProvider?: #EventDataStoreObservation @go(AtProvider)
}

// EventDataStore is the Schema for the EventDataStores API. Provides a CloudTrail Event Data Store resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#EventDataStore: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #EventDataStoreSpec   @go(Spec)
	status?: #EventDataStoreStatus @go(Status)
}

// EventDataStoreList contains a list of EventDataStores
#EventDataStoreList: {
	items: [...#EventDataStore] @go(Items,[]EventDataStore)
}