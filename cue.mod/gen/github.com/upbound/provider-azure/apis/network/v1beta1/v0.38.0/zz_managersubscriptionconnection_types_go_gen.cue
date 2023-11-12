// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/network/v1beta1

package v1beta1

#ManagerSubscriptionConnectionInitParameters: {
	// A description of the Network Manager Subscription Connection.
	description?: null | string @go(Description,*string)

	// Specifies the ID of the target Subscription. Changing this forces a new resource to be created.
	subscriptionId?: null | string @go(SubscriptionID,*string)
}

#ManagerSubscriptionConnectionObservation: {
	// The Connection state of the Network Manager Subscription Connection.
	connectionState?: null | string @go(ConnectionState,*string)

	// A description of the Network Manager Subscription Connection.
	description?: null | string @go(Description,*string)

	// The ID of the Network Manager Subscription Connection.
	id?: null | string @go(ID,*string)

	// Specifies the ID of the Network Manager which the Subscription is connected to.
	networkManagerId?: null | string @go(NetworkManagerID,*string)

	// Specifies the ID of the target Subscription. Changing this forces a new resource to be created.
	subscriptionId?: null | string @go(SubscriptionID,*string)
}

#ManagerSubscriptionConnectionParameters: {
	// A description of the Network Manager Subscription Connection.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Specifies the ID of the Network Manager which the Subscription is connected to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/network/v1beta1.Manager
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	networkManagerId?: null | string @go(NetworkManagerID,*string)

	// Specifies the ID of the target Subscription. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	subscriptionId?: null | string @go(SubscriptionID,*string)
}

// ManagerSubscriptionConnectionSpec defines the desired state of ManagerSubscriptionConnection
#ManagerSubscriptionConnectionSpec: {
	forProvider: #ManagerSubscriptionConnectionParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #ManagerSubscriptionConnectionInitParameters @go(InitProvider)
}

// ManagerSubscriptionConnectionStatus defines the observed state of ManagerSubscriptionConnection.
#ManagerSubscriptionConnectionStatus: {
	atProvider?: #ManagerSubscriptionConnectionObservation @go(AtProvider)
}

// ManagerSubscriptionConnection is the Schema for the ManagerSubscriptionConnections API. Manages a Network Manager Subscription Connection.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#ManagerSubscriptionConnection: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.subscriptionId) || (has(self.initProvider) && has(self.initProvider.subscriptionId))",message="spec.forProvider.subscriptionId is a required parameter"
	spec:    #ManagerSubscriptionConnectionSpec   @go(Spec)
	status?: #ManagerSubscriptionConnectionStatus @go(Status)
}

// ManagerSubscriptionConnectionList contains a list of ManagerSubscriptionConnections
#ManagerSubscriptionConnectionList: {
	items: [...#ManagerSubscriptionConnection] @go(Items,[]ManagerSubscriptionConnection)
}