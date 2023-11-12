// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/sagemaker/v1beta1

package v1beta1

#NotebookInstanceLifecycleConfigurationObservation: {
	// The Amazon Resource Name (ARN) assigned by AWS to this lifecycle configuration.
	arn?: null | string @go(Arn,*string)
	id?:  null | string @go(ID,*string)

	// A shell script (base64-encoded) that runs only once when the SageMaker Notebook Instance is created.
	onCreate?: null | string @go(OnCreate,*string)

	// A shell script (base64-encoded) that runs every time the SageMaker Notebook Instance is started including the time it's created.
	onStart?: null | string @go(OnStart,*string)
}

#NotebookInstanceLifecycleConfigurationParameters: {
	// A shell script (base64-encoded) that runs only once when the SageMaker Notebook Instance is created.
	// +kubebuilder:validation:Optional
	onCreate?: null | string @go(OnCreate,*string)

	// A shell script (base64-encoded) that runs every time the SageMaker Notebook Instance is started including the time it's created.
	// +kubebuilder:validation:Optional
	onStart?: null | string @go(OnStart,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// NotebookInstanceLifecycleConfigurationSpec defines the desired state of NotebookInstanceLifecycleConfiguration
#NotebookInstanceLifecycleConfigurationSpec: {
	forProvider: #NotebookInstanceLifecycleConfigurationParameters @go(ForProvider)
}

// NotebookInstanceLifecycleConfigurationStatus defines the observed state of NotebookInstanceLifecycleConfiguration.
#NotebookInstanceLifecycleConfigurationStatus: {
	atProvider?: #NotebookInstanceLifecycleConfigurationObservation @go(AtProvider)
}

// NotebookInstanceLifecycleConfiguration is the Schema for the NotebookInstanceLifecycleConfigurations API. Provides a lifecycle configuration for SageMaker Notebook Instances.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#NotebookInstanceLifecycleConfiguration: {
	spec:    #NotebookInstanceLifecycleConfigurationSpec   @go(Spec)
	status?: #NotebookInstanceLifecycleConfigurationStatus @go(Status)
}

// NotebookInstanceLifecycleConfigurationList contains a list of NotebookInstanceLifecycleConfigurations
#NotebookInstanceLifecycleConfigurationList: {
	items: [...#NotebookInstanceLifecycleConfiguration] @go(Items,[]NotebookInstanceLifecycleConfiguration)
}