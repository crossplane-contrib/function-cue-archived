// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/servicebus/v1beta1

package v1beta1

#NamespaceDisasterRecoveryConfigInitParameters: {
}

#NamespaceDisasterRecoveryConfigObservation: {
	// The Shared access policies used to access the connection string for the alias.
	aliasAuthorizationRuleId?: null | string @go(AliasAuthorizationRuleID,*string)

	// The Service Bus Namespace Disaster Recovery Config ID.
	id?: null | string @go(ID,*string)

	// The ID of the Service Bus Namespace to replicate to.
	partnerNamespaceId?: null | string @go(PartnerNamespaceID,*string)

	// The ID of the primary Service Bus Namespace to replicate. Changing this forces a new resource to be created.
	primaryNamespaceId?: null | string @go(PrimaryNamespaceID,*string)
}

#NamespaceDisasterRecoveryConfigParameters: {
	// The Shared access policies used to access the connection string for the alias.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/servicebus/v1beta1.NamespaceAuthorizationRule
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	aliasAuthorizationRuleId?: null | string @go(AliasAuthorizationRuleID,*string)

	// The ID of the Service Bus Namespace to replicate to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/servicebus/v1beta1.ServiceBusNamespace
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	partnerNamespaceId?: null | string @go(PartnerNamespaceID,*string)

	// The ID of the primary Service Bus Namespace to replicate. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/servicebus/v1beta1.ServiceBusNamespace
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	primaryNamespaceId?: null | string @go(PrimaryNamespaceID,*string)
}

// NamespaceDisasterRecoveryConfigSpec defines the desired state of NamespaceDisasterRecoveryConfig
#NamespaceDisasterRecoveryConfigSpec: {
	forProvider: #NamespaceDisasterRecoveryConfigParameters @go(ForProvider)

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
	initProvider?: #NamespaceDisasterRecoveryConfigInitParameters @go(InitProvider)
}

// NamespaceDisasterRecoveryConfigStatus defines the observed state of NamespaceDisasterRecoveryConfig.
#NamespaceDisasterRecoveryConfigStatus: {
	atProvider?: #NamespaceDisasterRecoveryConfigObservation @go(AtProvider)
}

// NamespaceDisasterRecoveryConfig is the Schema for the NamespaceDisasterRecoveryConfigs API. Manages a Disaster Recovery Config for a Service Bus Namespace.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#NamespaceDisasterRecoveryConfig: {
	spec:    #NamespaceDisasterRecoveryConfigSpec   @go(Spec)
	status?: #NamespaceDisasterRecoveryConfigStatus @go(Status)
}

// NamespaceDisasterRecoveryConfigList contains a list of NamespaceDisasterRecoveryConfigs
#NamespaceDisasterRecoveryConfigList: {
	items: [...#NamespaceDisasterRecoveryConfig] @go(Items,[]NamespaceDisasterRecoveryConfig)
}