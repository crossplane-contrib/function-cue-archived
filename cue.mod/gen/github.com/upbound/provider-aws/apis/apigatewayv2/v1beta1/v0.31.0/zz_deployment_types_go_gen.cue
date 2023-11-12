// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/apigatewayv2/v1beta1

package v1beta1

#DeploymentObservation: {
	// Whether the deployment was automatically released.
	autoDeployed?: null | bool @go(AutoDeployed,*bool)

	// Deployment identifier.
	id?: null | string @go(ID,*string)
}

#DeploymentParameters: {
	// API identifier.
	// +crossplane:generate:reference:type=API
	// +kubebuilder:validation:Optional
	apiId?: null | string @go(APIID,*string)

	// Description for the deployment resource. Must be less than or equal to 1024 characters in length.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// DeploymentSpec defines the desired state of Deployment
#DeploymentSpec: {
	forProvider: #DeploymentParameters @go(ForProvider)
}

// DeploymentStatus defines the observed state of Deployment.
#DeploymentStatus: {
	atProvider?: #DeploymentObservation @go(AtProvider)
}

// Deployment is the Schema for the Deployments API. Manages an Amazon API Gateway Version 2 deployment.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Deployment: {
	spec:    #DeploymentSpec   @go(Spec)
	status?: #DeploymentStatus @go(Status)
}

// DeploymentList contains a list of Deployments
#DeploymentList: {
	items: [...#Deployment] @go(Items,[]Deployment)
}