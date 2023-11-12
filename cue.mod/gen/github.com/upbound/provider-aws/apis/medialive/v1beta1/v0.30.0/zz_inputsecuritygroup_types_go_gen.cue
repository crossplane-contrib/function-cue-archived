// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/medialive/v1beta1

package v1beta1

#InputSecurityGroupObservation: {
	// ARN of the InputSecurityGroup.
	arn?: null | string @go(Arn,*string)

	// InputSecurityGroup Id.
	id?: null | string @go(ID,*string)

	// The list of inputs currently using this InputSecurityGroup.
	inputs?: [...null | string] @go(Inputs,[]*string)
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#InputSecurityGroupParameters: {
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Whitelist rules. See Whitelist Rules for more details.
	// +kubebuilder:validation:Required
	whitelistRules: [...#WhitelistRulesParameters] @go(WhitelistRules,[]WhitelistRulesParameters)
}

#WhitelistRulesObservation: {
}

#WhitelistRulesParameters: {
	// The IPv4 CIDR that's whitelisted.
	// +kubebuilder:validation:Required
	cidr?: null | string @go(Cidr,*string)
}

// InputSecurityGroupSpec defines the desired state of InputSecurityGroup
#InputSecurityGroupSpec: {
	forProvider: #InputSecurityGroupParameters @go(ForProvider)
}

// InputSecurityGroupStatus defines the observed state of InputSecurityGroup.
#InputSecurityGroupStatus: {
	atProvider?: #InputSecurityGroupObservation @go(AtProvider)
}

// InputSecurityGroup is the Schema for the InputSecurityGroups API.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#InputSecurityGroup: {
	spec:    #InputSecurityGroupSpec   @go(Spec)
	status?: #InputSecurityGroupStatus @go(Status)
}

// InputSecurityGroupList contains a list of InputSecurityGroups
#InputSecurityGroupList: {
	items: [...#InputSecurityGroup] @go(Items,[]InputSecurityGroup)
}