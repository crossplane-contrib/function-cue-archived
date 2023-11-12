// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudfront/v1beta1

package v1beta1

#MonitoringSubscriptionMonitoringSubscriptionObservation: {
}

#MonitoringSubscriptionMonitoringSubscriptionParameters: {
	// A subscription configuration for additional CloudWatch metrics. See below.
	// +kubebuilder:validation:Required
	realtimeMetricsSubscriptionConfig: [...#RealtimeMetricsSubscriptionConfigParameters] @go(RealtimeMetricsSubscriptionConfig,[]RealtimeMetricsSubscriptionConfigParameters)
}

#MonitoringSubscriptionObservation: {
	// The ID of the CloudFront monitoring subscription, which corresponds to the distribution_id.
	id?: null | string @go(ID,*string)
}

#MonitoringSubscriptionParameters: {
	// The ID of the distribution that you are enabling metrics for.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/cloudfront/v1beta1.Distribution
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	distributionId?: null | string @go(DistributionID,*string)

	// A monitoring subscription. This structure contains information about whether additional CloudWatch metrics are enabled for a given CloudFront distribution.
	// +kubebuilder:validation:Required
	monitoringSubscription: [...#MonitoringSubscriptionMonitoringSubscriptionParameters] @go(MonitoringSubscription,[]MonitoringSubscriptionMonitoringSubscriptionParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

#RealtimeMetricsSubscriptionConfigObservation: {
}

#RealtimeMetricsSubscriptionConfigParameters: {
	// A flag that indicates whether additional CloudWatch metrics are enabled for a given CloudFront distribution. Valid values are Enabled and Disabled. See below.
	// +kubebuilder:validation:Required
	realtimeMetricsSubscriptionStatus?: null | string @go(RealtimeMetricsSubscriptionStatus,*string)
}

// MonitoringSubscriptionSpec defines the desired state of MonitoringSubscription
#MonitoringSubscriptionSpec: {
	forProvider: #MonitoringSubscriptionParameters @go(ForProvider)
}

// MonitoringSubscriptionStatus defines the observed state of MonitoringSubscription.
#MonitoringSubscriptionStatus: {
	atProvider?: #MonitoringSubscriptionObservation @go(AtProvider)
}

// MonitoringSubscription is the Schema for the MonitoringSubscriptions API. Provides a CloudFront monitoring subscription resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#MonitoringSubscription: {
	spec:    #MonitoringSubscriptionSpec   @go(Spec)
	status?: #MonitoringSubscriptionStatus @go(Status)
}

// MonitoringSubscriptionList contains a list of MonitoringSubscriptions
#MonitoringSubscriptionList: {
	items: [...#MonitoringSubscription] @go(Items,[]MonitoringSubscription)
}