// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/ec2/v1alpha1

package v1alpha1

// VPCPeeringConnectionParameters defines the desired state of VPCPeeringConnection
#VPCPeeringConnectionParameters: {
	// Region is which region the VPCPeeringConnection will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// The Amazon Web Services account ID of the owner of the accepter VPC.
	//
	// Default: Your Amazon Web Services account ID
	peerOwnerID?: null | string @go(PeerOwnerID,*string)

	// The Region code for the accepter VPC, if the accepter VPC is located in a
	// Region other than the Region in which you make the request.
	//
	// Default: The Region in which you make the request.
	peerRegion?: null | string @go(PeerRegion,*string)

	// The tags to assign to the peering connection.
	tagSpecifications?: [...null | #TagSpecification] @go(TagSpecifications,[]*TagSpecification)

	#CustomVPCPeeringConnectionParameters
}

// VPCPeeringConnectionSpec defines the desired state of VPCPeeringConnection
#VPCPeeringConnectionSpec: {
	forProvider: #VPCPeeringConnectionParameters @go(ForProvider)
}

// VPCPeeringConnectionObservation defines the observed state of VPCPeeringConnection
#VPCPeeringConnectionObservation: {
	// Information about the accepter VPC. CIDR block information is only returned
	// when describing an active VPC peering connection.
	accepterVPCInfo?: null | #VPCPeeringConnectionVPCInfo @go(AccepterVPCInfo,*VPCPeeringConnectionVPCInfo)

	// Information about the requester VPC. CIDR block information is only returned
	// when describing an active VPC peering connection.
	requesterVPCInfo?: null | #VPCPeeringConnectionVPCInfo @go(RequesterVPCInfo,*VPCPeeringConnectionVPCInfo)

	// The status of the VPC peering connection.
	status?: null | #VPCPeeringConnectionStateReason @go(Status,*VPCPeeringConnectionStateReason)

	// Any tags assigned to the resource.
	tags?: [...null | #Tag] @go(Tags,[]*Tag)

	// The ID of the VPC peering connection.
	vpcPeeringConnectionID?: null | string @go(VPCPeeringConnectionID,*string)
}

// VPCPeeringConnectionStatus defines the observed state of VPCPeeringConnection.
#VPCPeeringConnectionStatus: {
	atProvider?: #VPCPeeringConnectionObservation @go(AtProvider)
}

// VPCPeeringConnection is the Schema for the VPCPeeringConnections API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#VPCPeeringConnection: {
	spec:    #VPCPeeringConnectionSpec   @go(Spec)
	status?: #VPCPeeringConnectionStatus @go(Status)
}

// VPCPeeringConnectionList contains a list of VPCPeeringConnections
#VPCPeeringConnectionList: {
	items: [...#VPCPeeringConnection] @go(Items,[]VPCPeeringConnection)
}