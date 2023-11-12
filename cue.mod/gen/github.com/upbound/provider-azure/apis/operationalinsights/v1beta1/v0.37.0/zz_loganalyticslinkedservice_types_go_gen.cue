// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/operationalinsights/v1beta1

package v1beta1

#LogAnalyticsLinkedServiceInitParameters: {
	// The ID of the writable Resource that will be linked to the workspace. This should be used for linking to a Log Analytics Cluster resource.
	writeAccessId?: null | string @go(WriteAccessID,*string)
}

#LogAnalyticsLinkedServiceObservation: {
	// The Log Analytics Linked Service ID.
	id?: null | string @go(ID,*string)

	// The generated name of the Linked Service. The format for this attribute is always <workspace name>/<linked service type>(e.g. workspace1/Automation or workspace1/Cluster)
	name?: null | string @go(Name,*string)

	// The ID of the readable Resource that will be linked to the workspace. This should be used for linking to an Automation Account resource.
	readAccessId?: null | string @go(ReadAccessID,*string)

	// The name of the resource group in which the Log Analytics Linked Service is created. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The ID of the Log Analytics Workspace that will contain the Log Analytics Linked Service resource.
	workspaceId?: null | string @go(WorkspaceID,*string)

	// The ID of the writable Resource that will be linked to the workspace. This should be used for linking to a Log Analytics Cluster resource.
	writeAccessId?: null | string @go(WriteAccessID,*string)
}

#LogAnalyticsLinkedServiceParameters: {
	// The ID of the readable Resource that will be linked to the workspace. This should be used for linking to an Automation Account resource.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/automation/v1beta1.Account
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	readAccessId?: null | string @go(ReadAccessID,*string)

	// The name of the resource group in which the Log Analytics Linked Service is created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The ID of the Log Analytics Workspace that will contain the Log Analytics Linked Service resource.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/operationalinsights/v1beta1.Workspace
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	workspaceId?: null | string @go(WorkspaceID,*string)

	// The ID of the writable Resource that will be linked to the workspace. This should be used for linking to a Log Analytics Cluster resource.
	// +kubebuilder:validation:Optional
	writeAccessId?: null | string @go(WriteAccessID,*string)
}

// LogAnalyticsLinkedServiceSpec defines the desired state of LogAnalyticsLinkedService
#LogAnalyticsLinkedServiceSpec: {
	forProvider: #LogAnalyticsLinkedServiceParameters @go(ForProvider)

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
	initProvider?: #LogAnalyticsLinkedServiceInitParameters @go(InitProvider)
}

// LogAnalyticsLinkedServiceStatus defines the observed state of LogAnalyticsLinkedService.
#LogAnalyticsLinkedServiceStatus: {
	atProvider?: #LogAnalyticsLinkedServiceObservation @go(AtProvider)
}

// LogAnalyticsLinkedService is the Schema for the LogAnalyticsLinkedServices API. Manages a Log Analytics Linked Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#LogAnalyticsLinkedService: {
	spec:    #LogAnalyticsLinkedServiceSpec   @go(Spec)
	status?: #LogAnalyticsLinkedServiceStatus @go(Status)
}

// LogAnalyticsLinkedServiceList contains a list of LogAnalyticsLinkedServices
#LogAnalyticsLinkedServiceList: {
	items: [...#LogAnalyticsLinkedService] @go(Items,[]LogAnalyticsLinkedService)
}