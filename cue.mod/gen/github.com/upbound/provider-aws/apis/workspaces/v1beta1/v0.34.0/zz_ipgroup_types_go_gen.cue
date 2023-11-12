// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/workspaces/v1beta1

package v1beta1

#IPGroupObservation: {
	// The description of the IP group.
	description?: null | string @go(Description,*string)

	// The IP group identifier.
	id?: null | string @go(ID,*string)

	// The name of the IP group.
	name?: null | string @go(Name,*string)

	// One or more pairs specifying the IP group rule (in CIDR format) from which web requests originate.
	rules?: [...#RulesObservation] @go(Rules,[]RulesObservation)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#IPGroupParameters: {
	// The description of the IP group.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The name of the IP group.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// One or more pairs specifying the IP group rule (in CIDR format) from which web requests originate.
	// +kubebuilder:validation:Optional
	rules?: [...#RulesParameters] @go(Rules,[]RulesParameters)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#RulesObservation: {
	// The description of the IP group.
	description?: null | string @go(Description,*string)

	// The IP address range, in CIDR notation, e.g., 10.0.0.0/16
	source?: null | string @go(Source,*string)
}

#RulesParameters: {
	// The description of the IP group.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The IP address range, in CIDR notation, e.g., 10.0.0.0/16
	// +kubebuilder:validation:Required
	source?: null | string @go(Source,*string)
}

// IPGroupSpec defines the desired state of IPGroup
#IPGroupSpec: {
	forProvider: #IPGroupParameters @go(ForProvider)
}

// IPGroupStatus defines the observed state of IPGroup.
#IPGroupStatus: {
	atProvider?: #IPGroupObservation @go(AtProvider)
}

// IPGroup is the Schema for the IPGroups API. Provides an IP access control group in AWS WorkSpaces Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#IPGroup: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #IPGroupSpec   @go(Spec)
	status?: #IPGroupStatus @go(Status)
}

// IPGroupList contains a list of IPGroups
#IPGroupList: {
	items: [...#IPGroup] @go(Items,[]IPGroup)
}