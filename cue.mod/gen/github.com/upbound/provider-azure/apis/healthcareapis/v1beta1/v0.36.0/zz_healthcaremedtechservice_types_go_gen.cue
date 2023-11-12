// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/healthcareapis/v1beta1

package v1beta1

#HealthcareMedtechServiceIdentityInitParameters: {
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// Specifies the type of Managed Service Identity that should be configured on this Healthcare Med Tech Service. Possible values are SystemAssigned.
	type?: null | string @go(Type,*string)
}

#HealthcareMedtechServiceIdentityObservation: {
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// The Principal ID associated with this System Assigned Managed Service Identity.
	principalId?: null | string @go(PrincipalID,*string)

	// The Tenant ID associated with this System Assigned Managed Service Identity.
	tenantId?: null | string @go(TenantID,*string)

	// Specifies the type of Managed Service Identity that should be configured on this Healthcare Med Tech Service. Possible values are SystemAssigned.
	type?: null | string @go(Type,*string)
}

#HealthcareMedtechServiceIdentityParameters: {
	// +kubebuilder:validation:Optional
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// Specifies the type of Managed Service Identity that should be configured on this Healthcare Med Tech Service. Possible values are SystemAssigned.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#HealthcareMedtechServiceInitParameters: {
	// Specifies the Device Mappings of the Med Tech Service.
	deviceMappingJson?: null | string @go(DeviceMappingJSON,*string)

	// An identity block as defined below.
	identity?: [...#HealthcareMedtechServiceIdentityInitParameters] @go(Identity,[]HealthcareMedtechServiceIdentityInitParameters)

	// Specifies the Azure Region where the Healthcare Med Tech Service should be created. Changing this forces a new Healthcare Med Tech Service to be created.
	location?: null | string @go(Location,*string)

	// A mapping of tags to assign to the Healthcare Med Tech Service.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#HealthcareMedtechServiceObservation: {
	// Specifies the Device Mappings of the Med Tech Service.
	deviceMappingJson?: null | string @go(DeviceMappingJSON,*string)

	// Specifies the Consumer Group of the Event Hub to connect to.
	eventhubConsumerGroupName?: null | string @go(EventHubConsumerGroupName,*string)

	// Specifies the name of the Event Hub to connect to.
	eventhubName?: null | string @go(EventHubName,*string)

	// Specifies the namespace name of the Event Hub to connect to.
	eventhubNamespaceName?: null | string @go(EventHubNamespaceName,*string)

	// The ID of the Healthcare Med Tech Service.
	id?: null | string @go(ID,*string)

	// An identity block as defined below.
	identity?: [...#HealthcareMedtechServiceIdentityObservation] @go(Identity,[]HealthcareMedtechServiceIdentityObservation)

	// Specifies the Azure Region where the Healthcare Med Tech Service should be created. Changing this forces a new Healthcare Med Tech Service to be created.
	location?: null | string @go(Location,*string)

	// A mapping of tags to assign to the Healthcare Med Tech Service.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the id of the Healthcare Workspace where the Healthcare Med Tech Service should exist. Changing this forces a new Healthcare Med Tech Service to be created.
	workspaceId?: null | string @go(WorkspaceID,*string)
}

#HealthcareMedtechServiceParameters: {
	// Specifies the Device Mappings of the Med Tech Service.
	// +kubebuilder:validation:Optional
	deviceMappingJson?: null | string @go(DeviceMappingJSON,*string)

	// Specifies the Consumer Group of the Event Hub to connect to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/eventhub/v1beta1.ConsumerGroup
	// +kubebuilder:validation:Optional
	eventhubConsumerGroupName?: null | string @go(EventHubConsumerGroupName,*string)

	// Specifies the name of the Event Hub to connect to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/eventhub/v1beta1.EventHub
	// +kubebuilder:validation:Optional
	eventhubName?: null | string @go(EventHubName,*string)

	// Specifies the namespace name of the Event Hub to connect to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/eventhub/v1beta1.EventHubNamespace
	// +kubebuilder:validation:Optional
	eventhubNamespaceName?: null | string @go(EventHubNamespaceName,*string)

	// An identity block as defined below.
	// +kubebuilder:validation:Optional
	identity?: [...#HealthcareMedtechServiceIdentityParameters] @go(Identity,[]HealthcareMedtechServiceIdentityParameters)

	// Specifies the Azure Region where the Healthcare Med Tech Service should be created. Changing this forces a new Healthcare Med Tech Service to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// A mapping of tags to assign to the Healthcare Med Tech Service.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the id of the Healthcare Workspace where the Healthcare Med Tech Service should exist. Changing this forces a new Healthcare Med Tech Service to be created.
	// +crossplane:generate:reference:type=HealthcareWorkspace
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	workspaceId?: null | string @go(WorkspaceID,*string)
}

// HealthcareMedtechServiceSpec defines the desired state of HealthcareMedtechService
#HealthcareMedtechServiceSpec: {
	forProvider: #HealthcareMedtechServiceParameters @go(ForProvider)

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
	initProvider?: #HealthcareMedtechServiceInitParameters @go(InitProvider)
}

// HealthcareMedtechServiceStatus defines the observed state of HealthcareMedtechService.
#HealthcareMedtechServiceStatus: {
	atProvider?: #HealthcareMedtechServiceObservation @go(AtProvider)
}

// HealthcareMedtechService is the Schema for the HealthcareMedtechServices API. Manages a Healthcare MedTech (Internet of Medical Things) devices Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#HealthcareMedtechService: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.deviceMappingJson) || has(self.initProvider.deviceMappingJson)",message="deviceMappingJson is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || has(self.initProvider.location)",message="location is a required parameter"
	spec:    #HealthcareMedtechServiceSpec   @go(Spec)
	status?: #HealthcareMedtechServiceStatus @go(Status)
}

// HealthcareMedtechServiceList contains a list of HealthcareMedtechServices
#HealthcareMedtechServiceList: {
	items: [...#HealthcareMedtechService] @go(Items,[]HealthcareMedtechService)
}