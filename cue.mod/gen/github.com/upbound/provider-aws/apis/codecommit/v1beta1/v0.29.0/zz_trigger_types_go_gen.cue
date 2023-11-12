// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/codecommit/v1beta1

package v1beta1

#TriggerObservation: {
	// System-generated unique identifier.
	configurationId?: null | string @go(ConfigurationID,*string)
	id?:              null | string @go(ID,*string)
}

#TriggerParameters: {
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The name for the repository. This needs to be less than 100 characters.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/codecommit/v1beta1.Repository
	// +kubebuilder:validation:Optional
	repositoryName?: null | string @go(RepositoryName,*string)

	// +kubebuilder:validation:Required
	trigger: [...#TriggerTriggerParameters] @go(Trigger,[]TriggerTriggerParameters)
}

#TriggerTriggerObservation: {
}

#TriggerTriggerParameters: {
	// The branches that will be included in the trigger configuration. If no branches are specified, the trigger will apply to all branches.
	// +kubebuilder:validation:Optional
	branches?: [...null | string] @go(Branches,[]*string)

	// Any custom data associated with the trigger that will be included in the information sent to the target of the trigger.
	// +kubebuilder:validation:Optional
	customData?: null | string @go(CustomData,*string)

	// The ARN of the resource that is the target for a trigger. For example, the ARN of a topic in Amazon Simple Notification Service (SNS).
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/sns/v1beta1.Topic
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	destinationArn?: null | string @go(DestinationArn,*string)

	// The repository events that will cause the trigger to run actions in another service, such as sending a notification through Amazon Simple Notification Service (SNS). If no events are specified, the trigger will run for all repository events. Event types include: all, updateReference, createReference, deleteReference.
	// +kubebuilder:validation:Required
	events: [...null | string] @go(Events,[]*string)

	// The name of the trigger.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)
}

// TriggerSpec defines the desired state of Trigger
#TriggerSpec: {
	forProvider: #TriggerParameters @go(ForProvider)
}

// TriggerStatus defines the observed state of Trigger.
#TriggerStatus: {
	atProvider?: #TriggerObservation @go(AtProvider)
}

// Trigger is the Schema for the Triggers API. Provides a CodeCommit Trigger Resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Trigger: {
	spec:    #TriggerSpec   @go(Spec)
	status?: #TriggerStatus @go(Status)
}

// TriggerList contains a list of Triggers
#TriggerList: {
	items: [...#Trigger] @go(Items,[]Trigger)
}