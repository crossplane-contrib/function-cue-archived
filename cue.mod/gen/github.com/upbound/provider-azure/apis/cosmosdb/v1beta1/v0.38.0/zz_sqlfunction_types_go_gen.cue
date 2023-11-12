// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/cosmosdb/v1beta1

package v1beta1

#SQLFunctionInitParameters: {
	// Body of the User Defined Function.
	body?: null | string @go(Body,*string)
}

#SQLFunctionObservation: {
	// Body of the User Defined Function.
	body?: null | string @go(Body,*string)

	// The id of the Cosmos DB SQL Container to create the SQL User Defined Function within. Changing this forces a new SQL User Defined Function to be created.
	containerId?: null | string @go(ContainerID,*string)

	// The ID of the SQL User Defined Function.
	id?: null | string @go(ID,*string)
}

#SQLFunctionParameters: {
	// Body of the User Defined Function.
	// +kubebuilder:validation:Optional
	body?: null | string @go(Body,*string)

	// The id of the Cosmos DB SQL Container to create the SQL User Defined Function within. Changing this forces a new SQL User Defined Function to be created.
	// +crossplane:generate:reference:type=SQLContainer
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	containerId?: null | string @go(ContainerID,*string)
}

// SQLFunctionSpec defines the desired state of SQLFunction
#SQLFunctionSpec: {
	forProvider: #SQLFunctionParameters @go(ForProvider)

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
	initProvider?: #SQLFunctionInitParameters @go(InitProvider)
}

// SQLFunctionStatus defines the observed state of SQLFunction.
#SQLFunctionStatus: {
	atProvider?: #SQLFunctionObservation @go(AtProvider)
}

// SQLFunction is the Schema for the SQLFunctions API. Manages an SQL User Defined Function.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#SQLFunction: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.body) || (has(self.initProvider) && has(self.initProvider.body))",message="spec.forProvider.body is a required parameter"
	spec:    #SQLFunctionSpec   @go(Spec)
	status?: #SQLFunctionStatus @go(Status)
}

// SQLFunctionList contains a list of SQLFunctions
#SQLFunctionList: {
	items: [...#SQLFunction] @go(Items,[]SQLFunction)
}