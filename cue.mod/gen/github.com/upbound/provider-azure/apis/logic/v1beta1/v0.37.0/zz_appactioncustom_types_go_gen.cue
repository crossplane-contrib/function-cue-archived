// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/logic/v1beta1

package v1beta1

#AppActionCustomInitParameters: {
	// Specifies the JSON Blob defining the Body of this Custom Action.
	body?: null | string @go(Body,*string)
}

#AppActionCustomObservation: {
	// Specifies the JSON Blob defining the Body of this Custom Action.
	body?: null | string @go(Body,*string)

	// The ID of the Action within the Logic App Workflow.
	id?: null | string @go(ID,*string)

	// Specifies the ID of the Logic App Workflow. Changing this forces a new resource to be created.
	logicAppId?: null | string @go(LogicAppID,*string)
}

#AppActionCustomParameters: {
	// Specifies the JSON Blob defining the Body of this Custom Action.
	// +kubebuilder:validation:Optional
	body?: null | string @go(Body,*string)

	// Specifies the ID of the Logic App Workflow. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/logic/v1beta1.AppWorkflow
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	logicAppId?: null | string @go(LogicAppID,*string)
}

// AppActionCustomSpec defines the desired state of AppActionCustom
#AppActionCustomSpec: {
	forProvider: #AppActionCustomParameters @go(ForProvider)

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
	initProvider?: #AppActionCustomInitParameters @go(InitProvider)
}

// AppActionCustomStatus defines the observed state of AppActionCustom.
#AppActionCustomStatus: {
	atProvider?: #AppActionCustomObservation @go(AtProvider)
}

// AppActionCustom is the Schema for the AppActionCustoms API. Manages a Custom Action within a Logic App Workflow
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#AppActionCustom: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.body) || (has(self.initProvider) && has(self.initProvider.body))",message="spec.forProvider.body is a required parameter"
	spec:    #AppActionCustomSpec   @go(Spec)
	status?: #AppActionCustomStatus @go(Status)
}

// AppActionCustomList contains a list of AppActionCustoms
#AppActionCustomList: {
	items: [...#AppActionCustom] @go(Items,[]AppActionCustom)
}