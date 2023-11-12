// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

#BackendBucketSignedURLKeyInitParameters: {
	// Name of the signed URL key.
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#BackendBucketSignedURLKeyObservation: {
	// The backend bucket this signed URL key belongs.
	backendBucket?: null | string @go(BackendBucket,*string)

	// an identifier for the resource with format projects/{{project}}/global/backendBuckets/{{backend_bucket}}
	id?: null | string @go(ID,*string)

	// Name of the signed URL key.
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#BackendBucketSignedURLKeyParameters: {
	// The backend bucket this signed URL key belongs.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.BackendBucket
	// +kubebuilder:validation:Optional
	backendBucket?: null | string @go(BackendBucket,*string)

	// Name of the signed URL key.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// BackendBucketSignedURLKeySpec defines the desired state of BackendBucketSignedURLKey
#BackendBucketSignedURLKeySpec: {
	forProvider: #BackendBucketSignedURLKeyParameters @go(ForProvider)

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
	initProvider?: #BackendBucketSignedURLKeyInitParameters @go(InitProvider)
}

// BackendBucketSignedURLKeyStatus defines the observed state of BackendBucketSignedURLKey.
#BackendBucketSignedURLKeyStatus: {
	atProvider?: #BackendBucketSignedURLKeyObservation @go(AtProvider)
}

// BackendBucketSignedURLKey is the Schema for the BackendBucketSignedURLKeys API. A key for signing Cloud CDN signed URLs for BackendBuckets.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#BackendBucketSignedURLKey: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.keyValueSecretRef)",message="keyValueSecretRef is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || has(self.initProvider.name)",message="name is a required parameter"
	spec:    #BackendBucketSignedURLKeySpec   @go(Spec)
	status?: #BackendBucketSignedURLKeyStatus @go(Status)
}

// BackendBucketSignedURLKeyList contains a list of BackendBucketSignedURLKeys
#BackendBucketSignedURLKeyList: {
	items: [...#BackendBucketSignedURLKey] @go(Items,[]BackendBucketSignedURLKey)
}