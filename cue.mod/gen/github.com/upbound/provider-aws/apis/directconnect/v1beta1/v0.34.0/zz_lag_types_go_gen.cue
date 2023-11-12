// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/directconnect/v1beta1

package v1beta1

#LagObservation: {
	// The ARN of the LAG.
	arn?: null | string @go(Arn,*string)

	// The ID of an existing dedicated connection to migrate to the LAG.
	connectionId?: null | string @go(ConnectionID,*string)

	// The bandwidth of the individual physical connections bundled by the LAG. Valid values: 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, 10Gbps and 100Gbps. Case sensitive.
	connectionsBandwidth?: null | string @go(ConnectionsBandwidth,*string)

	// A boolean that indicates all connections associated with the LAG should be deleted so that the LAG can be destroyed without error. These objects are not recoverable.
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// Indicates whether the LAG supports a secondary BGP peer in the same address family (IPv4/IPv6).
	hasLogicalRedundancy?: null | string @go(HasLogicalRedundancy,*string)

	// The ID of the LAG.
	id?: null | string @go(ID,*string)

	// Indicates whether jumbo frames (9001 MTU) are supported.
	jumboFrameCapable?: null | bool @go(JumboFrameCapable,*bool)

	// The AWS Direct Connect location in which the LAG should be allocated. See DescribeLocations for the list of AWS Direct Connect locations. Use locationCode.
	location?: null | string @go(Location,*string)

	// The name of the LAG.
	name?: null | string @go(Name,*string)

	// The ID of the AWS account that owns the LAG.
	ownerAccountId?: null | string @go(OwnerAccountID,*string)

	// The name of the service provider associated with the LAG.
	providerName?: null | string @go(ProviderName,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#LagParameters: {
	// The ID of an existing dedicated connection to migrate to the LAG.
	// +kubebuilder:validation:Optional
	connectionId?: null | string @go(ConnectionID,*string)

	// The bandwidth of the individual physical connections bundled by the LAG. Valid values: 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, 10Gbps and 100Gbps. Case sensitive.
	// +kubebuilder:validation:Optional
	connectionsBandwidth?: null | string @go(ConnectionsBandwidth,*string)

	// A boolean that indicates all connections associated with the LAG should be deleted so that the LAG can be destroyed without error. These objects are not recoverable.
	// +kubebuilder:validation:Optional
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// The AWS Direct Connect location in which the LAG should be allocated. See DescribeLocations for the list of AWS Direct Connect locations. Use locationCode.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the LAG.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The name of the service provider associated with the LAG.
	// +kubebuilder:validation:Optional
	providerName?: null | string @go(ProviderName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// LagSpec defines the desired state of Lag
#LagSpec: {
	forProvider: #LagParameters @go(ForProvider)
}

// LagStatus defines the observed state of Lag.
#LagStatus: {
	atProvider?: #LagObservation @go(AtProvider)
}

// Lag is the Schema for the Lags API. Provides a Direct Connect LAG.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Lag: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.connectionsBandwidth)",message="connectionsBandwidth is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #LagSpec   @go(Spec)
	status?: #LagStatus @go(Status)
}

// LagList contains a list of Lags
#LagList: {
	items: [...#Lag] @go(Items,[]Lag)
}