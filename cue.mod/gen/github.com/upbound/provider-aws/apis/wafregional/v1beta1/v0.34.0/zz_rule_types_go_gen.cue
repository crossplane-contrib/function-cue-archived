// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/wafregional/v1beta1

package v1beta1

#RuleObservation: {
	// The ARN of the WAF Regional Rule.
	arn?: null | string @go(Arn,*string)

	// The ID of the WAF Regional Rule.
	id?: null | string @go(ID,*string)

	// The name or description for the Amazon CloudWatch metric of this rule.
	metricName?: null | string @go(MetricName,*string)

	// The name or description of the rule.
	name?: null | string @go(Name,*string)

	// The objects to include in a rule (documented below).
	predicate?: [...#RulePredicateObservation] @go(Predicate,[]RulePredicateObservation)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#RuleParameters: {
	// The name or description for the Amazon CloudWatch metric of this rule.
	// +kubebuilder:validation:Optional
	metricName?: null | string @go(MetricName,*string)

	// The name or description of the rule.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The objects to include in a rule (documented below).
	// +kubebuilder:validation:Optional
	predicate?: [...#RulePredicateParameters] @go(Predicate,[]RulePredicateParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#RulePredicateObservation: {
	// The unique identifier of a predicate, such as the ID of a ByteMatchSet or IPSet.
	dataId?: null | string @go(DataID,*string)

	// Whether to use the settings or the negated settings that you specified in the objects.
	negated?: null | bool @go(Negated,*bool)

	// The type of predicate in a rule. Valid values: ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
	type?: null | string @go(Type,*string)
}

#RulePredicateParameters: {
	// The unique identifier of a predicate, such as the ID of a ByteMatchSet or IPSet.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/wafregional/v1beta1.IPSet
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dataId?: null | string @go(DataID,*string)

	// Whether to use the settings or the negated settings that you specified in the objects.
	// +kubebuilder:validation:Required
	negated?: null | bool @go(Negated,*bool)

	// The type of predicate in a rule. Valid values: ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

// RuleSpec defines the desired state of Rule
#RuleSpec: {
	forProvider: #RuleParameters @go(ForProvider)
}

// RuleStatus defines the observed state of Rule.
#RuleStatus: {
	atProvider?: #RuleObservation @go(AtProvider)
}

// Rule is the Schema for the Rules API. Provides an AWS WAF Regional rule resource for use with ALB.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Rule: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.metricName)",message="metricName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #RuleSpec   @go(Spec)
	status?: #RuleStatus @go(Status)
}

// RuleList contains a list of Rules
#RuleList: {
	items: [...#Rule] @go(Items,[]Rule)
}