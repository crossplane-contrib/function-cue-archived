// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/ecr/v1alpha1

package v1alpha1

// LifecyclePolicyParameters defines the desired state of LifecyclePolicy
#LifecyclePolicyParameters: {
	// Region is which region the LifecyclePolicy will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// The JSON repository policy text to apply to the repository.
	// +kubebuilder:validation:Required
	lifecyclePolicyText?: null | string @go(LifecyclePolicyText,*string)

	// The Amazon Web Services account ID associated with the registry that contains
	// the repository. If you do not specify a registry, the default registry is
	// assumed.
	registryID?: null | string @go(RegistryID,*string)

	#CustomLifecyclePolicyParameters
}

// LifecyclePolicySpec defines the desired state of LifecyclePolicy
#LifecyclePolicySpec: {
	forProvider: #LifecyclePolicyParameters @go(ForProvider)
}

// LifecyclePolicyObservation defines the observed state of LifecyclePolicy
#LifecyclePolicyObservation: {
	// The repository name associated with the request.
	repositoryName?: null | string @go(RepositoryName,*string)
}

// LifecyclePolicyStatus defines the observed state of LifecyclePolicy.
#LifecyclePolicyStatus: {
	atProvider?: #LifecyclePolicyObservation @go(AtProvider)
}

// LifecyclePolicy is the Schema for the LifecyclePolicies API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#LifecyclePolicy: {
	spec:    #LifecyclePolicySpec   @go(Spec)
	status?: #LifecyclePolicyStatus @go(Status)
}

// LifecyclePolicyList contains a list of LifecyclePolicies
#LifecyclePolicyList: {
	items: [...#LifecyclePolicy] @go(Items,[]LifecyclePolicy)
}