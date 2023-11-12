// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/cache/v1beta1

package v1beta1

#RedisEnterpriseClusterInitParameters: {
	// The Azure Region where the Redis Enterprise Cluster should exist. Changing this forces a new Redis Enterprise Cluster to be created.
	location?: null | string @go(Location,*string)

	// The minimum TLS version. Possible values are 1.0, 1.1 and 1.2. Defaults to 1.2. Changing this forces a new Redis Enterprise Cluster to be created.
	minimumTlsVersion?: null | string @go(MinimumTLSVersion,*string)

	// The sku_name is comprised of two segments separated by a hyphen (e.g. Enterprise_E10-2). The first segment of the sku_name defines the name of the SKU, possible values are Enterprise_E10, Enterprise_E20", Enterprise_E50, Enterprise_E100, EnterpriseFlash_F300, EnterpriseFlash_F700 or EnterpriseFlash_F1500. The second segment defines the capacity of the sku_name, possible values for Enteprise SKUs are (2, 4, 6, ...). Possible values for EnterpriseFlash SKUs are (3, 9, 15, ...). Changing this forces a new Redis Enterprise Cluster to be created.
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags which should be assigned to the Redis Enterprise Cluster.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies a list of Availability Zones in which this Redis Enterprise Cluster should be located. Changing this forces a new Redis Enterprise Cluster to be created.
	zones?: [...null | string] @go(Zones,[]*string)
}

#RedisEnterpriseClusterObservation: {
	// DNS name of the cluster endpoint.
	hostname?: null | string @go(HostName,*string)

	// The ID of the Redis Enterprise Cluster.
	id?: null | string @go(ID,*string)

	// The Azure Region where the Redis Enterprise Cluster should exist. Changing this forces a new Redis Enterprise Cluster to be created.
	location?: null | string @go(Location,*string)

	// The minimum TLS version. Possible values are 1.0, 1.1 and 1.2. Defaults to 1.2. Changing this forces a new Redis Enterprise Cluster to be created.
	minimumTlsVersion?: null | string @go(MinimumTLSVersion,*string)

	// The name of the Resource Group where the Redis Enterprise Cluster should exist. Changing this forces a new Redis Enterprise Cluster to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The sku_name is comprised of two segments separated by a hyphen (e.g. Enterprise_E10-2). The first segment of the sku_name defines the name of the SKU, possible values are Enterprise_E10, Enterprise_E20", Enterprise_E50, Enterprise_E100, EnterpriseFlash_F300, EnterpriseFlash_F700 or EnterpriseFlash_F1500. The second segment defines the capacity of the sku_name, possible values for Enteprise SKUs are (2, 4, 6, ...). Possible values for EnterpriseFlash SKUs are (3, 9, 15, ...). Changing this forces a new Redis Enterprise Cluster to be created.
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags which should be assigned to the Redis Enterprise Cluster.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies a list of Availability Zones in which this Redis Enterprise Cluster should be located. Changing this forces a new Redis Enterprise Cluster to be created.
	zones?: [...null | string] @go(Zones,[]*string)
}

#RedisEnterpriseClusterParameters: {
	// The Azure Region where the Redis Enterprise Cluster should exist. Changing this forces a new Redis Enterprise Cluster to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The minimum TLS version. Possible values are 1.0, 1.1 and 1.2. Defaults to 1.2. Changing this forces a new Redis Enterprise Cluster to be created.
	// +kubebuilder:validation:Optional
	minimumTlsVersion?: null | string @go(MinimumTLSVersion,*string)

	// The name of the Resource Group where the Redis Enterprise Cluster should exist. Changing this forces a new Redis Enterprise Cluster to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The sku_name is comprised of two segments separated by a hyphen (e.g. Enterprise_E10-2). The first segment of the sku_name defines the name of the SKU, possible values are Enterprise_E10, Enterprise_E20", Enterprise_E50, Enterprise_E100, EnterpriseFlash_F300, EnterpriseFlash_F700 or EnterpriseFlash_F1500. The second segment defines the capacity of the sku_name, possible values for Enteprise SKUs are (2, 4, 6, ...). Possible values for EnterpriseFlash SKUs are (3, 9, 15, ...). Changing this forces a new Redis Enterprise Cluster to be created.
	// +kubebuilder:validation:Optional
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags which should be assigned to the Redis Enterprise Cluster.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies a list of Availability Zones in which this Redis Enterprise Cluster should be located. Changing this forces a new Redis Enterprise Cluster to be created.
	// +kubebuilder:validation:Optional
	zones?: [...null | string] @go(Zones,[]*string)
}

// RedisEnterpriseClusterSpec defines the desired state of RedisEnterpriseCluster
#RedisEnterpriseClusterSpec: {
	forProvider: #RedisEnterpriseClusterParameters @go(ForProvider)

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
	initProvider?: #RedisEnterpriseClusterInitParameters @go(InitProvider)
}

// RedisEnterpriseClusterStatus defines the observed state of RedisEnterpriseCluster.
#RedisEnterpriseClusterStatus: {
	atProvider?: #RedisEnterpriseClusterObservation @go(AtProvider)
}

// RedisEnterpriseCluster is the Schema for the RedisEnterpriseClusters API. Manages a Redis Enterprise Cluster.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#RedisEnterpriseCluster: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || (has(self.initProvider) && has(self.initProvider.location))",message="spec.forProvider.location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.skuName) || (has(self.initProvider) && has(self.initProvider.skuName))",message="spec.forProvider.skuName is a required parameter"
	spec:    #RedisEnterpriseClusterSpec   @go(Spec)
	status?: #RedisEnterpriseClusterStatus @go(Status)
}

// RedisEnterpriseClusterList contains a list of RedisEnterpriseClusters
#RedisEnterpriseClusterList: {
	items: [...#RedisEnterpriseCluster] @go(Items,[]RedisEnterpriseCluster)
}