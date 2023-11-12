// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/medialive/v1beta1

package v1beta1

#MultiplexMultiplexSettingsObservation: {
	// Maximum video buffer delay.
	maximumVideoBufferDelayMilliseconds?: null | float64 @go(MaximumVideoBufferDelayMilliseconds,*float64)

	// Transport stream bit rate.
	transportStreamBitrate?: null | float64 @go(TransportStreamBitrate,*float64)

	// Unique ID for each multiplex.
	transportStreamId?: null | float64 @go(TransportStreamID,*float64)

	// Transport stream reserved bit rate.
	transportStreamReservedBitrate?: null | float64 @go(TransportStreamReservedBitrate,*float64)
}

#MultiplexMultiplexSettingsParameters: {
	// Maximum video buffer delay.
	// +kubebuilder:validation:Optional
	maximumVideoBufferDelayMilliseconds?: null | float64 @go(MaximumVideoBufferDelayMilliseconds,*float64)

	// Transport stream bit rate.
	// +kubebuilder:validation:Required
	transportStreamBitrate?: null | float64 @go(TransportStreamBitrate,*float64)

	// Unique ID for each multiplex.
	// +kubebuilder:validation:Required
	transportStreamId?: null | float64 @go(TransportStreamID,*float64)

	// Transport stream reserved bit rate.
	// +kubebuilder:validation:Optional
	transportStreamReservedBitrate?: null | float64 @go(TransportStreamReservedBitrate,*float64)
}

#MultiplexObservation: {
	// ARN of the Multiplex.
	arn?: null | string @go(Arn,*string)

	// A list of availability zones. You must specify exactly two.
	availabilityZones?: [...null | string] @go(AvailabilityZones,[]*string)
	id?: null | string @go(ID,*string)

	// Multiplex settings. See Multiplex Settings for more details.
	multiplexSettings?: [...#MultiplexMultiplexSettingsObservation] @go(MultiplexSettings,[]MultiplexMultiplexSettingsObservation)

	// name of Multiplex.
	name?: null | string @go(Name,*string)

	// Whether to start the Multiplex. Defaults to false.
	startMultiplex?: null | bool @go(StartMultiplex,*bool)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#MultiplexParameters: {
	// A list of availability zones. You must specify exactly two.
	// +kubebuilder:validation:Optional
	availabilityZones?: [...null | string] @go(AvailabilityZones,[]*string)

	// Multiplex settings. See Multiplex Settings for more details.
	// +kubebuilder:validation:Optional
	multiplexSettings?: [...#MultiplexMultiplexSettingsParameters] @go(MultiplexSettings,[]MultiplexMultiplexSettingsParameters)

	// name of Multiplex.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Whether to start the Multiplex. Defaults to false.
	// +kubebuilder:validation:Optional
	startMultiplex?: null | bool @go(StartMultiplex,*bool)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// MultiplexSpec defines the desired state of Multiplex
#MultiplexSpec: {
	forProvider: #MultiplexParameters @go(ForProvider)
}

// MultiplexStatus defines the observed state of Multiplex.
#MultiplexStatus: {
	atProvider?: #MultiplexObservation @go(AtProvider)
}

// Multiplex is the Schema for the Multiplexs API.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Multiplex: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.availabilityZones)",message="availabilityZones is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #MultiplexSpec   @go(Spec)
	status?: #MultiplexStatus @go(Status)
}

// MultiplexList contains a list of Multiplexs
#MultiplexList: {
	items: [...#Multiplex] @go(Items,[]Multiplex)
}