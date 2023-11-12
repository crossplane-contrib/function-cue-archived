// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

#OperatingRegionsObservation: {
	// The name of the Region you want to add to the IPAM.
	regionName?: null | string @go(RegionName,*string)
}

#OperatingRegionsParameters: {
	// The name of the Region you want to add to the IPAM.
	// +kubebuilder:validation:Required
	regionName?: null | string @go(RegionName,*string)
}

#VPCIpamObservation: {
	// Amazon Resource Name (ARN) of IPAM
	arn?: null | string @go(Arn,*string)

	// Enables you to quickly delete an IPAM, private scopes, pools in private scopes, and any allocations in the pools in private scopes.
	cascade?: null | bool @go(Cascade,*bool)

	// The ID of the IPAM
	defaultResourceDiscoveryAssociationId?: null | string @go(DefaultResourceDiscoveryAssociationID,*string)

	// The ID of the IPAM
	defaultResourceDiscoveryId?: null | string @go(DefaultResourceDiscoveryID,*string)

	// A description for the IPAM.
	description?: null | string @go(Description,*string)

	// The ID of the IPAM
	id?: null | string @go(ID,*string)

	// Determines which locales can be chosen when you create pools. Locale is the Region where you want to make an IPAM pool available for allocations. You can only create pools with locales that match the operating Regions of the IPAM. You can only create VPCs from a pool whose locale matches the VPC's Region. You specify a region using the region_name parameter. You must set your provider block region as an operating_region.
	operatingRegions?: [...#OperatingRegionsObservation] @go(OperatingRegions,[]OperatingRegionsObservation)

	// The ID of the IPAM's private scope. A scope is a top-level container in IPAM. Each scope represents an IP-independent network. Scopes enable you to represent networks where you have overlapping IP space. When you create an IPAM, IPAM automatically creates two scopes: public and private. The private scope is intended for private IP space. The public scope is intended for all internet-routable IP space.
	privateDefaultScopeId?: null | string @go(PrivateDefaultScopeID,*string)

	// The ID of the IPAM's public scope. A scope is a top-level container in IPAM. Each scope represents an IP-independent network. Scopes enable you to represent networks where you have overlapping IP space. When you create an IPAM, IPAM automatically creates two scopes: public and private. The private scope is intended for private
	// IP space. The public scope is intended for all internet-routable IP space.
	publicDefaultScopeId?: null | string @go(PublicDefaultScopeID,*string)

	// The number of scopes in the IPAM.
	scopeCount?: null | float64 @go(ScopeCount,*float64)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#VPCIpamParameters: {
	// Enables you to quickly delete an IPAM, private scopes, pools in private scopes, and any allocations in the pools in private scopes.
	// +kubebuilder:validation:Optional
	cascade?: null | bool @go(Cascade,*bool)

	// A description for the IPAM.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Determines which locales can be chosen when you create pools. Locale is the Region where you want to make an IPAM pool available for allocations. You can only create pools with locales that match the operating Regions of the IPAM. You can only create VPCs from a pool whose locale matches the VPC's Region. You specify a region using the region_name parameter. You must set your provider block region as an operating_region.
	// +kubebuilder:validation:Optional
	operatingRegions?: [...#OperatingRegionsParameters] @go(OperatingRegions,[]OperatingRegionsParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// VPCIpamSpec defines the desired state of VPCIpam
#VPCIpamSpec: {
	forProvider: #VPCIpamParameters @go(ForProvider)
}

// VPCIpamStatus defines the observed state of VPCIpam.
#VPCIpamStatus: {
	atProvider?: #VPCIpamObservation @go(AtProvider)
}

// VPCIpam is the Schema for the VPCIpams API. Provides an IPAM resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#VPCIpam: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.operatingRegions)",message="operatingRegions is a required parameter"
	spec:    #VPCIpamSpec   @go(Spec)
	status?: #VPCIpamStatus @go(Status)
}

// VPCIpamList contains a list of VPCIpams
#VPCIpamList: {
	items: [...#VPCIpam] @go(Items,[]VPCIpam)
}