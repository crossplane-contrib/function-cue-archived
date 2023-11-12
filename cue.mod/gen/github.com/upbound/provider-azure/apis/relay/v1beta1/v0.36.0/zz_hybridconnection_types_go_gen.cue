// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/relay/v1beta1

package v1beta1

#HybridConnectionInitParameters: {
	// Specifies the name of the Azure Relay Hybrid Connection. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// Specify if client authorization is needed for this hybrid connection. True by default. Changing this forces a new resource to be created. Defaults to true.
	requiresClientAuthorization?: null | bool @go(RequiresClientAuthorization,*bool)

	// The usermetadata is a placeholder to store user-defined string data for the hybrid connection endpoint. For example, it can be used to store descriptive data, such as a list of teams and their contact information. Also, user-defined configuration settings can be stored.
	userMetadata?: null | string @go(UserMetadata,*string)
}

#HybridConnectionObservation: {
	// The ID of the Relay Hybrid Connection.
	id?: null | string @go(ID,*string)

	// Specifies the name of the Azure Relay Hybrid Connection. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// The name of the Azure Relay in which to create the Azure Relay Hybrid Connection. Changing this forces a new resource to be created.
	relayNamespaceName?: null | string @go(RelayNamespaceName,*string)

	// Specify if client authorization is needed for this hybrid connection. True by default. Changing this forces a new resource to be created. Defaults to true.
	requiresClientAuthorization?: null | bool @go(RequiresClientAuthorization,*bool)

	// The name of the resource group in which to create the Azure Relay Hybrid Connection. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The usermetadata is a placeholder to store user-defined string data for the hybrid connection endpoint. For example, it can be used to store descriptive data, such as a list of teams and their contact information. Also, user-defined configuration settings can be stored.
	userMetadata?: null | string @go(UserMetadata,*string)
}

#HybridConnectionParameters: {
	// Specifies the name of the Azure Relay Hybrid Connection. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The name of the Azure Relay in which to create the Azure Relay Hybrid Connection. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/relay/v1beta1.EventRelayNamespace
	// +kubebuilder:validation:Optional
	relayNamespaceName?: null | string @go(RelayNamespaceName,*string)

	// Specify if client authorization is needed for this hybrid connection. True by default. Changing this forces a new resource to be created. Defaults to true.
	// +kubebuilder:validation:Optional
	requiresClientAuthorization?: null | bool @go(RequiresClientAuthorization,*bool)

	// The name of the resource group in which to create the Azure Relay Hybrid Connection. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The usermetadata is a placeholder to store user-defined string data for the hybrid connection endpoint. For example, it can be used to store descriptive data, such as a list of teams and their contact information. Also, user-defined configuration settings can be stored.
	// +kubebuilder:validation:Optional
	userMetadata?: null | string @go(UserMetadata,*string)
}

// HybridConnectionSpec defines the desired state of HybridConnection
#HybridConnectionSpec: {
	forProvider: #HybridConnectionParameters @go(ForProvider)

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
	initProvider?: #HybridConnectionInitParameters @go(InitProvider)
}

// HybridConnectionStatus defines the observed state of HybridConnection.
#HybridConnectionStatus: {
	atProvider?: #HybridConnectionObservation @go(AtProvider)
}

// HybridConnection is the Schema for the HybridConnections API. Manages an Azure Relay Hybrid Connection.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#HybridConnection: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || has(self.initProvider.name)",message="name is a required parameter"
	spec:    #HybridConnectionSpec   @go(Spec)
	status?: #HybridConnectionStatus @go(Status)
}

// HybridConnectionList contains a list of HybridConnections
#HybridConnectionList: {
	items: [...#HybridConnection] @go(Items,[]HybridConnection)
}