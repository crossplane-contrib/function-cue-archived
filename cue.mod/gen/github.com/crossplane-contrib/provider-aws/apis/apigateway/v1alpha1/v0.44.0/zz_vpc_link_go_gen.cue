// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/apigateway/v1alpha1

package v1alpha1

// VPCLinkParameters defines the desired state of VPCLink
#VPCLinkParameters: {
	// Region is which region the VPCLink will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// The description of the VPC link.
	description?: null | string @go(Description,*string)

	// The name used to label and identify the VPC link.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
	// The tag key can be up to 128 characters and must not start with aws:. The
	// tag value can be up to 256 characters.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The ARN of the network load balancer of the VPC targeted by the VPC link.
	// The network load balancer must be owned by the same Amazon Web Services account
	// of the API owner.
	// +kubebuilder:validation:Required
	targetARNs: [...null | string] @go(TargetARNs,[]*string)

	#CustomVPCLinkParameters
}

// VPCLinkSpec defines the desired state of VPCLink
#VPCLinkSpec: {
	forProvider: #VPCLinkParameters @go(ForProvider)
}

// VPCLinkObservation defines the observed state of VPCLink
#VPCLinkObservation: {
	// The identifier of the VpcLink. It is used in an Integration to reference
	// this VpcLink.
	id?: null | string @go(ID,*string)

	// The status of the VPC link. The valid values are AVAILABLE, PENDING, DELETING,
	// or FAILED. Deploying an API will wait if the status is PENDING and will fail
	// if the status is DELETING.
	status?: null | string @go(Status,*string)

	// A description about the VPC link status.
	statusMessage?: null | string @go(StatusMessage,*string)
}

// VPCLinkStatus defines the observed state of VPCLink.
#VPCLinkStatus: {
	atProvider?: #VPCLinkObservation @go(AtProvider)
}

// VPCLink is the Schema for the VPCLinks API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#VPCLink: {
	spec:    #VPCLinkSpec   @go(Spec)
	status?: #VPCLinkStatus @go(Status)
}

// VPCLinkList contains a list of VPCLinks
#VPCLinkList: {
	items: [...#VPCLink] @go(Items,[]VPCLink)
}