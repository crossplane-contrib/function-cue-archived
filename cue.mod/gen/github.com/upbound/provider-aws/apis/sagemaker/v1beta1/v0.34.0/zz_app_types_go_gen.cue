// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/sagemaker/v1beta1

package v1beta1

#AppObservation: {
	// The name of the app.
	appName?: null | string @go(AppName,*string)

	// The type of app. Valid values are JupyterServer, KernelGateway, RStudioServerPro, RSessionGateway and TensorBoard.
	appType?: null | string @go(AppType,*string)

	// The Amazon Resource Name (ARN) of the app.
	arn?: null | string @go(Arn,*string)

	// The domain ID.
	domainId?: null | string @go(DomainID,*string)

	// The Amazon Resource Name (ARN) of the app.
	id?: null | string @go(ID,*string)

	// The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.See Resource Spec below.
	resourceSpec?: [...#ResourceSpecObservation] @go(ResourceSpec,[]ResourceSpecObservation)

	// The name of the space. At least on of user_profile_name or space_name required.
	spaceName?: null | string @go(SpaceName,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The user profile name. At least on of user_profile_name or space_name required.
	userProfileName?: null | string @go(UserProfileName,*string)
}

#AppParameters: {
	// The name of the app.
	// +kubebuilder:validation:Optional
	appName?: null | string @go(AppName,*string)

	// The type of app. Valid values are JupyterServer, KernelGateway, RStudioServerPro, RSessionGateway and TensorBoard.
	// +kubebuilder:validation:Optional
	appType?: null | string @go(AppType,*string)

	// The domain ID.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/sagemaker/v1beta1.Domain
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	domainId?: null | string @go(DomainID,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.See Resource Spec below.
	// +kubebuilder:validation:Optional
	resourceSpec?: [...#ResourceSpecParameters] @go(ResourceSpec,[]ResourceSpecParameters)

	// The name of the space. At least on of user_profile_name or space_name required.
	// +kubebuilder:validation:Optional
	spaceName?: null | string @go(SpaceName,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The user profile name. At least on of user_profile_name or space_name required.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/sagemaker/v1beta1.UserProfile
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("user_profile_name",false)
	// +kubebuilder:validation:Optional
	userProfileName?: null | string @go(UserProfileName,*string)
}

#ResourceSpecObservation: {
	// The instance type that the image version runs on. For valid values see SageMaker Instance Types.
	instanceType?: null | string @go(InstanceType,*string)

	// The Amazon Resource Name (ARN) of the Lifecycle Configuration attached to the Resource.
	lifecycleConfigArn?: null | string @go(LifecycleConfigArn,*string)

	// The ARN of the SageMaker image that the image version belongs to.
	sagemakerImageArn?: null | string @go(SagemakerImageArn,*string)

	// The ARN of the image version created on the instance.
	sagemakerImageVersionArn?: null | string @go(SagemakerImageVersionArn,*string)
}

#ResourceSpecParameters: {
	// The instance type that the image version runs on. For valid values see SageMaker Instance Types.
	// +kubebuilder:validation:Optional
	instanceType?: null | string @go(InstanceType,*string)

	// The Amazon Resource Name (ARN) of the Lifecycle Configuration attached to the Resource.
	// +kubebuilder:validation:Optional
	lifecycleConfigArn?: null | string @go(LifecycleConfigArn,*string)

	// The ARN of the SageMaker image that the image version belongs to.
	// +kubebuilder:validation:Optional
	sagemakerImageArn?: null | string @go(SagemakerImageArn,*string)

	// The ARN of the image version created on the instance.
	// +kubebuilder:validation:Optional
	sagemakerImageVersionArn?: null | string @go(SagemakerImageVersionArn,*string)
}

// AppSpec defines the desired state of App
#AppSpec: {
	forProvider: #AppParameters @go(ForProvider)
}

// AppStatus defines the observed state of App.
#AppStatus: {
	atProvider?: #AppObservation @go(AtProvider)
}

// App is the Schema for the Apps API. Provides a SageMaker App resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#App: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.appName)",message="appName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.appType)",message="appType is a required parameter"
	spec:    #AppSpec   @go(Spec)
	status?: #AppStatus @go(Status)
}

// AppList contains a list of Apps
#AppList: {
	items: [...#App] @go(Items,[]App)
}