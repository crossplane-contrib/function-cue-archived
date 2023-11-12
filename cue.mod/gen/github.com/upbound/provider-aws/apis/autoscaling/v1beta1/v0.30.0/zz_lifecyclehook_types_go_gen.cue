// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/autoscaling/v1beta1

package v1beta1

#LifecycleHookObservation: {
	id?: null | string @go(ID,*string)
}

#LifecycleHookParameters: {
	// Name of the Auto Scaling group to which you want to assign the lifecycle hook
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/autoscaling/v1beta1.AutoscalingGroup
	// +kubebuilder:validation:Optional
	autoscalingGroupName?: null | string @go(AutoscalingGroupName,*string)

	// Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON. The default value for this parameter is ABANDON.
	// +kubebuilder:validation:Optional
	defaultResult?: null | string @go(DefaultResult,*string)

	// Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter
	// +kubebuilder:validation:Optional
	heartbeatTimeout?: null | float64 @go(HeartbeatTimeout,*float64)

	// Instance state to which you want to attach the lifecycle hook. For a list of lifecycle hook types, see describe-lifecycle-hook-types
	// +kubebuilder:validation:Required
	lifecycleTransition?: null | string @go(LifecycleTransition,*string)

	// Contains additional information that you want to include any time Auto Scaling sends a message to the notification target.
	// +kubebuilder:validation:Optional
	notificationMetadata?: null | string @go(NotificationMetadata,*string)

	// ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic.
	// +kubebuilder:validation:Optional
	notificationTargetArn?: null | string @go(NotificationTargetArn,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	roleArn?: null | string @go(RoleArn,*string)
}

// LifecycleHookSpec defines the desired state of LifecycleHook
#LifecycleHookSpec: {
	forProvider: #LifecycleHookParameters @go(ForProvider)
}

// LifecycleHookStatus defines the observed state of LifecycleHook.
#LifecycleHookStatus: {
	atProvider?: #LifecycleHookObservation @go(AtProvider)
}

// LifecycleHook is the Schema for the LifecycleHooks API. Provides an AutoScaling Lifecycle Hook resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#LifecycleHook: {
	spec:    #LifecycleHookSpec   @go(Spec)
	status?: #LifecycleHookStatus @go(Status)
}

// LifecycleHookList contains a list of LifecycleHooks
#LifecycleHookList: {
	items: [...#LifecycleHook] @go(Items,[]LifecycleHook)
}