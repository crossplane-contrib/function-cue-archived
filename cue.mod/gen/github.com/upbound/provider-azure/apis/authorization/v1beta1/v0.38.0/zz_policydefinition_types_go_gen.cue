// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/authorization/v1beta1

package v1beta1

#PolicyDefinitionInitParameters: {
	// The description of the policy definition.
	description?: null | string @go(Description,*string)

	// The display name of the policy definition.
	displayName?: null | string @go(DisplayName,*string)

	// The id of the Management Group where this policy should be defined. Changing this forces a new resource to be created.
	managementGroupId?: null | string @go(ManagementGroupID,*string)

	// The metadata for the policy definition. This is a JSON string representing additional metadata that should be stored with the policy definition.
	metadata?: null | string @go(Metadata,*string)

	// The policy resource manager mode that allows you to specify which resource types will be evaluated. Possible values are All, Indexed, Microsoft.ContainerService.Data, Microsoft.CustomerLockbox.Data, Microsoft.DataCatalog.Data, Microsoft.KeyVault.Data, Microsoft.Kubernetes.Data, Microsoft.MachineLearningServices.Data, Microsoft.Network.Data and Microsoft.Synapse.Data.
	mode?: null | string @go(Mode,*string)

	// Parameters for the policy definition. This field is a JSON string that allows you to parameterize your policy definition.
	parameters?: null | string @go(Parameters,*string)

	// The policy rule for the policy definition. This is a JSON string representing the rule that contains an if and a then block.
	policyRule?: null | string @go(PolicyRule,*string)

	// The policy type. Possible values are BuiltIn, Custom, NotSpecified and Static. Changing this forces a new resource to be created.
	policyType?: null | string @go(PolicyType,*string)
}

#PolicyDefinitionObservation: {
	// The description of the policy definition.
	description?: null | string @go(Description,*string)

	// The display name of the policy definition.
	displayName?: null | string @go(DisplayName,*string)

	// The ID of the Policy Definition.
	id?: null | string @go(ID,*string)

	// The id of the Management Group where this policy should be defined. Changing this forces a new resource to be created.
	managementGroupId?: null | string @go(ManagementGroupID,*string)

	// The metadata for the policy definition. This is a JSON string representing additional metadata that should be stored with the policy definition.
	metadata?: null | string @go(Metadata,*string)

	// The policy resource manager mode that allows you to specify which resource types will be evaluated. Possible values are All, Indexed, Microsoft.ContainerService.Data, Microsoft.CustomerLockbox.Data, Microsoft.DataCatalog.Data, Microsoft.KeyVault.Data, Microsoft.Kubernetes.Data, Microsoft.MachineLearningServices.Data, Microsoft.Network.Data and Microsoft.Synapse.Data.
	mode?: null | string @go(Mode,*string)

	// Parameters for the policy definition. This field is a JSON string that allows you to parameterize your policy definition.
	parameters?: null | string @go(Parameters,*string)

	// The policy rule for the policy definition. This is a JSON string representing the rule that contains an if and a then block.
	policyRule?: null | string @go(PolicyRule,*string)

	// The policy type. Possible values are BuiltIn, Custom, NotSpecified and Static. Changing this forces a new resource to be created.
	policyType?: null | string @go(PolicyType,*string)

	// A list of role definition id extracted from policy_rule required for remediation.
	roleDefinitionIds?: [...null | string] @go(RoleDefinitionIds,[]*string)
}

#PolicyDefinitionParameters: {
	// The description of the policy definition.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The display name of the policy definition.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// The id of the Management Group where this policy should be defined. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	managementGroupId?: null | string @go(ManagementGroupID,*string)

	// The metadata for the policy definition. This is a JSON string representing additional metadata that should be stored with the policy definition.
	// +kubebuilder:validation:Optional
	metadata?: null | string @go(Metadata,*string)

	// The policy resource manager mode that allows you to specify which resource types will be evaluated. Possible values are All, Indexed, Microsoft.ContainerService.Data, Microsoft.CustomerLockbox.Data, Microsoft.DataCatalog.Data, Microsoft.KeyVault.Data, Microsoft.Kubernetes.Data, Microsoft.MachineLearningServices.Data, Microsoft.Network.Data and Microsoft.Synapse.Data.
	// +kubebuilder:validation:Optional
	mode?: null | string @go(Mode,*string)

	// Parameters for the policy definition. This field is a JSON string that allows you to parameterize your policy definition.
	// +kubebuilder:validation:Optional
	parameters?: null | string @go(Parameters,*string)

	// The policy rule for the policy definition. This is a JSON string representing the rule that contains an if and a then block.
	// +kubebuilder:validation:Optional
	policyRule?: null | string @go(PolicyRule,*string)

	// The policy type. Possible values are BuiltIn, Custom, NotSpecified and Static. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	policyType?: null | string @go(PolicyType,*string)
}

// PolicyDefinitionSpec defines the desired state of PolicyDefinition
#PolicyDefinitionSpec: {
	forProvider: #PolicyDefinitionParameters @go(ForProvider)

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
	initProvider?: #PolicyDefinitionInitParameters @go(InitProvider)
}

// PolicyDefinitionStatus defines the observed state of PolicyDefinition.
#PolicyDefinitionStatus: {
	atProvider?: #PolicyDefinitionObservation @go(AtProvider)
}

// PolicyDefinition is the Schema for the PolicyDefinitions API. Manages a policy rule definition. Policy definitions do not take effect until they are assigned to a scope using a Policy Assignment.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#PolicyDefinition: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.displayName) || (has(self.initProvider) && has(self.initProvider.displayName))",message="spec.forProvider.displayName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.mode) || (has(self.initProvider) && has(self.initProvider.mode))",message="spec.forProvider.mode is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.policyType) || (has(self.initProvider) && has(self.initProvider.policyType))",message="spec.forProvider.policyType is a required parameter"
	spec:    #PolicyDefinitionSpec   @go(Spec)
	status?: #PolicyDefinitionStatus @go(Status)
}

// PolicyDefinitionList contains a list of PolicyDefinitions
#PolicyDefinitionList: {
	items: [...#PolicyDefinition] @go(Items,[]PolicyDefinition)
}