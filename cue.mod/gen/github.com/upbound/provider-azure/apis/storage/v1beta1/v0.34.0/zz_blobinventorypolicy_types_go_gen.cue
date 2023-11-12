// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/storage/v1beta1

package v1beta1

#BlobInventoryPolicyObservation: {
	// The ID of the Storage Blob Inventory Policy.
	id?: null | string @go(ID,*string)

	// One or more rules blocks as defined below.
	rules?: [...#RulesObservation] @go(Rules,[]RulesObservation)

	// The ID of the storage account to apply this Blob Inventory Policy to. Changing this forces a new Storage Blob Inventory Policy to be created.
	storageAccountId?: null | string @go(StorageAccountID,*string)
}

#BlobInventoryPolicyParameters: {
	// One or more rules blocks as defined below.
	// +kubebuilder:validation:Optional
	rules?: [...#RulesParameters] @go(Rules,[]RulesParameters)

	// The ID of the storage account to apply this Blob Inventory Policy to. Changing this forces a new Storage Blob Inventory Policy to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Account
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	storageAccountId?: null | string @go(StorageAccountID,*string)
}

#FilterObservation: {
	// A set of blob types. Possible values are blockBlob, appendBlob, and pageBlob. The storage account with is_hns_enabled is true doesn't support pageBlob.
	blobTypes?: [...null | string] @go(BlobTypes,[]*string)

	// A set of strings for blob prefixes to be excluded. Maximum of 10 blob prefixes.
	excludePrefixes?: [...null | string] @go(ExcludePrefixes,[]*string)

	// Includes blob versions in blob inventory or not? Defaults to false.
	includeBlobVersions?: null | bool @go(IncludeBlobVersions,*bool)

	// Includes deleted blobs in blob inventory or not? Defaults to false.
	includeDeleted?: null | bool @go(IncludeDeleted,*bool)

	// Includes blob snapshots in blob inventory or not? Defaults to false.
	includeSnapshots?: null | bool @go(IncludeSnapshots,*bool)

	// A set of strings for blob prefixes to be matched. Maximum of 10 blob prefixes.
	prefixMatch?: [...null | string] @go(PrefixMatch,[]*string)
}

#FilterParameters: {
	// A set of blob types. Possible values are blockBlob, appendBlob, and pageBlob. The storage account with is_hns_enabled is true doesn't support pageBlob.
	// +kubebuilder:validation:Required
	blobTypes: [...null | string] @go(BlobTypes,[]*string)

	// A set of strings for blob prefixes to be excluded. Maximum of 10 blob prefixes.
	// +kubebuilder:validation:Optional
	excludePrefixes?: [...null | string] @go(ExcludePrefixes,[]*string)

	// Includes blob versions in blob inventory or not? Defaults to false.
	// +kubebuilder:validation:Optional
	includeBlobVersions?: null | bool @go(IncludeBlobVersions,*bool)

	// Includes deleted blobs in blob inventory or not? Defaults to false.
	// +kubebuilder:validation:Optional
	includeDeleted?: null | bool @go(IncludeDeleted,*bool)

	// Includes blob snapshots in blob inventory or not? Defaults to false.
	// +kubebuilder:validation:Optional
	includeSnapshots?: null | bool @go(IncludeSnapshots,*bool)

	// A set of strings for blob prefixes to be matched. Maximum of 10 blob prefixes.
	// +kubebuilder:validation:Optional
	prefixMatch?: [...null | string] @go(PrefixMatch,[]*string)
}

#RulesObservation: {
	// A filter block as defined above. Can only be set when the scope is Blob.
	filter?: [...#FilterObservation] @go(Filter,[]FilterObservation)

	// The format of the inventory files. Possible values are Csv and Parquet.
	format?: null | string @go(Format,*string)

	// The name which should be used for this Blob Inventory Policy Rule.
	name?: null | string @go(Name,*string)

	// The inventory schedule applied by this rule. Possible values are Daily and Weekly.
	schedule?: null | string @go(Schedule,*string)

	// A list of fields to be included in the inventory. See the Azure API reference for all the supported fields.
	schemaFields?: [...null | string] @go(SchemaFields,[]*string)

	// The scope of the inventory for this rule. Possible values are Blob and Container.
	scope?: null | string @go(Scope,*string)

	// The storage container name to store the blob inventory files for this rule.
	storageContainerName?: null | string @go(StorageContainerName,*string)
}

#RulesParameters: {
	// A filter block as defined above. Can only be set when the scope is Blob.
	// +kubebuilder:validation:Optional
	filter?: [...#FilterParameters] @go(Filter,[]FilterParameters)

	// The format of the inventory files. Possible values are Csv and Parquet.
	// +kubebuilder:validation:Required
	format?: null | string @go(Format,*string)

	// The name which should be used for this Blob Inventory Policy Rule.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The inventory schedule applied by this rule. Possible values are Daily and Weekly.
	// +kubebuilder:validation:Required
	schedule?: null | string @go(Schedule,*string)

	// A list of fields to be included in the inventory. See the Azure API reference for all the supported fields.
	// +kubebuilder:validation:Required
	schemaFields: [...null | string] @go(SchemaFields,[]*string)

	// The scope of the inventory for this rule. Possible values are Blob and Container.
	// +kubebuilder:validation:Required
	scope?: null | string @go(Scope,*string)

	// The storage container name to store the blob inventory files for this rule.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Container
	// +kubebuilder:validation:Optional
	storageContainerName?: null | string @go(StorageContainerName,*string)
}

// BlobInventoryPolicySpec defines the desired state of BlobInventoryPolicy
#BlobInventoryPolicySpec: {
	forProvider: #BlobInventoryPolicyParameters @go(ForProvider)
}

// BlobInventoryPolicyStatus defines the observed state of BlobInventoryPolicy.
#BlobInventoryPolicyStatus: {
	atProvider?: #BlobInventoryPolicyObservation @go(AtProvider)
}

// BlobInventoryPolicy is the Schema for the BlobInventoryPolicys API. Manages a Storage Blob Inventory Policy.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#BlobInventoryPolicy: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.rules)",message="rules is a required parameter"
	spec:    #BlobInventoryPolicySpec   @go(Spec)
	status?: #BlobInventoryPolicyStatus @go(Status)
}

// BlobInventoryPolicyList contains a list of BlobInventoryPolicys
#BlobInventoryPolicyList: {
	items: [...#BlobInventoryPolicy] @go(Items,[]BlobInventoryPolicy)
}