// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/automation/v1beta1

package v1beta1

#CredentialInitParameters: {
	// The description associated with this Automation Credential.
	description?: null | string @go(Description,*string)

	// The username associated with this Automation Credential.
	username?: null | string @go(Username,*string)
}

#CredentialObservation: {
	// The name of the automation account in which the Credential is created. Changing this forces a new resource to be created.
	automationAccountName?: null | string @go(AutomationAccountName,*string)

	// The description associated with this Automation Credential.
	description?: null | string @go(Description,*string)

	// The ID of the Automation Credential.
	id?: null | string @go(ID,*string)

	// The name of the resource group in which the Credential is created. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The username associated with this Automation Credential.
	username?: null | string @go(Username,*string)
}

#CredentialParameters: {
	// The name of the automation account in which the Credential is created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/automation/v1beta1.Account
	// +kubebuilder:validation:Optional
	automationAccountName?: null | string @go(AutomationAccountName,*string)

	// The description associated with this Automation Credential.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The name of the resource group in which the Credential is created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The username associated with this Automation Credential.
	// +kubebuilder:validation:Optional
	username?: null | string @go(Username,*string)
}

// CredentialSpec defines the desired state of Credential
#CredentialSpec: {
	forProvider: #CredentialParameters @go(ForProvider)

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
	initProvider?: #CredentialInitParameters @go(InitProvider)
}

// CredentialStatus defines the observed state of Credential.
#CredentialStatus: {
	atProvider?: #CredentialObservation @go(AtProvider)
}

// Credential is the Schema for the Credentials API. Manages a Automation Credential.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Credential: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.passwordSecretRef)",message="spec.forProvider.passwordSecretRef is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.username) || (has(self.initProvider) && has(self.initProvider.username))",message="spec.forProvider.username is a required parameter"
	spec:    #CredentialSpec   @go(Spec)
	status?: #CredentialStatus @go(Status)
}

// CredentialList contains a list of Credentials
#CredentialList: {
	items: [...#Credential] @go(Items,[]Credential)
}