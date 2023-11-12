// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/xray/v1beta1

package v1beta1

#SamplingRuleObservation: {
	// The ARN of the sampling rule.
	arn?: null | string @go(Arn,*string)

	// The name of the sampling rule.
	id?: null | string @go(ID,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#SamplingRuleParameters: {
	// Matches attributes derived from the request.
	// +kubebuilder:validation:Optional
	attributes?: {[string]: null | string} @go(Attributes,map[string]*string)

	// The percentage of matching requests to instrument, after the reservoir is exhausted.
	// +kubebuilder:validation:Required
	fixedRate?: null | float64 @go(FixedRate,*float64)

	// Matches the HTTP method of a request.
	// +kubebuilder:validation:Required
	httpMethod?: null | string @go(HTTPMethod,*string)

	// Matches the hostname from a request URL.
	// +kubebuilder:validation:Required
	host?: null | string @go(Host,*string)

	// The priority of the sampling rule.
	// +kubebuilder:validation:Required
	priority?: null | float64 @go(Priority,*float64)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// A fixed number of matching requests to instrument per second, prior to applying the fixed rate. The reservoir is not used directly by services, but applies to all services using the rule collectively.
	// +kubebuilder:validation:Required
	reservoirSize?: null | float64 @go(ReservoirSize,*float64)

	// Matches the ARN of the AWS resource on which the service runs.
	// +kubebuilder:validation:Required
	resourceArn?: null | string @go(ResourceArn,*string)

	// Matches the name that the service uses to identify itself in segments.
	// +kubebuilder:validation:Required
	serviceName?: null | string @go(ServiceName,*string)

	// Matches the origin that the service uses to identify its type in segments.
	// +kubebuilder:validation:Required
	serviceType?: null | string @go(ServiceType,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Matches the path from a request URL.
	// +kubebuilder:validation:Required
	urlPath?: null | string @go(URLPath,*string)

	// The version of the sampling rule format (1 )
	// +kubebuilder:validation:Required
	version?: null | float64 @go(Version,*float64)
}

// SamplingRuleSpec defines the desired state of SamplingRule
#SamplingRuleSpec: {
	forProvider: #SamplingRuleParameters @go(ForProvider)
}

// SamplingRuleStatus defines the observed state of SamplingRule.
#SamplingRuleStatus: {
	atProvider?: #SamplingRuleObservation @go(AtProvider)
}

// SamplingRule is the Schema for the SamplingRules API. Creates and manages an AWS XRay Sampling Rule.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#SamplingRule: {
	spec:    #SamplingRuleSpec   @go(Spec)
	status?: #SamplingRuleStatus @go(Status)
}

// SamplingRuleList contains a list of SamplingRules
#SamplingRuleList: {
	items: [...#SamplingRule] @go(Items,[]SamplingRule)
}