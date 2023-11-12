// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/storagecache/v1beta1

package v1beta1

#HPCCacheBlobNFSTargetInitParameters: {
	// The name of the access policy applied to this target. Defaults to default.
	accessPolicyName?: null | string @go(AccessPolicyName,*string)

	// The client-facing file path of the HPC Cache Blob NFS Target.
	namespacePath?: null | string @go(NamespacePath,*string)

	// The Resource Manager ID of the Storage Container used as the HPC Cache Blob NFS Target. Changing this forces a new resource to be created.
	storageContainerId?: null | string @go(StorageContainerID,*string)

	// The type of usage of the HPC Cache Blob NFS Target. Possible values are: READ_HEAVY_INFREQ, READ_HEAVY_CHECK_180, WRITE_WORKLOAD_15, WRITE_AROUND, WRITE_WORKLOAD_CHECK_30, WRITE_WORKLOAD_CHECK_60 and WRITE_WORKLOAD_CLOUDWS.
	usageModel?: null | string @go(UsageModel,*string)
}

#HPCCacheBlobNFSTargetObservation: {
	// The name of the access policy applied to this target. Defaults to default.
	accessPolicyName?: null | string @go(AccessPolicyName,*string)

	// The name of the HPC Cache, which the HPC Cache Blob NFS Target will be added to. Changing this forces a new HPC Cache Blob NFS Target to be created.
	cacheName?: null | string @go(CacheName,*string)

	// The ID of the HPC Cache Blob NFS Target.
	id?: null | string @go(ID,*string)

	// The client-facing file path of the HPC Cache Blob NFS Target.
	namespacePath?: null | string @go(NamespacePath,*string)

	// The name of the Resource Group where the HPC Cache Blob NFS Target should exist. Changing this forces a new HPC Cache Blob NFS Target to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The Resource Manager ID of the Storage Container used as the HPC Cache Blob NFS Target. Changing this forces a new resource to be created.
	storageContainerId?: null | string @go(StorageContainerID,*string)

	// The type of usage of the HPC Cache Blob NFS Target. Possible values are: READ_HEAVY_INFREQ, READ_HEAVY_CHECK_180, WRITE_WORKLOAD_15, WRITE_AROUND, WRITE_WORKLOAD_CHECK_30, WRITE_WORKLOAD_CHECK_60 and WRITE_WORKLOAD_CLOUDWS.
	usageModel?: null | string @go(UsageModel,*string)
}

#HPCCacheBlobNFSTargetParameters: {
	// The name of the access policy applied to this target. Defaults to default.
	// +kubebuilder:validation:Optional
	accessPolicyName?: null | string @go(AccessPolicyName,*string)

	// The name of the HPC Cache, which the HPC Cache Blob NFS Target will be added to. Changing this forces a new HPC Cache Blob NFS Target to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storagecache/v1beta1.HPCCache
	// +kubebuilder:validation:Optional
	cacheName?: null | string @go(CacheName,*string)

	// The client-facing file path of the HPC Cache Blob NFS Target.
	// +kubebuilder:validation:Optional
	namespacePath?: null | string @go(NamespacePath,*string)

	// The name of the Resource Group where the HPC Cache Blob NFS Target should exist. Changing this forces a new HPC Cache Blob NFS Target to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The Resource Manager ID of the Storage Container used as the HPC Cache Blob NFS Target. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	storageContainerId?: null | string @go(StorageContainerID,*string)

	// The type of usage of the HPC Cache Blob NFS Target. Possible values are: READ_HEAVY_INFREQ, READ_HEAVY_CHECK_180, WRITE_WORKLOAD_15, WRITE_AROUND, WRITE_WORKLOAD_CHECK_30, WRITE_WORKLOAD_CHECK_60 and WRITE_WORKLOAD_CLOUDWS.
	// +kubebuilder:validation:Optional
	usageModel?: null | string @go(UsageModel,*string)
}

// HPCCacheBlobNFSTargetSpec defines the desired state of HPCCacheBlobNFSTarget
#HPCCacheBlobNFSTargetSpec: {
	forProvider: #HPCCacheBlobNFSTargetParameters @go(ForProvider)

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
	initProvider?: #HPCCacheBlobNFSTargetInitParameters @go(InitProvider)
}

// HPCCacheBlobNFSTargetStatus defines the observed state of HPCCacheBlobNFSTarget.
#HPCCacheBlobNFSTargetStatus: {
	atProvider?: #HPCCacheBlobNFSTargetObservation @go(AtProvider)
}

// HPCCacheBlobNFSTarget is the Schema for the HPCCacheBlobNFSTargets API. Manages a Blob NFSv3 Target within a HPC Cache.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#HPCCacheBlobNFSTarget: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.namespacePath) || (has(self.initProvider) && has(self.initProvider.namespacePath))",message="spec.forProvider.namespacePath is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.storageContainerId) || (has(self.initProvider) && has(self.initProvider.storageContainerId))",message="spec.forProvider.storageContainerId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.usageModel) || (has(self.initProvider) && has(self.initProvider.usageModel))",message="spec.forProvider.usageModel is a required parameter"
	spec:    #HPCCacheBlobNFSTargetSpec   @go(Spec)
	status?: #HPCCacheBlobNFSTargetStatus @go(Status)
}

// HPCCacheBlobNFSTargetList contains a list of HPCCacheBlobNFSTargets
#HPCCacheBlobNFSTargetList: {
	items: [...#HPCCacheBlobNFSTarget] @go(Items,[]HPCCacheBlobNFSTarget)
}