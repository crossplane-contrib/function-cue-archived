// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/signalrservice/v1beta1

package v1beta1

#WebPubsubNetworkACLObservation: {
	// The default action to control the network access when no other rule matches. Possible values are Allow and Deny. Defaults to Deny.
	defaultAction?: null | string @go(DefaultAction,*string)

	// The ID of the Web Pubsub service.
	id?: null | string @go(ID,*string)

	// A private_endpoint block as defined below.
	privateEndpoint?: [...#WebPubsubNetworkACLPrivateEndpointObservation] @go(PrivateEndpoint,[]WebPubsubNetworkACLPrivateEndpointObservation)

	// A public_network block as defined below.
	publicNetwork?: [...#WebPubsubNetworkACLPublicNetworkObservation] @go(PublicNetwork,[]WebPubsubNetworkACLPublicNetworkObservation)

	// The ID of the Web Pubsub service. Changing this forces a new resource to be created.
	webPubsubId?: null | string @go(WebPubsubID,*string)
}

#WebPubsubNetworkACLParameters: {
	// The default action to control the network access when no other rule matches. Possible values are Allow and Deny. Defaults to Deny.
	// +kubebuilder:validation:Optional
	defaultAction?: null | string @go(DefaultAction,*string)

	// A private_endpoint block as defined below.
	// +kubebuilder:validation:Optional
	privateEndpoint?: [...#WebPubsubNetworkACLPrivateEndpointParameters] @go(PrivateEndpoint,[]WebPubsubNetworkACLPrivateEndpointParameters)

	// A public_network block as defined below.
	// +kubebuilder:validation:Optional
	publicNetwork?: [...#WebPubsubNetworkACLPublicNetworkParameters] @go(PublicNetwork,[]WebPubsubNetworkACLPublicNetworkParameters)

	// The ID of the Web Pubsub service. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/signalrservice/v1beta1.WebPubsub
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	webPubsubId?: null | string @go(WebPubsubID,*string)
}

#WebPubsubNetworkACLPrivateEndpointObservation: {
	// The allowed request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)

	// The ID of the Private Endpoint which is based on the Web Pubsub service.
	id?: null | string @go(ID,*string)
}

#WebPubsubNetworkACLPrivateEndpointParameters: {
	// The allowed request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)

	// The ID of the Private Endpoint which is based on the Web Pubsub service.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.PrivateEndpoint
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	id?: null | string @go(ID,*string)
}

#WebPubsubNetworkACLPublicNetworkObservation: {
	// The allowed request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)
}

#WebPubsubNetworkACLPublicNetworkParameters: {
	// The allowed request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)
}

// WebPubsubNetworkACLSpec defines the desired state of WebPubsubNetworkACL
#WebPubsubNetworkACLSpec: {
	forProvider: #WebPubsubNetworkACLParameters @go(ForProvider)
}

// WebPubsubNetworkACLStatus defines the observed state of WebPubsubNetworkACL.
#WebPubsubNetworkACLStatus: {
	atProvider?: #WebPubsubNetworkACLObservation @go(AtProvider)
}

// WebPubsubNetworkACL is the Schema for the WebPubsubNetworkACLs API. Manages the Network ACL for a Web Pubsub service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#WebPubsubNetworkACL: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.publicNetwork)",message="publicNetwork is a required parameter"
	spec:    #WebPubsubNetworkACLSpec   @go(Spec)
	status?: #WebPubsubNetworkACLStatus @go(Status)
}

// WebPubsubNetworkACLList contains a list of WebPubsubNetworkACLs
#WebPubsubNetworkACLList: {
	items: [...#WebPubsubNetworkACL] @go(Items,[]WebPubsubNetworkACL)
}