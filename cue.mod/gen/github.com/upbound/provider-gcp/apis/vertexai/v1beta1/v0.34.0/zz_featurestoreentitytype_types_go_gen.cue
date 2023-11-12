// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/vertexai/v1beta1

package v1beta1

#CategoricalThresholdConfigObservation: {
	// Specify a threshold value that can trigger the alert. For numerical feature, the distribution distance is calculated by Jensen–Shannon divergence. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature. The default value is 0.3.
	value?: null | float64 @go(Value,*float64)
}

#CategoricalThresholdConfigParameters: {
	// Specify a threshold value that can trigger the alert. For numerical feature, the distribution distance is calculated by Jensen–Shannon divergence. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature. The default value is 0.3.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#FeaturestoreEntitytypeObservation: {
	// The timestamp of when the featurestore was created in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
	createTime?: null | string @go(CreateTime,*string)

	// Optional. Description of the EntityType.
	description?: null | string @go(Description,*string)

	// Used to perform consistent read-modify-write updates.
	etag?: null | string @go(Etag,*string)

	// The name of the Featurestore to use, in the format projects/{project}/locations/{location}/featurestores/{featurestore}.
	featurestore?: null | string @go(Featurestore,*string)

	// an identifier for the resource with format {{featurestore}}/entityTypes/{{name}}
	id?: null | string @go(ID,*string)

	// A set of key/value label pairs to assign to this EntityType.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The default monitoring configuration for all Features under this EntityType.
	// If this is populated with [FeaturestoreMonitoringConfig.monitoring_interval] specified, snapshot analysis monitoring is enabled. Otherwise, snapshot analysis monitoring is disabled.
	// Structure is documented below.
	monitoringConfig?: [...#MonitoringConfigObservation] @go(MonitoringConfig,[]MonitoringConfigObservation)

	// The name of the EntityType. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
	name?:   null | string @go(Name,*string)
	region?: null | string @go(Region,*string)

	// The timestamp of when the featurestore was last updated in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
	updateTime?: null | string @go(UpdateTime,*string)
}

#FeaturestoreEntitytypeParameters: {
	// Optional. Description of the EntityType.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The name of the Featurestore to use, in the format projects/{project}/locations/{location}/featurestores/{featurestore}.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/vertexai/v1beta1.Featurestore
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	featurestore?: null | string @go(Featurestore,*string)

	// A set of key/value label pairs to assign to this EntityType.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The default monitoring configuration for all Features under this EntityType.
	// If this is populated with [FeaturestoreMonitoringConfig.monitoring_interval] specified, snapshot analysis monitoring is enabled. Otherwise, snapshot analysis monitoring is disabled.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	monitoringConfig?: [...#MonitoringConfigParameters] @go(MonitoringConfig,[]MonitoringConfigParameters)

	// The name of the EntityType. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)
}

#ImportFeaturesAnalysisObservation: {
	// Defines the baseline to do anomaly detection for feature values imported by each [entityTypes.importFeatureValues][] operation. The value must be one of the values below:
	anomalyDetectionBaseline?: null | string @go(AnomalyDetectionBaseline,*string)

	// Whether to enable / disable / inherite default hebavior for import features analysis. The value must be one of the values below:
	state?: null | string @go(State,*string)
}

#ImportFeaturesAnalysisParameters: {
	// Defines the baseline to do anomaly detection for feature values imported by each [entityTypes.importFeatureValues][] operation. The value must be one of the values below:
	// +kubebuilder:validation:Optional
	anomalyDetectionBaseline?: null | string @go(AnomalyDetectionBaseline,*string)

	// Whether to enable / disable / inherite default hebavior for import features analysis. The value must be one of the values below:
	// +kubebuilder:validation:Optional
	state?: null | string @go(State,*string)
}

#MonitoringConfigObservation: {
	// Threshold for categorical features of anomaly detection. This is shared by all types of Featurestore Monitoring for categorical features (i.e. Features with type (Feature.ValueType) BOOL or STRING).
	// Structure is documented below.
	categoricalThresholdConfig?: [...#CategoricalThresholdConfigObservation] @go(CategoricalThresholdConfig,[]CategoricalThresholdConfigObservation)

	// The config for ImportFeatures Analysis Based Feature Monitoring.
	// Structure is documented below.
	importFeaturesAnalysis?: [...#ImportFeaturesAnalysisObservation] @go(ImportFeaturesAnalysis,[]ImportFeaturesAnalysisObservation)

	// Threshold for numerical features of anomaly detection. This is shared by all objectives of Featurestore Monitoring for numerical features (i.e. Features with type (Feature.ValueType) DOUBLE or INT64).
	// Structure is documented below.
	numericalThresholdConfig?: [...#NumericalThresholdConfigObservation] @go(NumericalThresholdConfig,[]NumericalThresholdConfigObservation)

	// The config for Snapshot Analysis Based Feature Monitoring.
	// Structure is documented below.
	snapshotAnalysis?: [...#SnapshotAnalysisObservation] @go(SnapshotAnalysis,[]SnapshotAnalysisObservation)
}

#MonitoringConfigParameters: {
	// Threshold for categorical features of anomaly detection. This is shared by all types of Featurestore Monitoring for categorical features (i.e. Features with type (Feature.ValueType) BOOL or STRING).
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	categoricalThresholdConfig?: [...#CategoricalThresholdConfigParameters] @go(CategoricalThresholdConfig,[]CategoricalThresholdConfigParameters)

	// The config for ImportFeatures Analysis Based Feature Monitoring.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	importFeaturesAnalysis?: [...#ImportFeaturesAnalysisParameters] @go(ImportFeaturesAnalysis,[]ImportFeaturesAnalysisParameters)

	// Threshold for numerical features of anomaly detection. This is shared by all objectives of Featurestore Monitoring for numerical features (i.e. Features with type (Feature.ValueType) DOUBLE or INT64).
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	numericalThresholdConfig?: [...#NumericalThresholdConfigParameters] @go(NumericalThresholdConfig,[]NumericalThresholdConfigParameters)

	// The config for Snapshot Analysis Based Feature Monitoring.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	snapshotAnalysis?: [...#SnapshotAnalysisParameters] @go(SnapshotAnalysis,[]SnapshotAnalysisParameters)
}

#NumericalThresholdConfigObservation: {
	// Specify a threshold value that can trigger the alert. For numerical feature, the distribution distance is calculated by Jensen–Shannon divergence. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature. The default value is 0.3.
	value?: null | float64 @go(Value,*float64)
}

#NumericalThresholdConfigParameters: {
	// Specify a threshold value that can trigger the alert. For numerical feature, the distribution distance is calculated by Jensen–Shannon divergence. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature. The default value is 0.3.
	// +kubebuilder:validation:Required
	value?: null | float64 @go(Value,*float64)
}

#SnapshotAnalysisObservation: {
	// The monitoring schedule for snapshot analysis. For EntityType-level config: unset / disabled = true indicates disabled by default for Features under it; otherwise by default enable snapshot analysis monitoring with monitoringInterval for Features under it.
	disabled?: null | bool @go(Disabled,*bool)

	// Configuration of the snapshot analysis based monitoring pipeline running interval. The value indicates number of days. The default value is 1.
	// If both FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval_days and [FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval][] are set when creating/updating EntityTypes/Features, FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval_days will be used.
	monitoringIntervalDays?: null | float64 @go(MonitoringIntervalDays,*float64)

	// Customized export features time window for snapshot analysis. Unit is one day. The default value is 21 days. Minimum value is 1 day. Maximum value is 4000 days.
	stalenessDays?: null | float64 @go(StalenessDays,*float64)
}

#SnapshotAnalysisParameters: {
	// The monitoring schedule for snapshot analysis. For EntityType-level config: unset / disabled = true indicates disabled by default for Features under it; otherwise by default enable snapshot analysis monitoring with monitoringInterval for Features under it.
	// +kubebuilder:validation:Optional
	disabled?: null | bool @go(Disabled,*bool)

	// Configuration of the snapshot analysis based monitoring pipeline running interval. The value indicates number of days. The default value is 1.
	// If both FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval_days and [FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval][] are set when creating/updating EntityTypes/Features, FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval_days will be used.
	// +kubebuilder:validation:Optional
	monitoringIntervalDays?: null | float64 @go(MonitoringIntervalDays,*float64)

	// Customized export features time window for snapshot analysis. Unit is one day. The default value is 21 days. Minimum value is 1 day. Maximum value is 4000 days.
	// +kubebuilder:validation:Optional
	stalenessDays?: null | float64 @go(StalenessDays,*float64)
}

// FeaturestoreEntitytypeSpec defines the desired state of FeaturestoreEntitytype
#FeaturestoreEntitytypeSpec: {
	forProvider: #FeaturestoreEntitytypeParameters @go(ForProvider)
}

// FeaturestoreEntitytypeStatus defines the observed state of FeaturestoreEntitytype.
#FeaturestoreEntitytypeStatus: {
	atProvider?: #FeaturestoreEntitytypeObservation @go(AtProvider)
}

// FeaturestoreEntitytype is the Schema for the FeaturestoreEntitytypes API. An entity type is a type of object in a system that needs to be modeled and have stored information about.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#FeaturestoreEntitytype: {
	spec:    #FeaturestoreEntitytypeSpec   @go(Spec)
	status?: #FeaturestoreEntitytypeStatus @go(Status)
}

// FeaturestoreEntitytypeList contains a list of FeaturestoreEntitytypes
#FeaturestoreEntitytypeList: {
	items: [...#FeaturestoreEntitytype] @go(Items,[]FeaturestoreEntitytype)
}