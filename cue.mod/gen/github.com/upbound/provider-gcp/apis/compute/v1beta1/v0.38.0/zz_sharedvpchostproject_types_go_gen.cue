// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

#SharedVPCHostProjectInitParameters: {
}

#SharedVPCHostProjectObservation: {
	// an identifier for the resource with format {{project}}
	id?: null | string @go(ID,*string)

	// The ID of the project that will serve as a Shared VPC host project
	project?: null | string @go(Project,*string)
}

#SharedVPCHostProjectParameters: {
	// The ID of the project that will serve as a Shared VPC host project
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1.Project
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.ExtractProjectID()
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// SharedVPCHostProjectSpec defines the desired state of SharedVPCHostProject
#SharedVPCHostProjectSpec: {
	forProvider: #SharedVPCHostProjectParameters @go(ForProvider)

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
	initProvider?: #SharedVPCHostProjectInitParameters @go(InitProvider)
}

// SharedVPCHostProjectStatus defines the observed state of SharedVPCHostProject.
#SharedVPCHostProjectStatus: {
	atProvider?: #SharedVPCHostProjectObservation @go(AtProvider)
}

// SharedVPCHostProject is the Schema for the SharedVPCHostProjects API. Enables the Google Compute Engine Shared VPC feature for a project, assigning it as a host project.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#SharedVPCHostProject: {
	spec:    #SharedVPCHostProjectSpec   @go(Spec)
	status?: #SharedVPCHostProjectStatus @go(Status)
}

// SharedVPCHostProjectList contains a list of SharedVPCHostProjects
#SharedVPCHostProjectList: {
	items: [...#SharedVPCHostProject] @go(Items,[]SharedVPCHostProject)
}