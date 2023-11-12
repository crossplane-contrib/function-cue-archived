// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/vertexai/v1beta1

package v1beta1

#FeaturestoreEncryptionSpecInitParameters: {
	// The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the compute resource is created.
	kmsKeyName?: null | string @go(KMSKeyName,*string)
}

#FeaturestoreEncryptionSpecObservation: {
	// The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the compute resource is created.
	kmsKeyName?: null | string @go(KMSKeyName,*string)
}

#FeaturestoreEncryptionSpecParameters: {
	// The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the compute resource is created.
	// +kubebuilder:validation:Optional
	kmsKeyName?: null | string @go(KMSKeyName,*string)
}

#FeaturestoreInitParameters: {
	// If set, both of the online and offline data storage will be secured by this key.
	// Structure is documented below.
	encryptionSpec?: [...#FeaturestoreEncryptionSpecInitParameters] @go(EncryptionSpec,[]FeaturestoreEncryptionSpecInitParameters)

	// If set to true, any EntityTypes and Features for this Featurestore will also be deleted
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// A set of key/value label pairs to assign to this Featurestore.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the Featurestore. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
	name?: null | string @go(Name,*string)

	// Config for online serving resources.
	// Structure is documented below.
	onlineServingConfig?: [...#OnlineServingConfigInitParameters] @go(OnlineServingConfig,[]OnlineServingConfigInitParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The region of the dataset. eg us-central1
	region?: null | string @go(Region,*string)
}

#FeaturestoreObservation: {
	// The timestamp of when the featurestore was created in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
	createTime?: null | string @go(CreateTime,*string)

	// If set, both of the online and offline data storage will be secured by this key.
	// Structure is documented below.
	encryptionSpec?: [...#FeaturestoreEncryptionSpecObservation] @go(EncryptionSpec,[]FeaturestoreEncryptionSpecObservation)

	// Used to perform consistent read-modify-write updates.
	etag?: null | string @go(Etag,*string)

	// If set to true, any EntityTypes and Features for this Featurestore will also be deleted
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// an identifier for the resource with format projects/{{project}}/locations/{{region}}/featurestores/{{name}}
	id?: null | string @go(ID,*string)

	// A set of key/value label pairs to assign to this Featurestore.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the Featurestore. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
	name?: null | string @go(Name,*string)

	// Config for online serving resources.
	// Structure is documented below.
	onlineServingConfig?: [...#OnlineServingConfigObservation] @go(OnlineServingConfig,[]OnlineServingConfigObservation)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The region of the dataset. eg us-central1
	region?: null | string @go(Region,*string)

	// The timestamp of when the featurestore was last updated in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
	updateTime?: null | string @go(UpdateTime,*string)
}

#FeaturestoreParameters: {
	// If set, both of the online and offline data storage will be secured by this key.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	encryptionSpec?: [...#FeaturestoreEncryptionSpecParameters] @go(EncryptionSpec,[]FeaturestoreEncryptionSpecParameters)

	// If set to true, any EntityTypes and Features for this Featurestore will also be deleted
	// +kubebuilder:validation:Optional
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// A set of key/value label pairs to assign to this Featurestore.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the Featurestore. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Config for online serving resources.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	onlineServingConfig?: [...#OnlineServingConfigParameters] @go(OnlineServingConfig,[]OnlineServingConfigParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The region of the dataset. eg us-central1
	// +kubebuilder:validation:Optional
	region?: null | string @go(Region,*string)
}

#OnlineServingConfigInitParameters: {
	// The number of nodes for each cluster. The number of nodes will not scale automatically but can be scaled manually by providing different values when updating.
	fixedNodeCount?: null | float64 @go(FixedNodeCount,*float64)

	// Online serving scaling configuration. Only one of fixedNodeCount and scaling can be set. Setting one will reset the other.
	// Structure is documented below.
	scaling?: [...#ScalingInitParameters] @go(Scaling,[]ScalingInitParameters)
}

#OnlineServingConfigObservation: {
	// The number of nodes for each cluster. The number of nodes will not scale automatically but can be scaled manually by providing different values when updating.
	fixedNodeCount?: null | float64 @go(FixedNodeCount,*float64)

	// Online serving scaling configuration. Only one of fixedNodeCount and scaling can be set. Setting one will reset the other.
	// Structure is documented below.
	scaling?: [...#ScalingObservation] @go(Scaling,[]ScalingObservation)
}

#OnlineServingConfigParameters: {
	// The number of nodes for each cluster. The number of nodes will not scale automatically but can be scaled manually by providing different values when updating.
	// +kubebuilder:validation:Optional
	fixedNodeCount?: null | float64 @go(FixedNodeCount,*float64)

	// Online serving scaling configuration. Only one of fixedNodeCount and scaling can be set. Setting one will reset the other.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	scaling?: [...#ScalingParameters] @go(Scaling,[]ScalingParameters)
}

#ScalingInitParameters: {
	// The maximum number of nodes to scale up to. Must be greater than minNodeCount, and less than or equal to 10 times of 'minNodeCount'.
	maxNodeCount?: null | float64 @go(MaxNodeCount,*float64)

	// The minimum number of nodes to scale down to. Must be greater than or equal to 1.
	minNodeCount?: null | float64 @go(MinNodeCount,*float64)
}

#ScalingObservation: {
	// The maximum number of nodes to scale up to. Must be greater than minNodeCount, and less than or equal to 10 times of 'minNodeCount'.
	maxNodeCount?: null | float64 @go(MaxNodeCount,*float64)

	// The minimum number of nodes to scale down to. Must be greater than or equal to 1.
	minNodeCount?: null | float64 @go(MinNodeCount,*float64)
}

#ScalingParameters: {
	// The maximum number of nodes to scale up to. Must be greater than minNodeCount, and less than or equal to 10 times of 'minNodeCount'.
	// +kubebuilder:validation:Optional
	maxNodeCount?: null | float64 @go(MaxNodeCount,*float64)

	// The minimum number of nodes to scale down to. Must be greater than or equal to 1.
	// +kubebuilder:validation:Optional
	minNodeCount?: null | float64 @go(MinNodeCount,*float64)
}

// FeaturestoreSpec defines the desired state of Featurestore
#FeaturestoreSpec: {
	forProvider: #FeaturestoreParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #FeaturestoreInitParameters @go(InitProvider)
}

// FeaturestoreStatus defines the observed state of Featurestore.
#FeaturestoreStatus: {
	atProvider?: #FeaturestoreObservation @go(AtProvider)
}

// Featurestore is the Schema for the Featurestores API. A collection of DataItems and Annotations on them.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Featurestore: {
	spec:    #FeaturestoreSpec   @go(Spec)
	status?: #FeaturestoreStatus @go(Status)
}

// FeaturestoreList contains a list of Featurestores
#FeaturestoreList: {
	items: [...#Featurestore] @go(Items,[]Featurestore)
}