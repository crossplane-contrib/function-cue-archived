// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/xray/v1beta1

package v1beta1

#GroupObservation: {
	// The ARN of the Group.
	arn?: null | string @go(Arn,*string)

	// The ARN of the Group.
	id?: null | string @go(ID,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#GroupParameters: {
	// The filter expression defining criteria by which to group traces. more info can be found in official docs.
	// +kubebuilder:validation:Required
	filterExpression?: null | string @go(FilterExpression,*string)

	// The name of the group.
	// +kubebuilder:validation:Required
	groupName?: null | string @go(GroupName,*string)

	// Configuration options for enabling insights.
	// +kubebuilder:validation:Optional
	insightsConfiguration?: [...#InsightsConfigurationParameters] @go(InsightsConfiguration,[]InsightsConfigurationParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#InsightsConfigurationObservation: {
}

#InsightsConfigurationParameters: {
	// Specifies whether insights are enabled.
	// +kubebuilder:validation:Required
	insightsEnabled?: null | bool @go(InsightsEnabled,*bool)

	// Specifies whether insight notifications are enabled.
	// +kubebuilder:validation:Optional
	notificationsEnabled?: null | bool @go(NotificationsEnabled,*bool)
}

// GroupSpec defines the desired state of Group
#GroupSpec: {
	forProvider: #GroupParameters @go(ForProvider)
}

// GroupStatus defines the observed state of Group.
#GroupStatus: {
	atProvider?: #GroupObservation @go(AtProvider)
}

// Group is the Schema for the Groups API. Creates and manages an AWS XRay Group.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Group: {
	spec:    #GroupSpec   @go(Spec)
	status?: #GroupStatus @go(Status)
}

// GroupList contains a list of Groups
#GroupList: {
	items: [...#Group] @go(Items,[]Group)
}