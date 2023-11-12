// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/cosmosdb/v1beta1

package v1beta1

#SQLStoredProcedureInitParameters: {
	// The body of the stored procedure.
	body?: null | string @go(Body,*string)
}

#SQLStoredProcedureObservation: {
	// The name of the Cosmos DB Account to create the stored procedure within. Changing this forces a new resource to be created.
	accountName?: null | string @go(AccountName,*string)

	// The body of the stored procedure.
	body?: null | string @go(Body,*string)

	// The name of the Cosmos DB SQL Container to create the stored procedure within. Changing this forces a new resource to be created.
	containerName?: null | string @go(ContainerName,*string)

	// The name of the Cosmos DB SQL Database to create the stored procedure within. Changing this forces a new resource to be created.
	databaseName?: null | string @go(DatabaseName,*string)

	// The ID of the Cosmos DB SQL Stored Procedure.
	id?: null | string @go(ID,*string)

	// The name of the resource group in which the Cosmos DB SQL Database is created. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#SQLStoredProcedureParameters: {
	// The name of the Cosmos DB Account to create the stored procedure within. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=Account
	// +kubebuilder:validation:Optional
	accountName?: null | string @go(AccountName,*string)

	// The body of the stored procedure.
	// +kubebuilder:validation:Optional
	body?: null | string @go(Body,*string)

	// The name of the Cosmos DB SQL Container to create the stored procedure within. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=SQLContainer
	// +kubebuilder:validation:Optional
	containerName?: null | string @go(ContainerName,*string)

	// The name of the Cosmos DB SQL Database to create the stored procedure within. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=SQLDatabase
	// +kubebuilder:validation:Optional
	databaseName?: null | string @go(DatabaseName,*string)

	// The name of the resource group in which the Cosmos DB SQL Database is created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

// SQLStoredProcedureSpec defines the desired state of SQLStoredProcedure
#SQLStoredProcedureSpec: {
	forProvider: #SQLStoredProcedureParameters @go(ForProvider)

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
	initProvider?: #SQLStoredProcedureInitParameters @go(InitProvider)
}

// SQLStoredProcedureStatus defines the observed state of SQLStoredProcedure.
#SQLStoredProcedureStatus: {
	atProvider?: #SQLStoredProcedureObservation @go(AtProvider)
}

// SQLStoredProcedure is the Schema for the SQLStoredProcedures API. Manages a SQL Stored Procedure within a Cosmos DB Account SQL Database.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#SQLStoredProcedure: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.body) || has(self.initProvider.body)",message="body is a required parameter"
	spec:    #SQLStoredProcedureSpec   @go(Spec)
	status?: #SQLStoredProcedureStatus @go(Status)
}

// SQLStoredProcedureList contains a list of SQLStoredProcedures
#SQLStoredProcedureList: {
	items: [...#SQLStoredProcedure] @go(Items,[]SQLStoredProcedure)
}