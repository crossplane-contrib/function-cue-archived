// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/notificationhubs/v1beta1

package v1beta1

#NotificationHubNamespaceObservation: {
	// Is this Notification Hub Namespace enabled? Defaults to true.
	enabled?: null | bool @go(Enabled,*bool)

	// The ID of the Notification Hub Namespace.
	id?: null | string @go(ID,*string)

	// The Azure Region in which this Notification Hub Namespace should be created. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// The Type of Namespace - possible values are Messaging or NotificationHub.
	namespaceType?: null | string @go(NamespaceType,*string)

	// The name of the Resource Group in which the Notification Hub Namespace should exist. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The ServiceBus Endpoint for this Notification Hub Namespace.
	servicebusEndpoint?: null | string @go(ServiceBusEndpoint,*string)

	// The name of the SKU to use for this Notification Hub Namespace. Possible values are Free, Basic or Standard.
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#NotificationHubNamespaceParameters: {
	// Is this Notification Hub Namespace enabled? Defaults to true.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// The Azure Region in which this Notification Hub Namespace should be created. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The Type of Namespace - possible values are Messaging or NotificationHub.
	// +kubebuilder:validation:Optional
	namespaceType?: null | string @go(NamespaceType,*string)

	// The name of the Resource Group in which the Notification Hub Namespace should exist. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The name of the SKU to use for this Notification Hub Namespace. Possible values are Free, Basic or Standard.
	// +kubebuilder:validation:Optional
	skuName?: null | string @go(SkuName,*string)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// NotificationHubNamespaceSpec defines the desired state of NotificationHubNamespace
#NotificationHubNamespaceSpec: {
	forProvider: #NotificationHubNamespaceParameters @go(ForProvider)
}

// NotificationHubNamespaceStatus defines the observed state of NotificationHubNamespace.
#NotificationHubNamespaceStatus: {
	atProvider?: #NotificationHubNamespaceObservation @go(AtProvider)
}

// NotificationHubNamespace is the Schema for the NotificationHubNamespaces API. Manages a Notification Hub Namespace.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#NotificationHubNamespace: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.namespaceType)",message="namespaceType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.skuName)",message="skuName is a required parameter"
	spec:    #NotificationHubNamespaceSpec   @go(Spec)
	status?: #NotificationHubNamespaceStatus @go(Status)
}

// NotificationHubNamespaceList contains a list of NotificationHubNamespaces
#NotificationHubNamespaceList: {
	items: [...#NotificationHubNamespace] @go(Items,[]NotificationHubNamespace)
}