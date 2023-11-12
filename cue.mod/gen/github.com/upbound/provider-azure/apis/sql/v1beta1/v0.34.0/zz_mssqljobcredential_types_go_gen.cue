// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/sql/v1beta1

package v1beta1

#MSSQLJobCredentialObservation: {
	// The ID of the Elastic Job Credential.
	id?: null | string @go(ID,*string)

	// The ID of the Elastic Job Agent. Changing this forces a new Elastic Job Credential to be created.
	jobAgentId?: null | string @go(JobAgentID,*string)

	// The username part of the credential.
	username?: null | string @go(Username,*string)
}

#MSSQLJobCredentialParameters: {
	// The ID of the Elastic Job Agent. Changing this forces a new Elastic Job Credential to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/sql/v1beta1.MSSQLJobAgent
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	jobAgentId?: null | string @go(JobAgentID,*string)

	// The username part of the credential.
	// +kubebuilder:validation:Optional
	username?: null | string @go(Username,*string)
}

// MSSQLJobCredentialSpec defines the desired state of MSSQLJobCredential
#MSSQLJobCredentialSpec: {
	forProvider: #MSSQLJobCredentialParameters @go(ForProvider)
}

// MSSQLJobCredentialStatus defines the observed state of MSSQLJobCredential.
#MSSQLJobCredentialStatus: {
	atProvider?: #MSSQLJobCredentialObservation @go(AtProvider)
}

// MSSQLJobCredential is the Schema for the MSSQLJobCredentials API. Manages an Elastic Job Credential.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#MSSQLJobCredential: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.passwordSecretRef)",message="passwordSecretRef is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.username)",message="username is a required parameter"
	spec:    #MSSQLJobCredentialSpec   @go(Spec)
	status?: #MSSQLJobCredentialStatus @go(Status)
}

// MSSQLJobCredentialList contains a list of MSSQLJobCredentials
#MSSQLJobCredentialList: {
	items: [...#MSSQLJobCredential] @go(Items,[]MSSQLJobCredential)
}