// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/logic/v1beta1

package v1beta1

#AppIntegrationAccountSchemaInitParameters: {
	// The content of the Logic App Integration Account Schema.
	content?: null | string @go(Content,*string)

	// The file name of the Logic App Integration Account Schema.
	fileName?: null | string @go(FileName,*string)

	// The metadata of the Logic App Integration Account Schema.
	metadata?: null | string @go(Metadata,*string)
}

#AppIntegrationAccountSchemaObservation: {
	// The content of the Logic App Integration Account Schema.
	content?: null | string @go(Content,*string)

	// The file name of the Logic App Integration Account Schema.
	fileName?: null | string @go(FileName,*string)

	// The ID of the Logic App Integration Account Schema.
	id?: null | string @go(ID,*string)

	// The name of the Logic App Integration Account. Changing this forces a new Logic App Integration Account Schema to be created.
	integrationAccountName?: null | string @go(IntegrationAccountName,*string)

	// The metadata of the Logic App Integration Account Schema.
	metadata?: null | string @go(Metadata,*string)

	// The name of the Resource Group where the Logic App Integration Account Schema should exist. Changing this forces a new Logic App Integration Account Schema to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#AppIntegrationAccountSchemaParameters: {
	// The content of the Logic App Integration Account Schema.
	// +kubebuilder:validation:Optional
	content?: null | string @go(Content,*string)

	// The file name of the Logic App Integration Account Schema.
	// +kubebuilder:validation:Optional
	fileName?: null | string @go(FileName,*string)

	// The name of the Logic App Integration Account. Changing this forces a new Logic App Integration Account Schema to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/logic/v1beta1.AppIntegrationAccount
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	integrationAccountName?: null | string @go(IntegrationAccountName,*string)

	// The metadata of the Logic App Integration Account Schema.
	// +kubebuilder:validation:Optional
	metadata?: null | string @go(Metadata,*string)

	// The name of the Resource Group where the Logic App Integration Account Schema should exist. Changing this forces a new Logic App Integration Account Schema to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

// AppIntegrationAccountSchemaSpec defines the desired state of AppIntegrationAccountSchema
#AppIntegrationAccountSchemaSpec: {
	forProvider: #AppIntegrationAccountSchemaParameters @go(ForProvider)

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
	initProvider?: #AppIntegrationAccountSchemaInitParameters @go(InitProvider)
}

// AppIntegrationAccountSchemaStatus defines the observed state of AppIntegrationAccountSchema.
#AppIntegrationAccountSchemaStatus: {
	atProvider?: #AppIntegrationAccountSchemaObservation @go(AtProvider)
}

// AppIntegrationAccountSchema is the Schema for the AppIntegrationAccountSchemas API. Manages a Logic App Integration Account Schema.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#AppIntegrationAccountSchema: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.content) || has(self.initProvider.content)",message="content is a required parameter"
	spec:    #AppIntegrationAccountSchemaSpec   @go(Spec)
	status?: #AppIntegrationAccountSchemaStatus @go(Status)
}

// AppIntegrationAccountSchemaList contains a list of AppIntegrationAccountSchemas
#AppIntegrationAccountSchemaList: {
	items: [...#AppIntegrationAccountSchema] @go(Items,[]AppIntegrationAccountSchema)
}