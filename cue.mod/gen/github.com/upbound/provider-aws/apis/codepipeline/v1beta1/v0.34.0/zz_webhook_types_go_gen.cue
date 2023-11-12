// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/codepipeline/v1beta1

package v1beta1

#AuthenticationConfigurationObservation: {
	// A valid CIDR block for IP filtering. Required for IP.
	allowedIpRange?: null | string @go(AllowedIPRange,*string)
}

#AuthenticationConfigurationParameters: {
	// A valid CIDR block for IP filtering. Required for IP.
	// +kubebuilder:validation:Optional
	allowedIpRange?: null | string @go(AllowedIPRange,*string)
}

#FilterObservation: {
	// The JSON path to filter on.
	jsonPath?: null | string @go(JSONPath,*string)

	// The value to match on (e.g., refs/heads/{Branch}). See AWS docs for details.
	matchEquals?: null | string @go(MatchEquals,*string)
}

#FilterParameters: {
	// The JSON path to filter on.
	// +kubebuilder:validation:Required
	jsonPath?: null | string @go(JSONPath,*string)

	// The value to match on (e.g., refs/heads/{Branch}). See AWS docs for details.
	// +kubebuilder:validation:Required
	matchEquals?: null | string @go(MatchEquals,*string)
}

#WebhookObservation: {
	// The CodePipeline webhook's ARN.
	arn?: null | string @go(Arn,*string)

	// The type of authentication  to use. One of IP, GITHUB_HMAC, or UNAUTHENTICATED.
	authentication?: null | string @go(Authentication,*string)

	// An auth block. Required for IP and GITHUB_HMAC. Auth blocks are documented below.
	authenticationConfiguration?: [...#AuthenticationConfigurationObservation] @go(AuthenticationConfiguration,[]AuthenticationConfigurationObservation)

	// One or more filter blocks. Filter blocks are documented below.
	filter?: [...#FilterObservation] @go(Filter,[]FilterObservation)

	// The CodePipeline webhook's ARN.
	id?: null | string @go(ID,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The name of the action in a pipeline you want to connect to the webhook. The action must be from the source (first) stage of the pipeline.
	targetAction?: null | string @go(TargetAction,*string)

	// The name of the pipeline.
	targetPipeline?: null | string @go(TargetPipeline,*string)

	// The CodePipeline webhook's URL. POST events to this endpoint to trigger the target.
	url?: null | string @go(URL,*string)
}

#WebhookParameters: {
	// The type of authentication  to use. One of IP, GITHUB_HMAC, or UNAUTHENTICATED.
	// +kubebuilder:validation:Optional
	authentication?: null | string @go(Authentication,*string)

	// An auth block. Required for IP and GITHUB_HMAC. Auth blocks are documented below.
	// +kubebuilder:validation:Optional
	authenticationConfiguration?: [...#AuthenticationConfigurationParameters] @go(AuthenticationConfiguration,[]AuthenticationConfigurationParameters)

	// One or more filter blocks. Filter blocks are documented below.
	// +kubebuilder:validation:Optional
	filter?: [...#FilterParameters] @go(Filter,[]FilterParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The name of the action in a pipeline you want to connect to the webhook. The action must be from the source (first) stage of the pipeline.
	// +kubebuilder:validation:Optional
	targetAction?: null | string @go(TargetAction,*string)

	// The name of the pipeline.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/codepipeline/v1beta1.Codepipeline
	// +kubebuilder:validation:Optional
	targetPipeline?: null | string @go(TargetPipeline,*string)
}

// WebhookSpec defines the desired state of Webhook
#WebhookSpec: {
	forProvider: #WebhookParameters @go(ForProvider)
}

// WebhookStatus defines the observed state of Webhook.
#WebhookStatus: {
	atProvider?: #WebhookObservation @go(AtProvider)
}

// Webhook is the Schema for the Webhooks API. Provides a CodePipeline Webhook
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Webhook: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.authentication)",message="authentication is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.filter)",message="filter is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.targetAction)",message="targetAction is a required parameter"
	spec:    #WebhookSpec   @go(Spec)
	status?: #WebhookStatus @go(Status)
}

// WebhookList contains a list of Webhooks
#WebhookList: {
	items: [...#Webhook] @go(Items,[]Webhook)
}