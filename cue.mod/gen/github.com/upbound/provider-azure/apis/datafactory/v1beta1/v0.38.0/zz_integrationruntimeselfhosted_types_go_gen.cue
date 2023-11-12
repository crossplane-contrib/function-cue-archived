// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/datafactory/v1beta1

package v1beta1

#IntegrationRuntimeSelfHostedInitParameters: {
	// Integration runtime description.
	description?: null | string @go(Description,*string)

	// A rbac_authorization block as defined below. Changing this forces a new resource to be created.
	rbacAuthorization?: [...#RbacAuthorizationInitParameters] @go(RbacAuthorization,[]RbacAuthorizationInitParameters)
}

#IntegrationRuntimeSelfHostedObservation: {
	// The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource.
	dataFactoryId?: null | string @go(DataFactoryID,*string)

	// Integration runtime description.
	description?: null | string @go(Description,*string)

	// The ID of the Data Factory.
	id?: null | string @go(ID,*string)

	// The primary integration runtime authentication key.
	primaryAuthorizationKey?: null | string @go(PrimaryAuthorizationKey,*string)

	// A rbac_authorization block as defined below. Changing this forces a new resource to be created.
	rbacAuthorization?: [...#RbacAuthorizationObservation] @go(RbacAuthorization,[]RbacAuthorizationObservation)

	// The secondary integration runtime authentication key.
	secondaryAuthorizationKey?: null | string @go(SecondaryAuthorizationKey,*string)
}

#IntegrationRuntimeSelfHostedParameters: {
	// The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/datafactory/v1beta1.Factory
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dataFactoryId?: null | string @go(DataFactoryID,*string)

	// Integration runtime description.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// A rbac_authorization block as defined below. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	rbacAuthorization?: [...#RbacAuthorizationParameters] @go(RbacAuthorization,[]RbacAuthorizationParameters)
}

#RbacAuthorizationInitParameters: {
	// The resource identifier of the integration runtime to be shared.
	resourceId?: null | string @go(ResourceID,*string)
}

#RbacAuthorizationObservation: {
	// The resource identifier of the integration runtime to be shared.
	resourceId?: null | string @go(ResourceID,*string)
}

#RbacAuthorizationParameters: {
	// The resource identifier of the integration runtime to be shared.
	// +kubebuilder:validation:Optional
	resourceId?: null | string @go(ResourceID,*string)
}

// IntegrationRuntimeSelfHostedSpec defines the desired state of IntegrationRuntimeSelfHosted
#IntegrationRuntimeSelfHostedSpec: {
	forProvider: #IntegrationRuntimeSelfHostedParameters @go(ForProvider)

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
	initProvider?: #IntegrationRuntimeSelfHostedInitParameters @go(InitProvider)
}

// IntegrationRuntimeSelfHostedStatus defines the observed state of IntegrationRuntimeSelfHosted.
#IntegrationRuntimeSelfHostedStatus: {
	atProvider?: #IntegrationRuntimeSelfHostedObservation @go(AtProvider)
}

// IntegrationRuntimeSelfHosted is the Schema for the IntegrationRuntimeSelfHosteds API. Manages a Data Factory Self-hosted Integration Runtime.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#IntegrationRuntimeSelfHosted: {
	spec:    #IntegrationRuntimeSelfHostedSpec   @go(Spec)
	status?: #IntegrationRuntimeSelfHostedStatus @go(Status)
}

// IntegrationRuntimeSelfHostedList contains a list of IntegrationRuntimeSelfHosteds
#IntegrationRuntimeSelfHostedList: {
	items: [...#IntegrationRuntimeSelfHosted] @go(Items,[]IntegrationRuntimeSelfHosted)
}