// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/pubsub/v1beta1

package v1beta1

#CapacityObservation: {
	// Subscribe throughput capacity per partition in MiB/s. Must be >= 4 and <= 16.
	publishMibPerSec?: null | float64 @go(PublishMibPerSec,*float64)

	// Publish throughput capacity per partition in MiB/s. Must be >= 4 and <= 16.
	subscribeMibPerSec?: null | float64 @go(SubscribeMibPerSec,*float64)
}

#CapacityParameters: {
	// Subscribe throughput capacity per partition in MiB/s. Must be >= 4 and <= 16.
	// +kubebuilder:validation:Required
	publishMibPerSec?: null | float64 @go(PublishMibPerSec,*float64)

	// Publish throughput capacity per partition in MiB/s. Must be >= 4 and <= 16.
	// +kubebuilder:validation:Required
	subscribeMibPerSec?: null | float64 @go(SubscribeMibPerSec,*float64)
}

#LiteTopicObservation: {
	// an identifier for the resource with format projects/{{project}}/locations/{{zone}}/topics/{{name}}
	id?: null | string @go(ID,*string)

	// The settings for this topic's partitions.
	// Structure is documented below.
	partitionConfig?: [...#PartitionConfigObservation] @go(PartitionConfig,[]PartitionConfigObservation)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The region of the pubsub lite topic.
	region?: null | string @go(Region,*string)

	// The settings for this topic's Reservation usage.
	// Structure is documented below.
	reservationConfig?: [...#ReservationConfigObservation] @go(ReservationConfig,[]ReservationConfigObservation)

	// The settings for a topic's message retention.
	// Structure is documented below.
	retentionConfig?: [...#RetentionConfigObservation] @go(RetentionConfig,[]RetentionConfigObservation)

	// The zone of the pubsub lite topic.
	zone?: null | string @go(Zone,*string)
}

#LiteTopicParameters: {
	// The settings for this topic's partitions.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	partitionConfig?: [...#PartitionConfigParameters] @go(PartitionConfig,[]PartitionConfigParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The region of the pubsub lite topic.
	// +kubebuilder:validation:Optional
	region?: null | string @go(Region,*string)

	// The settings for this topic's Reservation usage.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	reservationConfig?: [...#ReservationConfigParameters] @go(ReservationConfig,[]ReservationConfigParameters)

	// The settings for a topic's message retention.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	retentionConfig?: [...#RetentionConfigParameters] @go(RetentionConfig,[]RetentionConfigParameters)

	// The zone of the pubsub lite topic.
	// +kubebuilder:validation:Required
	zone?: null | string @go(Zone,*string)
}

#PartitionConfigObservation: {
	// The capacity configuration.
	// Structure is documented below.
	capacity?: [...#CapacityObservation] @go(Capacity,[]CapacityObservation)

	// The number of partitions in the topic. Must be at least 1.
	count?: null | float64 @go(Count,*float64)
}

#PartitionConfigParameters: {
	// The capacity configuration.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	capacity?: [...#CapacityParameters] @go(Capacity,[]CapacityParameters)

	// The number of partitions in the topic. Must be at least 1.
	// +kubebuilder:validation:Required
	count?: null | float64 @go(Count,*float64)
}

#ReservationConfigObservation: {
	// The Reservation to use for this topic's throughput capacity.
	throughputReservation?: null | string @go(ThroughputReservation,*string)
}

#ReservationConfigParameters: {
	// The Reservation to use for this topic's throughput capacity.
	// +crossplane:generate:reference:type=LiteReservation
	// +kubebuilder:validation:Optional
	throughputReservation?: null | string @go(ThroughputReservation,*string)
}

#RetentionConfigObservation: {
	// The provisioned storage, in bytes, per partition. If the number of bytes stored
	// in any of the topic's partitions grows beyond this value, older messages will be
	// dropped to make room for newer ones, regardless of the value of period.
	perPartitionBytes?: null | string @go(PerPartitionBytes,*string)

	// How long a published message is retained. If unset, messages will be retained as
	// long as the bytes retained for each partition is below perPartitionBytes. A
	// duration in seconds with up to nine fractional digits, terminated by 's'.
	// Example: "3.5s".
	period?: null | string @go(Period,*string)
}

#RetentionConfigParameters: {
	// The provisioned storage, in bytes, per partition. If the number of bytes stored
	// in any of the topic's partitions grows beyond this value, older messages will be
	// dropped to make room for newer ones, regardless of the value of period.
	// +kubebuilder:validation:Required
	perPartitionBytes?: null | string @go(PerPartitionBytes,*string)

	// How long a published message is retained. If unset, messages will be retained as
	// long as the bytes retained for each partition is below perPartitionBytes. A
	// duration in seconds with up to nine fractional digits, terminated by 's'.
	// Example: "3.5s".
	// +kubebuilder:validation:Optional
	period?: null | string @go(Period,*string)
}

// LiteTopicSpec defines the desired state of LiteTopic
#LiteTopicSpec: {
	forProvider: #LiteTopicParameters @go(ForProvider)
}

// LiteTopicStatus defines the observed state of LiteTopic.
#LiteTopicStatus: {
	atProvider?: #LiteTopicObservation @go(AtProvider)
}

// LiteTopic is the Schema for the LiteTopics API. A named resource to which messages are sent by publishers.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#LiteTopic: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.partitionConfig)",message="partitionConfig is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.retentionConfig)",message="retentionConfig is a required parameter"
	spec:    #LiteTopicSpec   @go(Spec)
	status?: #LiteTopicStatus @go(Status)
}

// LiteTopicList contains a list of LiteTopics
#LiteTopicList: {
	items: [...#LiteTopic] @go(Items,[]LiteTopic)
}