// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/route53/v1beta1

package v1beta1

#HealthCheckObservation: {
	// The Amazon Resource Name (ARN) of the Health Check.
	arn?: null | string @go(Arn,*string)

	// The id of the health check
	id?: null | string @go(ID,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#HealthCheckParameters: {
	// The minimum number of child health checks that must be healthy for Route 53 to consider the parent health check to be healthy. Valid values are integers between 0 and 256, inclusive
	// +kubebuilder:validation:Optional
	childHealthThreshold?: null | float64 @go(ChildHealthThreshold,*float64)

	// For a specified parent health check, a list of HealthCheckId values for the associated child health checks.
	// +kubebuilder:validation:Optional
	childHealthchecks?: [...null | string] @go(ChildHealthchecks,[]*string)

	// The name of the CloudWatch alarm.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/cloudwatch/v1beta1.MetricAlarm
	// +kubebuilder:validation:Optional
	cloudwatchAlarmName?: null | string @go(CloudwatchAlarmName,*string)

	// The CloudWatchRegion that the CloudWatch alarm was created in.
	// +kubebuilder:validation:Optional
	cloudwatchAlarmRegion?: null | string @go(CloudwatchAlarmRegion,*string)

	// A boolean value that stops Route 53 from performing health checks. When set to true, Route 53 will do the following depending on the type of health check:
	// +kubebuilder:validation:Optional
	disabled?: null | bool @go(Disabled,*bool)

	// A boolean value that indicates whether Route53 should send the fqdn to the endpoint when performing the health check. This defaults to AWS' defaults: when the type is "HTTPS" enable_sni defaults to true, when type is anything else enable_sni defaults to false.
	// +kubebuilder:validation:Optional
	enableSni?: null | bool @go(EnableSni,*bool)

	// The number of consecutive health checks that an endpoint must pass or fail.
	// +kubebuilder:validation:Optional
	failureThreshold?: null | float64 @go(FailureThreshold,*float64)

	// The fully qualified domain name of the endpoint to be checked.
	// +kubebuilder:validation:Optional
	fqdn?: null | string @go(Fqdn,*string)

	// The IP address of the endpoint to be checked.
	// +kubebuilder:validation:Optional
	ipAddress?: null | string @go(IPAddress,*string)

	// The status of the health check when CloudWatch has insufficient data about the state of associated alarm. Valid values are Healthy , Unhealthy and LastKnownStatus.
	// +kubebuilder:validation:Optional
	insufficientDataHealthStatus?: null | string @go(InsufficientDataHealthStatus,*string)

	// A boolean value that indicates whether the status of health check should be inverted. For example, if a health check is healthy but Inverted is True , then Route 53 considers the health check to be unhealthy.
	// +kubebuilder:validation:Optional
	invertHealthcheck?: null | bool @go(InvertHealthcheck,*bool)

	// A Boolean value that indicates whether you want Route 53 to measure the latency between health checkers in multiple AWS regions and your endpoint and to display CloudWatch latency graphs in the Route 53 console.
	// +kubebuilder:validation:Optional
	measureLatency?: null | bool @go(MeasureLatency,*bool)

	// The port of the endpoint to be checked.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// This is a reference name used in Caller Reference
	// (helpful for identifying single health_check set amongst others)
	// +kubebuilder:validation:Optional
	referenceName?: null | string @go(ReferenceName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// A list of AWS regions that you want Amazon Route 53 health checkers to check the specified endpoint from.
	// +kubebuilder:validation:Optional
	regions?: [...null | string] @go(Regions,[]*string)

	// The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request.
	// +kubebuilder:validation:Optional
	requestInterval?: null | float64 @go(RequestInterval,*float64)

	// The path that you want Amazon Route 53 to request when performing health checks.
	// +kubebuilder:validation:Optional
	resourcePath?: null | string @go(ResourcePath,*string)

	// The Amazon Resource Name (ARN) for the Route 53 Application Recovery Controller routing control. This is used when health check type is RECOVERY_CONTROL
	// +kubebuilder:validation:Optional
	routingControlArn?: null | string @go(RoutingControlArn,*string)

	// String searched in the first 5120 bytes of the response body for check to be considered healthy. Only valid with HTTP_STR_MATCH and HTTPS_STR_MATCH.
	// +kubebuilder:validation:Optional
	searchString?: null | string @go(SearchString,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The protocol to use when performing health checks. Valid values are HTTP, HTTPS, HTTP_STR_MATCH, HTTPS_STR_MATCH, TCP, CALCULATED, CLOUDWATCH_METRIC and RECOVERY_CONTROL.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

// HealthCheckSpec defines the desired state of HealthCheck
#HealthCheckSpec: {
	forProvider: #HealthCheckParameters @go(ForProvider)
}

// HealthCheckStatus defines the observed state of HealthCheck.
#HealthCheckStatus: {
	atProvider?: #HealthCheckObservation @go(AtProvider)
}

// HealthCheck is the Schema for the HealthChecks API. Provides a Route53 health check.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#HealthCheck: {
	spec:    #HealthCheckSpec   @go(Spec)
	status?: #HealthCheckStatus @go(Status)
}

// HealthCheckList contains a list of HealthChecks
#HealthCheckList: {
	items: [...#HealthCheck] @go(Items,[]HealthCheck)
}