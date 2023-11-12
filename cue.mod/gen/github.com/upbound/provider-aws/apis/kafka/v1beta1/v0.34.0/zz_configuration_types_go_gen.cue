// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/kafka/v1beta1

package v1beta1

#ConfigurationObservation: {
	// Amazon Resource Name (ARN) of the configuration.
	arn?: null | string @go(Arn,*string)

	// Description of the configuration.
	description?: null | string @go(Description,*string)
	id?:          null | string @go(ID,*string)

	// List of Apache Kafka versions which can use this configuration.
	kafkaVersions?: [...null | string] @go(KafkaVersions,[]*string)

	// Latest revision of the configuration.
	latestRevision?: null | float64 @go(LatestRevision,*float64)

	// Name of the configuration.
	name?: null | string @go(Name,*string)

	// Contents of the server.properties file. Supported properties are documented in the MSK Developer Guide.
	serverProperties?: null | string @go(ServerProperties,*string)
}

#ConfigurationParameters: {
	// Description of the configuration.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// List of Apache Kafka versions which can use this configuration.
	// +kubebuilder:validation:Optional
	kafkaVersions?: [...null | string] @go(KafkaVersions,[]*string)

	// Name of the configuration.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Contents of the server.properties file. Supported properties are documented in the MSK Developer Guide.
	// +kubebuilder:validation:Optional
	serverProperties?: null | string @go(ServerProperties,*string)
}

// ConfigurationSpec defines the desired state of Configuration
#ConfigurationSpec: {
	forProvider: #ConfigurationParameters @go(ForProvider)
}

// ConfigurationStatus defines the observed state of Configuration.
#ConfigurationStatus: {
	atProvider?: #ConfigurationObservation @go(AtProvider)
}

// Configuration is the Schema for the Configurations API. Upbound official provider resource for managing an amazon managed streaming for kafka configuration
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Configuration: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.serverProperties)",message="serverProperties is a required parameter"
	spec:    #ConfigurationSpec   @go(Spec)
	status?: #ConfigurationStatus @go(Status)
}

// ConfigurationList contains a list of Configurations
#ConfigurationList: {
	items: [...#Configuration] @go(Items,[]Configuration)
}