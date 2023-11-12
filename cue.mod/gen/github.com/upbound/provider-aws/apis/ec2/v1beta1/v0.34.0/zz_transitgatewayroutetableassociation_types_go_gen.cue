// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

#TransitGatewayRouteTableAssociationObservation: {
	// EC2 Transit Gateway Route Table identifier combined with EC2 Transit Gateway Attachment identifier
	id?: null | string @go(ID,*string)

	// Identifier of the resource
	resourceId?: null | string @go(ResourceID,*string)

	// Type of the resource
	resourceType?: null | string @go(ResourceType,*string)

	// Identifier of EC2 Transit Gateway Attachment.
	transitGatewayAttachmentId?: null | string @go(TransitGatewayAttachmentID,*string)

	// Identifier of EC2 Transit Gateway Route Table.
	transitGatewayRouteTableId?: null | string @go(TransitGatewayRouteTableID,*string)
}

#TransitGatewayRouteTableAssociationParameters: {
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Identifier of EC2 Transit Gateway Attachment.
	// +crossplane:generate:reference:type=TransitGatewayVPCAttachment
	// +kubebuilder:validation:Optional
	transitGatewayAttachmentId?: null | string @go(TransitGatewayAttachmentID,*string)

	// Identifier of EC2 Transit Gateway Route Table.
	// +crossplane:generate:reference:type=TransitGatewayRouteTable
	// +kubebuilder:validation:Optional
	transitGatewayRouteTableId?: null | string @go(TransitGatewayRouteTableID,*string)
}

// TransitGatewayRouteTableAssociationSpec defines the desired state of TransitGatewayRouteTableAssociation
#TransitGatewayRouteTableAssociationSpec: {
	forProvider: #TransitGatewayRouteTableAssociationParameters @go(ForProvider)
}

// TransitGatewayRouteTableAssociationStatus defines the observed state of TransitGatewayRouteTableAssociation.
#TransitGatewayRouteTableAssociationStatus: {
	atProvider?: #TransitGatewayRouteTableAssociationObservation @go(AtProvider)
}

// TransitGatewayRouteTableAssociation is the Schema for the TransitGatewayRouteTableAssociations API. Manages an EC2 Transit Gateway Route Table association
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#TransitGatewayRouteTableAssociation: {
	spec:    #TransitGatewayRouteTableAssociationSpec   @go(Spec)
	status?: #TransitGatewayRouteTableAssociationStatus @go(Status)
}

// TransitGatewayRouteTableAssociationList contains a list of TransitGatewayRouteTableAssociations
#TransitGatewayRouteTableAssociationList: {
	items: [...#TransitGatewayRouteTableAssociation] @go(Items,[]TransitGatewayRouteTableAssociation)
}