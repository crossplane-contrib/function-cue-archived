// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/synapse/v1beta1

package v1beta1

#WorkspaceSecurityAlertPolicyInitParameters: {
	// Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action.
	disabledAlerts?: [...null | string] @go(DisabledAlerts,[]*string)

	// Boolean flag which specifies if the alert is sent to the account administrators or not. Defaults to false.
	emailAccountAdminsEnabled?: null | bool @go(EmailAccountAdminsEnabled,*bool)

	// Specifies an array of email addresses to which the alert is sent.
	emailAddresses?: [...null | string] @go(EmailAddresses,[]*string)

	// Specifies the state of the policy, whether it is enabled or disabled or a policy has not been applied yet on the specific workspace. Possible values are Disabled, Enabled and New.
	policyState?: null | string @go(PolicyState,*string)

	// Specifies the number of days to keep in the Threat Detection audit logs. Defaults to 0.
	retentionDays?: null | float64 @go(RetentionDays,*float64)
}

#WorkspaceSecurityAlertPolicyObservation: {
	// Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action.
	disabledAlerts?: [...null | string] @go(DisabledAlerts,[]*string)

	// Boolean flag which specifies if the alert is sent to the account administrators or not. Defaults to false.
	emailAccountAdminsEnabled?: null | bool @go(EmailAccountAdminsEnabled,*bool)

	// Specifies an array of email addresses to which the alert is sent.
	emailAddresses?: [...null | string] @go(EmailAddresses,[]*string)

	// The ID of the Synapse Workspace Security Alert Policy.
	id?: null | string @go(ID,*string)

	// Specifies the state of the policy, whether it is enabled or disabled or a policy has not been applied yet on the specific workspace. Possible values are Disabled, Enabled and New.
	policyState?: null | string @go(PolicyState,*string)

	// Specifies the number of days to keep in the Threat Detection audit logs. Defaults to 0.
	retentionDays?: null | float64 @go(RetentionDays,*float64)

	// Specifies the blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs.
	storageEndpoint?: null | string @go(StorageEndpoint,*string)

	// Specifies the ID of the Synapse Workspace. Changing this forces a new resource to be created.
	synapseWorkspaceId?: null | string @go(SynapseWorkspaceID,*string)
}

#WorkspaceSecurityAlertPolicyParameters: {
	// Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action.
	// +kubebuilder:validation:Optional
	disabledAlerts?: [...null | string] @go(DisabledAlerts,[]*string)

	// Boolean flag which specifies if the alert is sent to the account administrators or not. Defaults to false.
	// +kubebuilder:validation:Optional
	emailAccountAdminsEnabled?: null | bool @go(EmailAccountAdminsEnabled,*bool)

	// Specifies an array of email addresses to which the alert is sent.
	// +kubebuilder:validation:Optional
	emailAddresses?: [...null | string] @go(EmailAddresses,[]*string)

	// Specifies the state of the policy, whether it is enabled or disabled or a policy has not been applied yet on the specific workspace. Possible values are Disabled, Enabled and New.
	// +kubebuilder:validation:Optional
	policyState?: null | string @go(PolicyState,*string)

	// Specifies the number of days to keep in the Threat Detection audit logs. Defaults to 0.
	// +kubebuilder:validation:Optional
	retentionDays?: null | float64 @go(RetentionDays,*float64)

	// Specifies the blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/storage/v1beta1.Account
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("primary_blob_endpoint",true)
	// +kubebuilder:validation:Optional
	storageEndpoint?: null | string @go(StorageEndpoint,*string)

	// Specifies the ID of the Synapse Workspace. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/synapse/v1beta1.Workspace
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	synapseWorkspaceId?: null | string @go(SynapseWorkspaceID,*string)
}

// WorkspaceSecurityAlertPolicySpec defines the desired state of WorkspaceSecurityAlertPolicy
#WorkspaceSecurityAlertPolicySpec: {
	forProvider: #WorkspaceSecurityAlertPolicyParameters @go(ForProvider)

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
	initProvider?: #WorkspaceSecurityAlertPolicyInitParameters @go(InitProvider)
}

// WorkspaceSecurityAlertPolicyStatus defines the observed state of WorkspaceSecurityAlertPolicy.
#WorkspaceSecurityAlertPolicyStatus: {
	atProvider?: #WorkspaceSecurityAlertPolicyObservation @go(AtProvider)
}

// WorkspaceSecurityAlertPolicy is the Schema for the WorkspaceSecurityAlertPolicys API. Manages a Security Alert Policy for a Synapse Workspace.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#WorkspaceSecurityAlertPolicy: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.policyState) || (has(self.initProvider) && has(self.initProvider.policyState))",message="spec.forProvider.policyState is a required parameter"
	spec:    #WorkspaceSecurityAlertPolicySpec   @go(Spec)
	status?: #WorkspaceSecurityAlertPolicyStatus @go(Status)
}

// WorkspaceSecurityAlertPolicyList contains a list of WorkspaceSecurityAlertPolicys
#WorkspaceSecurityAlertPolicyList: {
	items: [...#WorkspaceSecurityAlertPolicy] @go(Items,[]WorkspaceSecurityAlertPolicy)
}