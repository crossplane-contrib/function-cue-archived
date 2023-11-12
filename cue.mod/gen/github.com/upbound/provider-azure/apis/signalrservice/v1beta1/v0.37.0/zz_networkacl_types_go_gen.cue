// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/signalrservice/v1beta1

package v1beta1

#NetworkACLInitParameters: {
	// The default action to control the network access when no other rule matches. Possible values are Allow and Deny.
	defaultAction?: null | string @go(DefaultAction,*string)

	// A private_endpoint block as defined below.
	privateEndpoint?: [...#PrivateEndpointInitParameters] @go(PrivateEndpoint,[]PrivateEndpointInitParameters)

	// A public_network block as defined below.
	publicNetwork?: [...#PublicNetworkInitParameters] @go(PublicNetwork,[]PublicNetworkInitParameters)
}

#NetworkACLObservation: {
	// The default action to control the network access when no other rule matches. Possible values are Allow and Deny.
	defaultAction?: null | string @go(DefaultAction,*string)

	// The ID of the SignalR service.
	id?: null | string @go(ID,*string)

	// A private_endpoint block as defined below.
	privateEndpoint?: [...#PrivateEndpointObservation] @go(PrivateEndpoint,[]PrivateEndpointObservation)

	// A public_network block as defined below.
	publicNetwork?: [...#PublicNetworkObservation] @go(PublicNetwork,[]PublicNetworkObservation)

	// The ID of the SignalR service. Changing this forces a new resource to be created.
	signalrServiceId?: null | string @go(SignalrServiceID,*string)
}

#NetworkACLParameters: {
	// The default action to control the network access when no other rule matches. Possible values are Allow and Deny.
	// +kubebuilder:validation:Optional
	defaultAction?: null | string @go(DefaultAction,*string)

	// A private_endpoint block as defined below.
	// +kubebuilder:validation:Optional
	privateEndpoint?: [...#PrivateEndpointParameters] @go(PrivateEndpoint,[]PrivateEndpointParameters)

	// A public_network block as defined below.
	// +kubebuilder:validation:Optional
	publicNetwork?: [...#PublicNetworkParameters] @go(PublicNetwork,[]PublicNetworkParameters)

	// The ID of the SignalR service. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/signalrservice/v1beta1.Service
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	signalrServiceId?: null | string @go(SignalrServiceID,*string)
}

#PrivateEndpointInitParameters: {
	// The allowed request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)
}

#PrivateEndpointObservation: {
	// The allowed request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)

	// The ID of the Private Endpoint which is based on the SignalR service.
	id?: null | string @go(ID,*string)
}

#PrivateEndpointParameters: {
	// The allowed request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the Private Endpoint Connection. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)

	// The ID of the Private Endpoint which is based on the SignalR service.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.PrivateEndpoint
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	id?: null | string @go(ID,*string)
}

#PublicNetworkInitParameters: {
	// The allowed request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)
}

#PublicNetworkObservation: {
	// The allowed request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)
}

#PublicNetworkParameters: {
	// The allowed request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	allowedRequestTypes?: [...null | string] @go(AllowedRequestTypes,[]*string)

	// The denied request types for the public network. Possible values are ClientConnection, ServerConnection, RESTAPI and Trace.
	// +kubebuilder:validation:Optional
	deniedRequestTypes?: [...null | string] @go(DeniedRequestTypes,[]*string)
}

// NetworkACLSpec defines the desired state of NetworkACL
#NetworkACLSpec: {
	forProvider: #NetworkACLParameters @go(ForProvider)

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
	initProvider?: #NetworkACLInitParameters @go(InitProvider)
}

// NetworkACLStatus defines the observed state of NetworkACL.
#NetworkACLStatus: {
	atProvider?: #NetworkACLObservation @go(AtProvider)
}

// NetworkACL is the Schema for the NetworkACLs API. Manages the Network ACL for a SignalR service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#NetworkACL: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.defaultAction) || (has(self.initProvider) && has(self.initProvider.defaultAction))",message="spec.forProvider.defaultAction is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.publicNetwork) || (has(self.initProvider) && has(self.initProvider.publicNetwork))",message="spec.forProvider.publicNetwork is a required parameter"
	spec:    #NetworkACLSpec   @go(Spec)
	status?: #NetworkACLStatus @go(Status)
}

// NetworkACLList contains a list of NetworkACLs
#NetworkACLList: {
	items: [...#NetworkACL] @go(Items,[]NetworkACL)
}