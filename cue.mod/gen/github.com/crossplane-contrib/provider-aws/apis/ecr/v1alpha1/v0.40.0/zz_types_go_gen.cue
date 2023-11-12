// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/ecr/v1alpha1

package v1alpha1

// +kubebuilder:skipversion
#AWSECRContainerImageDetails: {
	registry?:       null | string @go(Registry,*string)
	repositoryName?: null | string @go(RepositoryName,*string)
}

// +kubebuilder:skipversion
#EnhancedImageScanFinding: {
	awsAccountID?: null | string @go(AWSAccountID,*string)
}

// +kubebuilder:skipversion
#ImageReplicationStatus: {
	registryID?: null | string @go(RegistryID,*string)
}

// +kubebuilder:skipversion
#PullThroughCacheRule: {
	registryID?: null | string @go(RegistryID,*string)
}

// +kubebuilder:skipversion
#RepositoryScanningConfiguration: {
	repositoryName?: null | string @go(RepositoryName,*string)
}

// +kubebuilder:skipversion
#RepositoryScanningConfigurationFailure: {
	repositoryName?: null | string @go(RepositoryName,*string)
}