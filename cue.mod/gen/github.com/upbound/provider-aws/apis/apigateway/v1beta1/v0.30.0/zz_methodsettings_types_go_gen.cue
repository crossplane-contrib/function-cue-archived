// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/apigateway/v1beta1

package v1beta1

#MethodSettingsObservation: {
	id?: null | string @go(ID,*string)
}

#MethodSettingsParameters: {
	// Method path defined as {resource_path}/{http_method} for an individual method override, or */* for overriding all methods in the stage. Ensure to trim any leading forward slashes in the path (e.g., trimprefix(aws_api_gateway_resource.example.path, "/")).
	// +kubebuilder:validation:Required
	methodPath?: null | string @go(MethodPath,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// ID of the REST API
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/apigateway/v1beta1.RestAPI
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	restApiId?: null | string @go(RestAPIID,*string)

	// Settings block, see below.
	// +kubebuilder:validation:Required
	settings: [...#SettingsParameters] @go(Settings,[]SettingsParameters)

	// Name of the stage
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/apigateway/v1beta1.Stage
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("stage_name",false)
	// +kubebuilder:validation:Optional
	stageName?: null | string @go(StageName,*string)
}

#SettingsObservation: {
}

#SettingsParameters: {
	// Whether the cached responses are encrypted.
	// +kubebuilder:validation:Optional
	cacheDataEncrypted?: null | bool @go(CacheDataEncrypted,*bool)

	// Time to live (TTL), in seconds, for cached responses. The higher the TTL, the longer the response will be cached.
	// +kubebuilder:validation:Optional
	cacheTtlInSeconds?: null | float64 @go(CacheTTLInSeconds,*float64)

	// Whether responses should be cached and returned for requests. A cache cluster must be enabled on the stage for responses to be cached.
	// +kubebuilder:validation:Optional
	cachingEnabled?: null | bool @go(CachingEnabled,*bool)

	// Whether data trace logging is enabled for this method, which effects the log entries pushed to Amazon CloudWatch Logs.
	// +kubebuilder:validation:Optional
	dataTraceEnabled?: null | bool @go(DataTraceEnabled,*bool)

	// Logging level for this method, which effects the log entries pushed to Amazon CloudWatch Logs. The available levels are OFF, ERROR, and INFO.
	// +kubebuilder:validation:Optional
	loggingLevel?: null | string @go(LoggingLevel,*string)

	// Whether Amazon CloudWatch metrics are enabled for this method.
	// +kubebuilder:validation:Optional
	metricsEnabled?: null | bool @go(MetricsEnabled,*bool)

	// Whether authorization is required for a cache invalidation request.
	// +kubebuilder:validation:Optional
	requireAuthorizationForCacheControl?: null | bool @go(RequireAuthorizationForCacheControl,*bool)

	// Throttling burst limit. Default: -1 (throttling disabled).
	// +kubebuilder:validation:Optional
	throttlingBurstLimit?: null | float64 @go(ThrottlingBurstLimit,*float64)

	// Throttling rate limit. Default: -1 (throttling disabled).
	// +kubebuilder:validation:Optional
	throttlingRateLimit?: null | float64 @go(ThrottlingRateLimit,*float64)

	// How to handle unauthorized requests for cache invalidation. The available values are FAIL_WITH_403, SUCCEED_WITH_RESPONSE_HEADER, SUCCEED_WITHOUT_RESPONSE_HEADER.
	// +kubebuilder:validation:Optional
	unauthorizedCacheControlHeaderStrategy?: null | string @go(UnauthorizedCacheControlHeaderStrategy,*string)
}

// MethodSettingsSpec defines the desired state of MethodSettings
#MethodSettingsSpec: {
	forProvider: #MethodSettingsParameters @go(ForProvider)
}

// MethodSettingsStatus defines the observed state of MethodSettings.
#MethodSettingsStatus: {
	atProvider?: #MethodSettingsObservation @go(AtProvider)
}

// MethodSettings is the Schema for the MethodSettingss API. Manages API Gateway Stage Method Settings
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#MethodSettings: {
	spec:    #MethodSettingsSpec   @go(Spec)
	status?: #MethodSettingsStatus @go(Status)
}

// MethodSettingsList contains a list of MethodSettingss
#MethodSettingsList: {
	items: [...#MethodSettings] @go(Items,[]MethodSettings)
}