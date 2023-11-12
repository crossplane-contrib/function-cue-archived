// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/appautoscaling/v1beta1

package v1beta1

#TargetObservation: {
	id?: null | string @go(ID,*string)
}

#TargetParameters: {
	// Max capacity of the scalable target.
	// +kubebuilder:validation:Required
	maxCapacity?: null | float64 @go(MaxCapacity,*float64)

	// Min capacity of the scalable target.
	// +kubebuilder:validation:Required
	minCapacity?: null | float64 @go(MinCapacity,*float64)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Resource type and unique identifier string for the resource associated with the scaling policy. Documentation can be found in the ResourceId parameter at: AWS Application Auto Scaling API Reference
	// +kubebuilder:validation:Required
	resourceId?: null | string @go(ResourceID,*string)

	// ARN of the IAM role that allows Application AutoScaling to modify your scalable target on your behalf. This defaults to an IAM Service-Linked Role for most services and custom IAM Roles are ignored by the API for those namespaces. See the AWS Application Auto Scaling documentation for more information about how this service interacts with IAM.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	roleArn?: null | string @go(RoleArn,*string)

	// Scalable dimension of the scalable target. Documentation can be found in the ScalableDimension parameter at: AWS Application Auto Scaling API Reference
	// +kubebuilder:validation:Required
	scalableDimension?: null | string @go(ScalableDimension,*string)

	// AWS service namespace of the scalable target. Documentation can be found in the ServiceNamespace parameter at: AWS Application Auto Scaling API Reference
	// +kubebuilder:validation:Required
	serviceNamespace?: null | string @go(ServiceNamespace,*string)
}

// TargetSpec defines the desired state of Target
#TargetSpec: {
	forProvider: #TargetParameters @go(ForProvider)
}

// TargetStatus defines the observed state of Target.
#TargetStatus: {
	atProvider?: #TargetObservation @go(AtProvider)
}

// Target is the Schema for the Targets API. Provides an Application AutoScaling ScalableTarget resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Target: {
	spec:    #TargetSpec   @go(Spec)
	status?: #TargetStatus @go(Status)
}

// TargetList contains a list of Targets
#TargetList: {
	items: [...#Target] @go(Items,[]Target)
}