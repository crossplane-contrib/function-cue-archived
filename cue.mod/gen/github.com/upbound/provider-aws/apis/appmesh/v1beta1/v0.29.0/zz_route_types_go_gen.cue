// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/appmesh/v1beta1

package v1beta1

#ActionWeightedTargetObservation: {
}

#ActionWeightedTargetParameters: {
	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// Virtual node to associate with the weighted target. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	virtualNode?: null | string @go(VirtualNode,*string)

	// Relative weight of the weighted target. An integer between 0 and 100.
	// +kubebuilder:validation:Required
	weight?: null | float64 @go(Weight,*float64)
}

#GRPCRouteActionObservation: {
}

#GRPCRouteActionParameters: {
	// Targets that traffic is routed to when a request matches the route.
	// You can specify one or more targets and their relative weights with which to distribute traffic.
	// +kubebuilder:validation:Required
	weightedTarget: [...#WeightedTargetParameters] @go(WeightedTarget,[]WeightedTargetParameters)
}

#GRPCRouteMatchObservation: {
}

#GRPCRouteMatchParameters: {
	// Data to match from the gRPC request.
	// +kubebuilder:validation:Optional
	metadata?: [...#MetadataParameters] @go(Metadata,[]MetadataParameters)

	// Method name to match from the request. If you specify a name, you must also specify a service_name.
	// +kubebuilder:validation:Optional
	methodName?: null | string @go(MethodName,*string)

	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// Value sent by the client must begin with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Fully qualified domain name for the service to match from the request.
	// +kubebuilder:validation:Optional
	serviceName?: null | string @go(ServiceName,*string)
}

#HTTPRouteActionWeightedTargetObservation: {
}

#HTTPRouteActionWeightedTargetParameters: {
	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// Virtual node to associate with the weighted target. Must be between 1 and 255 characters in length.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/appmesh/v1beta1.VirtualNode
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	virtualNode?: null | string @go(VirtualNode,*string)

	// Relative weight of the weighted target. An integer between 0 and 100.
	// +kubebuilder:validation:Required
	weight?: null | float64 @go(Weight,*float64)
}

#HTTPRouteRetryPolicyObservation: {
}

#HTTPRouteRetryPolicyParameters: {
	// List of HTTP retry events.
	// Valid values: client-error (HTTP status code 409), gateway-error (HTTP status codes 502, 503, and 504), server-error (HTTP status codes 500, 501, 502, 503, 504, 505, 506, 507, 508, 510, and 511), stream-error (retry on refused stream).
	// +kubebuilder:validation:Optional
	httpRetryEvents?: [...null | string] @go(HTTPRetryEvents,[]*string)

	// Maximum number of retries.
	// +kubebuilder:validation:Required
	maxRetries?: null | float64 @go(MaxRetries,*float64)

	// Per-retry timeout.
	// +kubebuilder:validation:Required
	perRetryTimeout: [...#HTTPRouteRetryPolicyPerRetryTimeoutParameters] @go(PerRetryTimeout,[]HTTPRouteRetryPolicyPerRetryTimeoutParameters)

	// List of TCP retry events. The only valid value is connection-error.
	// +kubebuilder:validation:Optional
	tcpRetryEvents?: [...null | string] @go(TCPRetryEvents,[]*string)
}

#HTTPRouteRetryPolicyPerRetryTimeoutObservation: {
}

#HTTPRouteRetryPolicyPerRetryTimeoutParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#HTTPRouteTimeoutIdleObservation: {
}

#HTTPRouteTimeoutIdleParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#HTTPRouteTimeoutObservation: {
}

#HTTPRouteTimeoutParameters: {
	// Idle timeout. An idle timeout bounds the amount of time that a connection may be idle.
	// +kubebuilder:validation:Optional
	idle?: [...#HTTPRouteTimeoutIdleParameters] @go(Idle,[]HTTPRouteTimeoutIdleParameters)

	// Per request timeout.
	// +kubebuilder:validation:Optional
	perRequest?: [...#HTTPRouteTimeoutPerRequestParameters] @go(PerRequest,[]HTTPRouteTimeoutPerRequestParameters)
}

#HTTPRouteTimeoutPerRequestObservation: {
}

#HTTPRouteTimeoutPerRequestParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#HeaderMatchObservation: {
}

#HeaderMatchParameters: {
	// Value sent by the client must match the specified value exactly. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	exact?: null | string @go(Exact,*string)

	// Value sent by the client must begin with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Object that specifies the range of numbers that the value sent by the client must be included in.
	// +kubebuilder:validation:Optional
	range?: [...#MatchRangeParameters] @go(Range,[]MatchRangeParameters)

	// Value sent by the client must include the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	regex?: null | string @go(Regex,*string)

	// Value sent by the client must end with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	suffix?: null | string @go(Suffix,*string)
}

#HeaderMatchRangeObservation: {
}

#HeaderMatchRangeParameters: {
	// End of the range.
	// +kubebuilder:validation:Required
	end?: null | float64 @go(End,*float64)

	// (Requited) Start of the range.
	// +kubebuilder:validation:Required
	start?: null | float64 @go(Start,*float64)
}

#HeaderObservation: {
}

#HeaderParameters: {
	// If true, the match is on the opposite of the match criteria. Default is false.
	// +kubebuilder:validation:Optional
	invert?: null | bool @go(Invert,*bool)

	// Criteria for determining an gRPC request match.
	// +kubebuilder:validation:Optional
	match?: [...#HeaderMatchParameters] @go(Match,[]HeaderMatchParameters)

	// Name to use for the route. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)
}

#Http2RouteRetryPolicyObservation: {
}

#Http2RouteRetryPolicyParameters: {
	// List of HTTP retry events.
	// Valid values: client-error (HTTP status code 409), gateway-error (HTTP status codes 502, 503, and 504), server-error (HTTP status codes 500, 501, 502, 503, 504, 505, 506, 507, 508, 510, and 511), stream-error (retry on refused stream).
	// +kubebuilder:validation:Optional
	httpRetryEvents?: [...null | string] @go(HTTPRetryEvents,[]*string)

	// Maximum number of retries.
	// +kubebuilder:validation:Required
	maxRetries?: null | float64 @go(MaxRetries,*float64)

	// Per-retry timeout.
	// +kubebuilder:validation:Required
	perRetryTimeout: [...#RetryPolicyPerRetryTimeoutParameters] @go(PerRetryTimeout,[]RetryPolicyPerRetryTimeoutParameters)

	// List of TCP retry events. The only valid value is connection-error.
	// +kubebuilder:validation:Optional
	tcpRetryEvents?: [...null | string] @go(TCPRetryEvents,[]*string)
}

#Http2RouteTimeoutObservation: {
}

#Http2RouteTimeoutParameters: {
	// Idle timeout. An idle timeout bounds the amount of time that a connection may be idle.
	// +kubebuilder:validation:Optional
	idle?: [...#TimeoutIdleParameters] @go(Idle,[]TimeoutIdleParameters)

	// Per request timeout.
	// +kubebuilder:validation:Optional
	perRequest?: [...#TimeoutPerRequestParameters] @go(PerRequest,[]TimeoutPerRequestParameters)
}

#IdleObservation: {
}

#IdleParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#MatchHeaderMatchObservation: {
}

#MatchHeaderMatchParameters: {
	// Value sent by the client must match the specified value exactly. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	exact?: null | string @go(Exact,*string)

	// Value sent by the client must begin with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Object that specifies the range of numbers that the value sent by the client must be included in.
	// +kubebuilder:validation:Optional
	range?: [...#HeaderMatchRangeParameters] @go(Range,[]HeaderMatchRangeParameters)

	// Value sent by the client must include the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	regex?: null | string @go(Regex,*string)

	// Value sent by the client must end with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	suffix?: null | string @go(Suffix,*string)
}

#MatchHeaderObservation: {
}

#MatchHeaderParameters: {
	// If true, the match is on the opposite of the match criteria. Default is false.
	// +kubebuilder:validation:Optional
	invert?: null | bool @go(Invert,*bool)

	// Criteria for determining an gRPC request match.
	// +kubebuilder:validation:Optional
	match?: [...#MatchHeaderMatchParameters] @go(Match,[]MatchHeaderMatchParameters)

	// Name to use for the route. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)
}

#MatchRangeObservation: {
}

#MatchRangeParameters: {
	// End of the range.
	// +kubebuilder:validation:Required
	end?: null | float64 @go(End,*float64)

	// (Requited) Start of the range.
	// +kubebuilder:validation:Required
	start?: null | float64 @go(Start,*float64)
}

#MetadataMatchObservation: {
}

#MetadataMatchParameters: {
	// Value sent by the client must match the specified value exactly. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	exact?: null | string @go(Exact,*string)

	// Value sent by the client must begin with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Object that specifies the range of numbers that the value sent by the client must be included in.
	// +kubebuilder:validation:Optional
	range?: [...#RangeParameters] @go(Range,[]RangeParameters)

	// Value sent by the client must include the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	regex?: null | string @go(Regex,*string)

	// Value sent by the client must end with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Optional
	suffix?: null | string @go(Suffix,*string)
}

#MetadataObservation: {
}

#MetadataParameters: {
	// If true, the match is on the opposite of the match criteria. Default is false.
	// +kubebuilder:validation:Optional
	invert?: null | bool @go(Invert,*bool)

	// Criteria for determining an gRPC request match.
	// +kubebuilder:validation:Optional
	match?: [...#MetadataMatchParameters] @go(Match,[]MetadataMatchParameters)

	// Name to use for the route. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)
}

#PerRequestObservation: {
}

#PerRequestParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#PerRetryTimeoutObservation: {
}

#PerRetryTimeoutParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#RangeObservation: {
}

#RangeParameters: {
	// End of the range.
	// +kubebuilder:validation:Required
	end?: null | float64 @go(End,*float64)

	// (Requited) Start of the range.
	// +kubebuilder:validation:Required
	start?: null | float64 @go(Start,*float64)
}

#RetryPolicyObservation: {
}

#RetryPolicyParameters: {
	// List of gRPC retry events.
	// Valid values: cancelled, deadline-exceeded, internal, resource-exhausted, unavailable.
	// +kubebuilder:validation:Optional
	grpcRetryEvents?: [...null | string] @go(GRPCRetryEvents,[]*string)

	// List of HTTP retry events.
	// Valid values: client-error (HTTP status code 409), gateway-error (HTTP status codes 502, 503, and 504), server-error (HTTP status codes 500, 501, 502, 503, 504, 505, 506, 507, 508, 510, and 511), stream-error (retry on refused stream).
	// +kubebuilder:validation:Optional
	httpRetryEvents?: [...null | string] @go(HTTPRetryEvents,[]*string)

	// Maximum number of retries.
	// +kubebuilder:validation:Required
	maxRetries?: null | float64 @go(MaxRetries,*float64)

	// Per-retry timeout.
	// +kubebuilder:validation:Required
	perRetryTimeout: [...#PerRetryTimeoutParameters] @go(PerRetryTimeout,[]PerRetryTimeoutParameters)

	// List of TCP retry events. The only valid value is connection-error.
	// +kubebuilder:validation:Optional
	tcpRetryEvents?: [...null | string] @go(TCPRetryEvents,[]*string)
}

#RetryPolicyPerRetryTimeoutObservation: {
}

#RetryPolicyPerRetryTimeoutParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#RouteObservation: {
	// ARN of the route.
	arn?: null | string @go(Arn,*string)

	// Creation date of the route.
	createdDate?: null | string @go(CreatedDate,*string)

	// ID of the route.
	id?: null | string @go(ID,*string)

	// Last update date of the route.
	lastUpdatedDate?: null | string @go(LastUpdatedDate,*string)

	// Resource owner's AWS account ID.
	resourceOwner?: null | string @go(ResourceOwner,*string)

	// Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#RouteParameters: {
	// Name of the service mesh in which to create the route. Must be between 1 and 255 characters in length.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/appmesh/v1beta1.Mesh
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	meshName?: null | string @go(MeshName,*string)

	// AWS account ID of the service mesh's owner. Defaults to the account ID the AWS provider is currently connected to.
	// +kubebuilder:validation:Optional
	meshOwner?: null | string @go(MeshOwner,*string)

	// Name to use for the route. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Route specification to apply.
	// +kubebuilder:validation:Required
	spec: [...#RouteSpecParameters] @go(Spec,[]RouteSpecParameters)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Name of the virtual router in which to create the route. Must be between 1 and 255 characters in length.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/appmesh/v1beta1.VirtualRouter
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	virtualRouterName?: null | string @go(VirtualRouterName,*string)
}

#RouteSpecObservation: {
}

#RouteSpecParameters: {
	// GRPC routing information for the route.
	// +kubebuilder:validation:Optional
	grpcRoute?: [...#SpecGRPCRouteParameters] @go(GRPCRoute,[]SpecGRPCRouteParameters)

	// HTTP routing information for the route.
	// +kubebuilder:validation:Optional
	httpRoute?: [...#SpecHTTPRouteParameters] @go(HTTPRoute,[]SpecHTTPRouteParameters)

	// HTTP/2 routing information for the route.
	// +kubebuilder:validation:Optional
	http2Route?: [...#SpecHttp2RouteParameters] @go(Http2Route,[]SpecHttp2RouteParameters)

	// Priority for the route, between 0 and 1000.
	// Routes are matched based on the specified value, where 0 is the highest priority.
	// +kubebuilder:validation:Optional
	priority?: null | float64 @go(Priority,*float64)

	// TCP routing information for the route.
	// +kubebuilder:validation:Optional
	tcpRoute?: [...#TCPRouteParameters] @go(TCPRoute,[]TCPRouteParameters)
}

#SpecGRPCRouteObservation: {
}

#SpecGRPCRouteParameters: {
	// Action to take if a match is determined.
	// +kubebuilder:validation:Required
	action: [...#GRPCRouteActionParameters] @go(Action,[]GRPCRouteActionParameters)

	// Criteria for determining an gRPC request match.
	// +kubebuilder:validation:Optional
	match?: [...#GRPCRouteMatchParameters] @go(Match,[]GRPCRouteMatchParameters)

	// Retry policy.
	// +kubebuilder:validation:Optional
	retryPolicy?: [...#RetryPolicyParameters] @go(RetryPolicy,[]RetryPolicyParameters)

	// Types of timeouts.
	// +kubebuilder:validation:Optional
	timeout?: [...#TimeoutParameters] @go(Timeout,[]TimeoutParameters)
}

#SpecHTTPRouteActionObservation: {
}

#SpecHTTPRouteActionParameters: {
	// Targets that traffic is routed to when a request matches the route.
	// You can specify one or more targets and their relative weights with which to distribute traffic.
	// +kubebuilder:validation:Required
	weightedTarget: [...#HTTPRouteActionWeightedTargetParameters] @go(WeightedTarget,[]HTTPRouteActionWeightedTargetParameters)
}

#SpecHTTPRouteMatchObservation: {
}

#SpecHTTPRouteMatchParameters: {
	// Client request headers to match on.
	// +kubebuilder:validation:Optional
	header?: [...#MatchHeaderParameters] @go(Header,[]MatchHeaderParameters)

	// Client request header method to match on. Valid values: GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE, PATCH.
	// +kubebuilder:validation:Optional
	method?: null | string @go(Method,*string)

	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// Value sent by the client must begin with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	prefix?: null | string @go(Prefix,*string)

	// Client request header scheme to match on. Valid values: http, https.
	// +kubebuilder:validation:Optional
	scheme?: null | string @go(Scheme,*string)
}

#SpecHTTPRouteObservation: {
}

#SpecHTTPRouteParameters: {
	// Action to take if a match is determined.
	// +kubebuilder:validation:Required
	action: [...#SpecHTTPRouteActionParameters] @go(Action,[]SpecHTTPRouteActionParameters)

	// Criteria for determining an gRPC request match.
	// +kubebuilder:validation:Required
	match: [...#SpecHTTPRouteMatchParameters] @go(Match,[]SpecHTTPRouteMatchParameters)

	// Retry policy.
	// +kubebuilder:validation:Optional
	retryPolicy?: [...#HTTPRouteRetryPolicyParameters] @go(RetryPolicy,[]HTTPRouteRetryPolicyParameters)

	// Types of timeouts.
	// +kubebuilder:validation:Optional
	timeout?: [...#HTTPRouteTimeoutParameters] @go(Timeout,[]HTTPRouteTimeoutParameters)
}

#SpecHttp2RouteActionObservation: {
}

#SpecHttp2RouteActionParameters: {
	// Targets that traffic is routed to when a request matches the route.
	// You can specify one or more targets and their relative weights with which to distribute traffic.
	// +kubebuilder:validation:Required
	weightedTarget: [...#ActionWeightedTargetParameters] @go(WeightedTarget,[]ActionWeightedTargetParameters)
}

#SpecHttp2RouteMatchObservation: {
}

#SpecHttp2RouteMatchParameters: {
	// Client request headers to match on.
	// +kubebuilder:validation:Optional
	header?: [...#HeaderParameters] @go(Header,[]HeaderParameters)

	// Client request header method to match on. Valid values: GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE, PATCH.
	// +kubebuilder:validation:Optional
	method?: null | string @go(Method,*string)

	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// Value sent by the client must begin with the specified characters. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	prefix?: null | string @go(Prefix,*string)

	// Client request header scheme to match on. Valid values: http, https.
	// +kubebuilder:validation:Optional
	scheme?: null | string @go(Scheme,*string)
}

#SpecHttp2RouteObservation: {
}

#SpecHttp2RouteParameters: {
	// Action to take if a match is determined.
	// +kubebuilder:validation:Required
	action: [...#SpecHttp2RouteActionParameters] @go(Action,[]SpecHttp2RouteActionParameters)

	// Criteria for determining an gRPC request match.
	// +kubebuilder:validation:Required
	match: [...#SpecHttp2RouteMatchParameters] @go(Match,[]SpecHttp2RouteMatchParameters)

	// Retry policy.
	// +kubebuilder:validation:Optional
	retryPolicy?: [...#Http2RouteRetryPolicyParameters] @go(RetryPolicy,[]Http2RouteRetryPolicyParameters)

	// Types of timeouts.
	// +kubebuilder:validation:Optional
	timeout?: [...#Http2RouteTimeoutParameters] @go(Timeout,[]Http2RouteTimeoutParameters)
}

#TCPRouteActionObservation: {
}

#TCPRouteActionParameters: {
	// Targets that traffic is routed to when a request matches the route.
	// You can specify one or more targets and their relative weights with which to distribute traffic.
	// +kubebuilder:validation:Required
	weightedTarget: [...#TCPRouteActionWeightedTargetParameters] @go(WeightedTarget,[]TCPRouteActionWeightedTargetParameters)
}

#TCPRouteActionWeightedTargetObservation: {
}

#TCPRouteActionWeightedTargetParameters: {
	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// Virtual node to associate with the weighted target. Must be between 1 and 255 characters in length.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/appmesh/v1beta1.VirtualNode
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	virtualNode?: null | string @go(VirtualNode,*string)

	// Relative weight of the weighted target. An integer between 0 and 100.
	// +kubebuilder:validation:Required
	weight?: null | float64 @go(Weight,*float64)
}

#TCPRouteMatchObservation: {
}

#TCPRouteMatchParameters: {
	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)
}

#TCPRouteObservation: {
}

#TCPRouteParameters: {
	// Action to take if a match is determined.
	// +kubebuilder:validation:Required
	action: [...#TCPRouteActionParameters] @go(Action,[]TCPRouteActionParameters)

	// Criteria for determining an gRPC request match.
	// +kubebuilder:validation:Optional
	match?: [...#TCPRouteMatchParameters] @go(Match,[]TCPRouteMatchParameters)

	// Types of timeouts.
	// +kubebuilder:validation:Optional
	timeout?: [...#TCPRouteTimeoutParameters] @go(Timeout,[]TCPRouteTimeoutParameters)
}

#TCPRouteTimeoutIdleObservation: {
}

#TCPRouteTimeoutIdleParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#TCPRouteTimeoutObservation: {
}

#TCPRouteTimeoutParameters: {
	// Idle timeout. An idle timeout bounds the amount of time that a connection may be idle.
	// +kubebuilder:validation:Optional
	idle?: [...#TCPRouteTimeoutIdleParameters] @go(Idle,[]TCPRouteTimeoutIdleParameters)
}

#TimeoutIdleObservation: {
}

#TimeoutIdleParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#TimeoutObservation: {
}

#TimeoutParameters: {
	// Idle timeout. An idle timeout bounds the amount of time that a connection may be idle.
	// +kubebuilder:validation:Optional
	idle?: [...#IdleParameters] @go(Idle,[]IdleParameters)

	// Per request timeout.
	// +kubebuilder:validation:Optional
	perRequest?: [...#PerRequestParameters] @go(PerRequest,[]PerRequestParameters)
}

#TimeoutPerRequestObservation: {
}

#TimeoutPerRequestParameters: {
	// Unit of time. Valid values: ms, s.
	// +kubebuilder:validation:Required
	unit?: null | string @go(Unit,*string)

	// Number of time units. Minimum value of 0.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#WeightedTargetObservation: {
}

#WeightedTargetParameters: {
	// The port number to match from the request.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// Virtual node to associate with the weighted target. Must be between 1 and 255 characters in length.
	// +kubebuilder:validation:Required
	virtualNode?: null | string @go(VirtualNode,*string)

	// Relative weight of the weighted target. An integer between 0 and 100.
	// +kubebuilder:validation:Required
	weight?: null | float64 @go(Weight,*float64)
}

// RouteSpec defines the desired state of Route
#RouteSpec: {
	forProvider: #RouteParameters @go(ForProvider)
}

// RouteStatus defines the observed state of Route.
#RouteStatus: {
	atProvider?: #RouteObservation @go(AtProvider)
}

// Route is the Schema for the Routes API. Provides an AWS App Mesh route resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Route: {
	spec:    #RouteSpec   @go(Spec)
	status?: #RouteStatus @go(Status)
}

// RouteList contains a list of Routes
#RouteList: {
	items: [...#Route] @go(Items,[]Route)
}