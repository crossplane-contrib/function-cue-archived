// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/pubsub/v1beta1

package v1beta1

#MessageStoragePolicyInitParameters: {
	// A list of IDs of GCP regions where messages that are published to
	// the topic may be persisted in storage. Messages published by
	// publishers running in non-allowed GCP regions (or running outside
	// of GCP altogether) will be routed for storage in one of the
	// allowed regions. An empty list means that no regions are allowed,
	// and is not a valid configuration.
	allowedPersistenceRegions?: [...null | string] @go(AllowedPersistenceRegions,[]*string)
}

#MessageStoragePolicyObservation: {
	// A list of IDs of GCP regions where messages that are published to
	// the topic may be persisted in storage. Messages published by
	// publishers running in non-allowed GCP regions (or running outside
	// of GCP altogether) will be routed for storage in one of the
	// allowed regions. An empty list means that no regions are allowed,
	// and is not a valid configuration.
	allowedPersistenceRegions?: [...null | string] @go(AllowedPersistenceRegions,[]*string)
}

#MessageStoragePolicyParameters: {
	// A list of IDs of GCP regions where messages that are published to
	// the topic may be persisted in storage. Messages published by
	// publishers running in non-allowed GCP regions (or running outside
	// of GCP altogether) will be routed for storage in one of the
	// allowed regions. An empty list means that no regions are allowed,
	// and is not a valid configuration.
	// +kubebuilder:validation:Optional
	allowedPersistenceRegions?: [...null | string] @go(AllowedPersistenceRegions,[]*string)
}

#SchemaSettingsInitParameters: {
	// The encoding of messages validated against schema.
	// Default value is ENCODING_UNSPECIFIED.
	// Possible values are: ENCODING_UNSPECIFIED, JSON, BINARY.
	encoding?: null | string @go(Encoding,*string)

	// The name of the schema that messages published should be
	// validated against. Format is projects/{project}/schemas/{schema}.
	// The value of this field will be deleted-schema
	// if the schema has been deleted.
	schema?: null | string @go(Schema,*string)
}

#SchemaSettingsObservation: {
	// The encoding of messages validated against schema.
	// Default value is ENCODING_UNSPECIFIED.
	// Possible values are: ENCODING_UNSPECIFIED, JSON, BINARY.
	encoding?: null | string @go(Encoding,*string)

	// The name of the schema that messages published should be
	// validated against. Format is projects/{project}/schemas/{schema}.
	// The value of this field will be deleted-schema
	// if the schema has been deleted.
	schema?: null | string @go(Schema,*string)
}

#SchemaSettingsParameters: {
	// The encoding of messages validated against schema.
	// Default value is ENCODING_UNSPECIFIED.
	// Possible values are: ENCODING_UNSPECIFIED, JSON, BINARY.
	// +kubebuilder:validation:Optional
	encoding?: null | string @go(Encoding,*string)

	// The name of the schema that messages published should be
	// validated against. Format is projects/{project}/schemas/{schema}.
	// The value of this field will be deleted-schema
	// if the schema has been deleted.
	// +kubebuilder:validation:Optional
	schema?: null | string @go(Schema,*string)
}

#TopicInitParameters: {
	// A set of key/value label pairs to assign to this Topic.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Indicates the minimum duration to retain a message after it is published
	// to the topic. If this field is set, messages published to the topic in
	// the last messageRetentionDuration are always available to subscribers.
	// For instance, it allows any attached subscription to seek to a timestamp
	// that is up to messageRetentionDuration in the past. If this field is not
	// set, message retention is controlled by settings on individual subscriptions.
	// Cannot be more than 31 days or less than 10 minutes.
	messageRetentionDuration?: null | string @go(MessageRetentionDuration,*string)

	// Policy constraining the set of Google Cloud Platform regions where
	// messages published to the topic may be stored. If not present, then no
	// constraints are in effect.
	// Structure is documented below.
	messageStoragePolicy?: [...#MessageStoragePolicyInitParameters] @go(MessageStoragePolicy,[]MessageStoragePolicyInitParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Settings for validating messages published against a schema.
	// Structure is documented below.
	schemaSettings?: [...#SchemaSettingsInitParameters] @go(SchemaSettings,[]SchemaSettingsInitParameters)
}

#TopicObservation: {
	// an identifier for the resource with format projects/{{project}}/topics/{{name}}
	id?: null | string @go(ID,*string)

	// The resource name of the Cloud KMS CryptoKey to be used to protect access
	// to messages published on this topic. Your project's PubSub service account
	// (service-{{PROJECT_NUMBER}}@gcp-sa-pubsub.iam.gserviceaccount.com) must have
	// roles/cloudkms.cryptoKeyEncrypterDecrypter to use this feature.
	// The expected format is projects/*/locations/*/keyRings/*/cryptoKeys/*
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// A set of key/value label pairs to assign to this Topic.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Indicates the minimum duration to retain a message after it is published
	// to the topic. If this field is set, messages published to the topic in
	// the last messageRetentionDuration are always available to subscribers.
	// For instance, it allows any attached subscription to seek to a timestamp
	// that is up to messageRetentionDuration in the past. If this field is not
	// set, message retention is controlled by settings on individual subscriptions.
	// Cannot be more than 31 days or less than 10 minutes.
	messageRetentionDuration?: null | string @go(MessageRetentionDuration,*string)

	// Policy constraining the set of Google Cloud Platform regions where
	// messages published to the topic may be stored. If not present, then no
	// constraints are in effect.
	// Structure is documented below.
	messageStoragePolicy?: [...#MessageStoragePolicyObservation] @go(MessageStoragePolicy,[]MessageStoragePolicyObservation)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Settings for validating messages published against a schema.
	// Structure is documented below.
	schemaSettings?: [...#SchemaSettingsObservation] @go(SchemaSettings,[]SchemaSettingsObservation)
}

#TopicParameters: {
	// The resource name of the Cloud KMS CryptoKey to be used to protect access
	// to messages published on this topic. Your project's PubSub service account
	// (service-{{PROJECT_NUMBER}}@gcp-sa-pubsub.iam.gserviceaccount.com) must have
	// roles/cloudkms.cryptoKeyEncrypterDecrypter to use this feature.
	// The expected format is projects/*/locations/*/keyRings/*/cryptoKeys/*
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/kms/v1beta1.CryptoKey
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// A set of key/value label pairs to assign to this Topic.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Indicates the minimum duration to retain a message after it is published
	// to the topic. If this field is set, messages published to the topic in
	// the last messageRetentionDuration are always available to subscribers.
	// For instance, it allows any attached subscription to seek to a timestamp
	// that is up to messageRetentionDuration in the past. If this field is not
	// set, message retention is controlled by settings on individual subscriptions.
	// Cannot be more than 31 days or less than 10 minutes.
	// +kubebuilder:validation:Optional
	messageRetentionDuration?: null | string @go(MessageRetentionDuration,*string)

	// Policy constraining the set of Google Cloud Platform regions where
	// messages published to the topic may be stored. If not present, then no
	// constraints are in effect.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	messageStoragePolicy?: [...#MessageStoragePolicyParameters] @go(MessageStoragePolicy,[]MessageStoragePolicyParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Settings for validating messages published against a schema.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	schemaSettings?: [...#SchemaSettingsParameters] @go(SchemaSettings,[]SchemaSettingsParameters)
}

// TopicSpec defines the desired state of Topic
#TopicSpec: {
	forProvider: #TopicParameters @go(ForProvider)

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
	initProvider?: #TopicInitParameters @go(InitProvider)
}

// TopicStatus defines the observed state of Topic.
#TopicStatus: {
	atProvider?: #TopicObservation @go(AtProvider)
}

// Topic is the Schema for the Topics API. A named resource to which messages are sent by publishers.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Topic: {
	spec:    #TopicSpec   @go(Spec)
	status?: #TopicStatus @go(Status)
}

// TopicList contains a list of Topics
#TopicList: {
	items: [...#Topic] @go(Items,[]Topic)
}