// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/eventhub/v1beta1

package v1beta1

#NamespaceSchemaGroupInitParameters: {
	// Specifies the compatibility of this schema group. Possible values are None, Backward, Forward. Changing this forces a new resource to be created.
	schemaCompatibility?: null | string @go(SchemaCompatibility,*string)

	// Specifies the Type of this schema group. Possible values are Avro, Unknown. Changing this forces a new resource to be created.
	schemaType?: null | string @go(SchemaType,*string)
}

#NamespaceSchemaGroupObservation: {
	// The ID of the EventHub Namespace Schema Group.
	id?: null | string @go(ID,*string)

	// Specifies the ID of the EventHub Namespace. Changing this forces a new resource to be created.
	namespaceId?: null | string @go(NamespaceID,*string)

	// Specifies the compatibility of this schema group. Possible values are None, Backward, Forward. Changing this forces a new resource to be created.
	schemaCompatibility?: null | string @go(SchemaCompatibility,*string)

	// Specifies the Type of this schema group. Possible values are Avro, Unknown. Changing this forces a new resource to be created.
	schemaType?: null | string @go(SchemaType,*string)
}

#NamespaceSchemaGroupParameters: {
	// Specifies the ID of the EventHub Namespace. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/eventhub/v1beta1.EventHubNamespace
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	namespaceId?: null | string @go(NamespaceID,*string)

	// Specifies the compatibility of this schema group. Possible values are None, Backward, Forward. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	schemaCompatibility?: null | string @go(SchemaCompatibility,*string)

	// Specifies the Type of this schema group. Possible values are Avro, Unknown. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	schemaType?: null | string @go(SchemaType,*string)
}

// NamespaceSchemaGroupSpec defines the desired state of NamespaceSchemaGroup
#NamespaceSchemaGroupSpec: {
	forProvider: #NamespaceSchemaGroupParameters @go(ForProvider)

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
	initProvider?: #NamespaceSchemaGroupInitParameters @go(InitProvider)
}

// NamespaceSchemaGroupStatus defines the observed state of NamespaceSchemaGroup.
#NamespaceSchemaGroupStatus: {
	atProvider?: #NamespaceSchemaGroupObservation @go(AtProvider)
}

// NamespaceSchemaGroup is the Schema for the NamespaceSchemaGroups API. Manages a Schema Group for a EventHub Namespace.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#NamespaceSchemaGroup: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.schemaCompatibility) || (has(self.initProvider) && has(self.initProvider.schemaCompatibility))",message="spec.forProvider.schemaCompatibility is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.schemaType) || (has(self.initProvider) && has(self.initProvider.schemaType))",message="spec.forProvider.schemaType is a required parameter"
	spec:    #NamespaceSchemaGroupSpec   @go(Spec)
	status?: #NamespaceSchemaGroupStatus @go(Status)
}

// NamespaceSchemaGroupList contains a list of NamespaceSchemaGroups
#NamespaceSchemaGroupList: {
	items: [...#NamespaceSchemaGroup] @go(Items,[]NamespaceSchemaGroup)
}