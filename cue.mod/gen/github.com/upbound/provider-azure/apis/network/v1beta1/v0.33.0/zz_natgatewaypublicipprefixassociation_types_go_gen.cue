// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/network/v1beta1

package v1beta1

#NATGatewayPublicIPPrefixAssociationObservation: {
	id?: null | string @go(ID,*string)

	// The ID of the NAT Gateway. Changing this forces a new resource to be created.
	natGatewayId?: null | string @go(NATGatewayID,*string)

	// The ID of the Public IP Prefix which this NAT Gateway which should be connected to. Changing this forces a new resource to be created.
	publicIpPrefixId?: null | string @go(PublicIPPrefixID,*string)
}

#NATGatewayPublicIPPrefixAssociationParameters: {
	// The ID of the NAT Gateway. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=NATGateway
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	natGatewayId?: null | string @go(NATGatewayID,*string)

	// The ID of the Public IP Prefix which this NAT Gateway which should be connected to. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=PublicIPPrefix
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	publicIpPrefixId?: null | string @go(PublicIPPrefixID,*string)
}

// NATGatewayPublicIPPrefixAssociationSpec defines the desired state of NATGatewayPublicIPPrefixAssociation
#NATGatewayPublicIPPrefixAssociationSpec: {
	forProvider: #NATGatewayPublicIPPrefixAssociationParameters @go(ForProvider)
}

// NATGatewayPublicIPPrefixAssociationStatus defines the observed state of NATGatewayPublicIPPrefixAssociation.
#NATGatewayPublicIPPrefixAssociationStatus: {
	atProvider?: #NATGatewayPublicIPPrefixAssociationObservation @go(AtProvider)
}

// NATGatewayPublicIPPrefixAssociation is the Schema for the NATGatewayPublicIPPrefixAssociations API. Manages the association between a NAT Gateway and a Public IP Prefix.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#NATGatewayPublicIPPrefixAssociation: {
	spec:    #NATGatewayPublicIPPrefixAssociationSpec   @go(Spec)
	status?: #NATGatewayPublicIPPrefixAssociationStatus @go(Status)
}

// NATGatewayPublicIPPrefixAssociationList contains a list of NATGatewayPublicIPPrefixAssociations
#NATGatewayPublicIPPrefixAssociationList: {
	items: [...#NATGatewayPublicIPPrefixAssociation] @go(Items,[]NATGatewayPublicIPPrefixAssociation)
}