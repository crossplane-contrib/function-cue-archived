// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/automation/v1beta1

package v1beta1

#ConnectionTypeObservation: {
	// The name of the automation account in which the Connection is created. Changing this forces a new resource to be created.
	automationAccountName?: null | string @go(AutomationAccountName,*string)

	// One or more field blocks as defined below. Changing this forces a new Automation to be created.
	field?: [...#FieldObservation] @go(Field,[]FieldObservation)

	// The the Automation Connection Type ID.
	id?: null | string @go(ID,*string)

	// Whether the connection type is global. Changing this forces a new Automation to be created.
	isGlobal?: null | bool @go(IsGlobal,*bool)

	// The name which should be used for this Automation Connection Type. Changing this forces a new Automation to be created.
	name?: null | string @go(Name,*string)

	// The name of the Resource Group where the Automation should exist. Changing this forces a new Automation to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#ConnectionTypeParameters: {
	// The name of the automation account in which the Connection is created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/automation/v1beta1.Account
	// +kubebuilder:validation:Optional
	automationAccountName?: null | string @go(AutomationAccountName,*string)

	// One or more field blocks as defined below. Changing this forces a new Automation to be created.
	// +kubebuilder:validation:Optional
	field?: [...#FieldParameters] @go(Field,[]FieldParameters)

	// Whether the connection type is global. Changing this forces a new Automation to be created.
	// +kubebuilder:validation:Optional
	isGlobal?: null | bool @go(IsGlobal,*bool)

	// The name which should be used for this Automation Connection Type. Changing this forces a new Automation to be created.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The name of the Resource Group where the Automation should exist. Changing this forces a new Automation to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#FieldObservation: {
	// Whether to set the isEncrypted flag of the connection field definition.
	isEncrypted?: null | bool @go(IsEncrypted,*bool)

	// Whether to set the isOptional flag of the connection field definition.
	isOptional?: null | bool @go(IsOptional,*bool)

	// The name which should be used for this connection field definition.
	name?: null | string @go(Name,*string)

	// The type of the connection field definition.
	type?: null | string @go(Type,*string)
}

#FieldParameters: {
	// Whether to set the isEncrypted flag of the connection field definition.
	// +kubebuilder:validation:Optional
	isEncrypted?: null | bool @go(IsEncrypted,*bool)

	// Whether to set the isOptional flag of the connection field definition.
	// +kubebuilder:validation:Optional
	isOptional?: null | bool @go(IsOptional,*bool)

	// The name which should be used for this connection field definition.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The type of the connection field definition.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

// ConnectionTypeSpec defines the desired state of ConnectionType
#ConnectionTypeSpec: {
	forProvider: #ConnectionTypeParameters @go(ForProvider)
}

// ConnectionTypeStatus defines the observed state of ConnectionType.
#ConnectionTypeStatus: {
	atProvider?: #ConnectionTypeObservation @go(AtProvider)
}

// ConnectionType is the Schema for the ConnectionTypes API. Manages an Automation Connection Type.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#ConnectionType: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.field)",message="field is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #ConnectionTypeSpec   @go(Spec)
	status?: #ConnectionTypeStatus @go(Status)
}

// ConnectionTypeList contains a list of ConnectionTypes
#ConnectionTypeList: {
	items: [...#ConnectionType] @go(Items,[]ConnectionType)
}