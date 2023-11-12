// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/network/v1beta1

package v1beta1

#DNSConfigInitParameters: {
	// The relative domain name, this is combined with the domain name used by Traffic Manager to form the FQDN which is exported as documented below. Changing this forces a new resource to be created.
	relativeName?: null | string @go(RelativeName,*string)

	// The TTL value of the Profile used by Local DNS resolvers and clients.
	ttl?: null | float64 @go(TTL,*float64)
}

#DNSConfigObservation: {
	// The relative domain name, this is combined with the domain name used by Traffic Manager to form the FQDN which is exported as documented below. Changing this forces a new resource to be created.
	relativeName?: null | string @go(RelativeName,*string)

	// The TTL value of the Profile used by Local DNS resolvers and clients.
	ttl?: null | float64 @go(TTL,*float64)
}

#DNSConfigParameters: {
	// The relative domain name, this is combined with the domain name used by Traffic Manager to form the FQDN which is exported as documented below. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	relativeName?: null | string @go(RelativeName,*string)

	// The TTL value of the Profile used by Local DNS resolvers and clients.
	// +kubebuilder:validation:Optional
	ttl?: null | float64 @go(TTL,*float64)
}

#MonitorConfigCustomHeaderInitParameters: {
	// The name of the Traffic Manager profile. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// The value of custom header. Applicable for HTTP and HTTPS protocol.
	value?: null | string @go(Value,*string)
}

#MonitorConfigCustomHeaderObservation: {
	// The name of the Traffic Manager profile. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// The value of custom header. Applicable for HTTP and HTTPS protocol.
	value?: null | string @go(Value,*string)
}

#MonitorConfigCustomHeaderParameters: {
	// The name of the Traffic Manager profile. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The value of custom header. Applicable for HTTP and HTTPS protocol.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#MonitorConfigInitParameters: {
	// One or more custom_header blocks as defined below.
	customHeader?: [...#MonitorConfigCustomHeaderInitParameters] @go(CustomHeader,[]MonitorConfigCustomHeaderInitParameters)

	// A list of status code ranges in the format of 100-101.
	expectedStatusCodeRanges?: [...null | string] @go(ExpectedStatusCodeRanges,[]*string)

	// The interval used to check the endpoint health from a Traffic Manager probing agent. You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30.
	intervalInSeconds?: null | float64 @go(IntervalInSeconds,*float64)

	// The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP.
	path?: null | string @go(Path,*string)

	// The port number used by the monitoring checks.
	port?: null | float64 @go(Port,*float64)

	// The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP.
	protocol?: null | string @go(Protocol,*string)

	// The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint. If interval_in_seconds is set to 30, then timeout_in_seconds can be between 5 and 10. The default value is 10. If interval_in_seconds is set to 10, then valid values are between 5 and 9 and timeout_in_seconds is required.
	timeoutInSeconds?: null | float64 @go(TimeoutInSeconds,*float64)

	// The number of failures a Traffic Manager probing agent tolerates before marking that endpoint as unhealthy. Valid values are between 0 and 9. The default value is 3
	toleratedNumberOfFailures?: null | float64 @go(ToleratedNumberOfFailures,*float64)
}

#MonitorConfigObservation: {
	// One or more custom_header blocks as defined below.
	customHeader?: [...#MonitorConfigCustomHeaderObservation] @go(CustomHeader,[]MonitorConfigCustomHeaderObservation)

	// A list of status code ranges in the format of 100-101.
	expectedStatusCodeRanges?: [...null | string] @go(ExpectedStatusCodeRanges,[]*string)

	// The interval used to check the endpoint health from a Traffic Manager probing agent. You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30.
	intervalInSeconds?: null | float64 @go(IntervalInSeconds,*float64)

	// The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP.
	path?: null | string @go(Path,*string)

	// The port number used by the monitoring checks.
	port?: null | float64 @go(Port,*float64)

	// The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP.
	protocol?: null | string @go(Protocol,*string)

	// The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint. If interval_in_seconds is set to 30, then timeout_in_seconds can be between 5 and 10. The default value is 10. If interval_in_seconds is set to 10, then valid values are between 5 and 9 and timeout_in_seconds is required.
	timeoutInSeconds?: null | float64 @go(TimeoutInSeconds,*float64)

	// The number of failures a Traffic Manager probing agent tolerates before marking that endpoint as unhealthy. Valid values are between 0 and 9. The default value is 3
	toleratedNumberOfFailures?: null | float64 @go(ToleratedNumberOfFailures,*float64)
}

#MonitorConfigParameters: {
	// One or more custom_header blocks as defined below.
	// +kubebuilder:validation:Optional
	customHeader?: [...#MonitorConfigCustomHeaderParameters] @go(CustomHeader,[]MonitorConfigCustomHeaderParameters)

	// A list of status code ranges in the format of 100-101.
	// +kubebuilder:validation:Optional
	expectedStatusCodeRanges?: [...null | string] @go(ExpectedStatusCodeRanges,[]*string)

	// The interval used to check the endpoint health from a Traffic Manager probing agent. You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30.
	// +kubebuilder:validation:Optional
	intervalInSeconds?: null | float64 @go(IntervalInSeconds,*float64)

	// The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)

	// The port number used by the monitoring checks.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// The amount of time the Traffic Manager probing agent should wait before considering that check a failure when a health check probe is sent to the endpoint. If interval_in_seconds is set to 30, then timeout_in_seconds can be between 5 and 10. The default value is 10. If interval_in_seconds is set to 10, then valid values are between 5 and 9 and timeout_in_seconds is required.
	// +kubebuilder:validation:Optional
	timeoutInSeconds?: null | float64 @go(TimeoutInSeconds,*float64)

	// The number of failures a Traffic Manager probing agent tolerates before marking that endpoint as unhealthy. Valid values are between 0 and 9. The default value is 3
	// +kubebuilder:validation:Optional
	toleratedNumberOfFailures?: null | float64 @go(ToleratedNumberOfFailures,*float64)
}

#TrafficManagerProfileInitParameters: {
	// This block specifies the DNS configuration of the Profile, it supports the fields documented below.
	dnsConfig?: [...#DNSConfigInitParameters] @go(DNSConfig,[]DNSConfigInitParameters)

	// The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8.
	maxReturn?: null | float64 @go(MaxReturn,*float64)

	// This block specifies the Endpoint monitoring configuration for the Profile, it supports the fields documented below.
	monitorConfig?: [...#MonitorConfigInitParameters] @go(MonitorConfig,[]MonitorConfigInitParameters)

	// The status of the profile, can be set to either Enabled or Disabled. Defaults to Enabled.
	profileStatus?: null | string @go(ProfileStatus,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the algorithm used to route traffic. Possible values are Geographic, Weighted, Performance, Priority, Subnet and MultiValue.
	trafficRoutingMethod?: null | string @go(TrafficRoutingMethod,*string)

	// Indicates whether Traffic View is enabled for the Traffic Manager profile.
	trafficViewEnabled?: null | bool @go(TrafficViewEnabled,*bool)
}

#TrafficManagerProfileObservation: {
	// This block specifies the DNS configuration of the Profile, it supports the fields documented below.
	dnsConfig?: [...#DNSConfigObservation] @go(DNSConfig,[]DNSConfigObservation)

	// The FQDN of the created Profile.
	fqdn?: null | string @go(Fqdn,*string)

	// The ID of the Traffic Manager Profile.
	id?: null | string @go(ID,*string)

	// The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8.
	maxReturn?: null | float64 @go(MaxReturn,*float64)

	// This block specifies the Endpoint monitoring configuration for the Profile, it supports the fields documented below.
	monitorConfig?: [...#MonitorConfigObservation] @go(MonitorConfig,[]MonitorConfigObservation)

	// The status of the profile, can be set to either Enabled or Disabled. Defaults to Enabled.
	profileStatus?: null | string @go(ProfileStatus,*string)

	// The name of the resource group in which to create the Traffic Manager profile. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the algorithm used to route traffic. Possible values are Geographic, Weighted, Performance, Priority, Subnet and MultiValue.
	trafficRoutingMethod?: null | string @go(TrafficRoutingMethod,*string)

	// Indicates whether Traffic View is enabled for the Traffic Manager profile.
	trafficViewEnabled?: null | bool @go(TrafficViewEnabled,*bool)
}

#TrafficManagerProfileParameters: {
	// This block specifies the DNS configuration of the Profile, it supports the fields documented below.
	// +kubebuilder:validation:Optional
	dnsConfig?: [...#DNSConfigParameters] @go(DNSConfig,[]DNSConfigParameters)

	// The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8.
	// +kubebuilder:validation:Optional
	maxReturn?: null | float64 @go(MaxReturn,*float64)

	// This block specifies the Endpoint monitoring configuration for the Profile, it supports the fields documented below.
	// +kubebuilder:validation:Optional
	monitorConfig?: [...#MonitorConfigParameters] @go(MonitorConfig,[]MonitorConfigParameters)

	// The status of the profile, can be set to either Enabled or Disabled. Defaults to Enabled.
	// +kubebuilder:validation:Optional
	profileStatus?: null | string @go(ProfileStatus,*string)

	// The name of the resource group in which to create the Traffic Manager profile. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the algorithm used to route traffic. Possible values are Geographic, Weighted, Performance, Priority, Subnet and MultiValue.
	// +kubebuilder:validation:Optional
	trafficRoutingMethod?: null | string @go(TrafficRoutingMethod,*string)

	// Indicates whether Traffic View is enabled for the Traffic Manager profile.
	// +kubebuilder:validation:Optional
	trafficViewEnabled?: null | bool @go(TrafficViewEnabled,*bool)
}

// TrafficManagerProfileSpec defines the desired state of TrafficManagerProfile
#TrafficManagerProfileSpec: {
	forProvider: #TrafficManagerProfileParameters @go(ForProvider)

	// THIS IS AN ALPHA FIELD. Do not use it in production. It is not honored
	// unless the relevant Crossplane feature flag is enabled, and may be
	// changed or removed without notice.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #TrafficManagerProfileInitParameters @go(InitProvider)
}

// TrafficManagerProfileStatus defines the observed state of TrafficManagerProfile.
#TrafficManagerProfileStatus: {
	atProvider?: #TrafficManagerProfileObservation @go(AtProvider)
}

// TrafficManagerProfile is the Schema for the TrafficManagerProfiles API. Manages a Traffic Manager Profile.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#TrafficManagerProfile: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.dnsConfig) || has(self.initProvider.dnsConfig)",message="dnsConfig is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.monitorConfig) || has(self.initProvider.monitorConfig)",message="monitorConfig is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.trafficRoutingMethod) || has(self.initProvider.trafficRoutingMethod)",message="trafficRoutingMethod is a required parameter"
	spec:    #TrafficManagerProfileSpec   @go(Spec)
	status?: #TrafficManagerProfileStatus @go(Status)
}

// TrafficManagerProfileList contains a list of TrafficManagerProfiles
#TrafficManagerProfileList: {
	items: [...#TrafficManagerProfile] @go(Items,[]TrafficManagerProfile)
}