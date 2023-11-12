// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/s3control/v1beta1

package v1beta1

#AccountLevelDetailedStatusCodeMetricsObservation: {
}

#AccountLevelDetailedStatusCodeMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#AccountLevelObservation: {
}

#AccountLevelParameters: {
	// S3 Storage Lens activity metrics. See Activity Metrics below for more details.
	// +kubebuilder:validation:Optional
	activityMetrics?: [...#ActivityMetricsParameters] @go(ActivityMetrics,[]ActivityMetricsParameters)

	// optimization metrics for S3 Storage Lens. See Advanced Cost-Optimization Metrics below for more details.
	// +kubebuilder:validation:Optional
	advancedCostOptimizationMetrics?: [...#AdvancedCostOptimizationMetricsParameters] @go(AdvancedCostOptimizationMetrics,[]AdvancedCostOptimizationMetricsParameters)

	// protection metrics for S3 Storage Lens. See Advanced Data-Protection Metrics below for more details.
	// +kubebuilder:validation:Optional
	advancedDataProtectionMetrics?: [...#AdvancedDataProtectionMetricsParameters] @go(AdvancedDataProtectionMetrics,[]AdvancedDataProtectionMetricsParameters)

	// level configuration. See Bucket Level below for more details.
	// +kubebuilder:validation:Required
	bucketLevel: [...#BucketLevelParameters] @go(BucketLevel,[]BucketLevelParameters)

	// Detailed status code metrics for S3 Storage Lens. See Detailed Status Code Metrics below for more details.
	// +kubebuilder:validation:Optional
	detailedStatusCodeMetrics?: [...#AccountLevelDetailedStatusCodeMetricsParameters] @go(DetailedStatusCodeMetrics,[]AccountLevelDetailedStatusCodeMetricsParameters)
}

#ActivityMetricsObservation: {
}

#ActivityMetricsParameters: {
	// Whether the activity metrics are enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#AdvancedCostOptimizationMetricsObservation: {
}

#AdvancedCostOptimizationMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#AdvancedDataProtectionMetricsObservation: {
}

#AdvancedDataProtectionMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#AwsOrgObservation: {
}

#AwsOrgParameters: {
	// The Amazon Resource Name (ARN) of the bucket.
	// +kubebuilder:validation:Required
	arn?: null | string @go(Arn,*string)
}

#BucketLevelActivityMetricsObservation: {
}

#BucketLevelActivityMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#BucketLevelAdvancedCostOptimizationMetricsObservation: {
}

#BucketLevelAdvancedCostOptimizationMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#BucketLevelAdvancedDataProtectionMetricsObservation: {
}

#BucketLevelAdvancedDataProtectionMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#BucketLevelObservation: {
}

#BucketLevelParameters: {
	// S3 Storage Lens activity metrics. See Activity Metrics below for more details.
	// +kubebuilder:validation:Optional
	activityMetrics?: [...#BucketLevelActivityMetricsParameters] @go(ActivityMetrics,[]BucketLevelActivityMetricsParameters)

	// optimization metrics for S3 Storage Lens. See Advanced Cost-Optimization Metrics below for more details.
	// +kubebuilder:validation:Optional
	advancedCostOptimizationMetrics?: [...#BucketLevelAdvancedCostOptimizationMetricsParameters] @go(AdvancedCostOptimizationMetrics,[]BucketLevelAdvancedCostOptimizationMetricsParameters)

	// protection metrics for S3 Storage Lens. See Advanced Data-Protection Metrics below for more details.
	// +kubebuilder:validation:Optional
	advancedDataProtectionMetrics?: [...#BucketLevelAdvancedDataProtectionMetricsParameters] @go(AdvancedDataProtectionMetrics,[]BucketLevelAdvancedDataProtectionMetricsParameters)

	// Detailed status code metrics for S3 Storage Lens. See Detailed Status Code Metrics below for more details.
	// +kubebuilder:validation:Optional
	detailedStatusCodeMetrics?: [...#DetailedStatusCodeMetricsParameters] @go(DetailedStatusCodeMetrics,[]DetailedStatusCodeMetricsParameters)

	// level metrics for S3 Storage Lens. See Prefix Level below for more details.
	// +kubebuilder:validation:Optional
	prefixLevel?: [...#PrefixLevelParameters] @go(PrefixLevel,[]PrefixLevelParameters)
}

#CloudWatchMetricsObservation: {
}

#CloudWatchMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Required
	enabled?: null | bool @go(Enabled,*bool)
}

#DataExportObservation: {
}

#DataExportParameters: {
	// Amazon CloudWatch publishing for S3 Storage Lens metrics. See Cloud Watch Metrics below for more details.
	// +kubebuilder:validation:Optional
	cloudWatchMetrics?: [...#CloudWatchMetricsParameters] @go(CloudWatchMetrics,[]CloudWatchMetricsParameters)

	// The bucket where the S3 Storage Lens metrics export will be located. See S3 Bucket Destination below for more details.
	// +kubebuilder:validation:Optional
	s3BucketDestination?: [...#S3BucketDestinationParameters] @go(S3BucketDestination,[]S3BucketDestinationParameters)
}

#DetailedStatusCodeMetricsObservation: {
}

#DetailedStatusCodeMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#EncryptionObservation: {
}

#EncryptionParameters: {
	// KMS encryption. See SSE KMS below for more details.
	// +kubebuilder:validation:Optional
	sseKms?: [...#SseKMSParameters] @go(SseKMS,[]SseKMSParameters)

	// S3 encryption. An empty configuration block {} should be used.
	// +kubebuilder:validation:Optional
	sseS3?: [...#SseS3Parameters] @go(SseS3,[]SseS3Parameters)
}

#ExcludeObservation: {
}

#ExcludeParameters: {
	// List of S3 bucket ARNs.
	// +kubebuilder:validation:Optional
	buckets?: [...null | string] @go(Buckets,[]*string)

	// List of AWS Regions.
	// +kubebuilder:validation:Optional
	regions?: [...null | string] @go(Regions,[]*string)
}

#IncludeObservation: {
}

#IncludeParameters: {
	// List of S3 bucket ARNs.
	// +kubebuilder:validation:Optional
	buckets?: [...null | string] @go(Buckets,[]*string)

	// List of AWS Regions.
	// +kubebuilder:validation:Optional
	regions?: [...null | string] @go(Regions,[]*string)
}

#PrefixLevelObservation: {
}

#PrefixLevelParameters: {
	// level storage metrics for S3 Storage Lens. See Prefix Level Storage Metrics below for more details.
	// +kubebuilder:validation:Required
	storageMetrics: [...#StorageMetricsParameters] @go(StorageMetrics,[]StorageMetricsParameters)
}

#S3BucketDestinationObservation: {
}

#S3BucketDestinationParameters: {
	// The account ID of the owner of the S3 Storage Lens metrics export bucket.
	// +kubebuilder:validation:Required
	accountId?: null | string @go(AccountID,*string)

	// The Amazon Resource Name (ARN) of the bucket.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	arn?: null | string @go(Arn,*string)

	// Encryption of the metrics exports in this bucket. See Encryption below for more details.
	// +kubebuilder:validation:Optional
	encryption?: [...#EncryptionParameters] @go(Encryption,[]EncryptionParameters)

	// The export format. Valid values: CSV, Parquet.
	// +kubebuilder:validation:Required
	format?: null | string @go(Format,*string)

	// The schema version of the export file. Valid values: V_1.
	// +kubebuilder:validation:Required
	outputSchemaVersion?: null | string @go(OutputSchemaVersion,*string)

	// The prefix of the destination bucket where the metrics export will be delivered.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)
}

#SelectionCriteriaObservation: {
}

#SelectionCriteriaParameters: {
	// The delimiter of the selection criteria being used.
	// +kubebuilder:validation:Optional
	delimiter?: null | string @go(Delimiter,*string)

	// The max depth of the selection criteria.
	// +kubebuilder:validation:Optional
	maxDepth?: null | float64 @go(MaxDepth,*float64)

	// The minimum number of storage bytes percentage whose metrics will be selected.
	// +kubebuilder:validation:Optional
	minStorageBytesPercentage?: null | float64 @go(MinStorageBytesPercentage,*float64)
}

#SseKMSObservation: {
}

#SseKMSParameters: {
	// KMS key ARN.
	// +kubebuilder:validation:Required
	keyId?: null | string @go(KeyID,*string)
}

#SseS3Observation: {
}

#SseS3Parameters: {
}

#StorageLensConfigurationObservation: {
	// Amazon Resource Name (ARN) of the S3 Storage Lens configuration.
	arn?: null | string @go(Arn,*string)
	id?:  null | string @go(ID,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#StorageLensConfigurationParameters: {
	// The AWS account ID for the S3 Storage Lens configuration.
	// +kubebuilder:validation:Optional
	accountId?: null | string @go(AccountID,*string)

	// The ID of the S3 Storage Lens configuration.
	// +kubebuilder:validation:Required
	configId?: null | string @go(ConfigID,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The S3 Storage Lens configuration. See Storage Lens Configuration below for more details.
	// +kubebuilder:validation:Required
	storageLensConfiguration: [...#StorageLensConfigurationStorageLensConfigurationParameters] @go(StorageLensConfiguration,[]StorageLensConfigurationStorageLensConfigurationParameters)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#StorageLensConfigurationStorageLensConfigurationObservation: {
}

#StorageLensConfigurationStorageLensConfigurationParameters: {
	// level configurations of the S3 Storage Lens configuration. See Account Level below for more details.
	// +kubebuilder:validation:Required
	accountLevel: [...#AccountLevelParameters] @go(AccountLevel,[]AccountLevelParameters)

	// The Amazon Web Services organization for the S3 Storage Lens configuration. See AWS Org below for more details.
	// +kubebuilder:validation:Optional
	awsOrg?: [...#AwsOrgParameters] @go(AwsOrg,[]AwsOrgParameters)

	// Properties of S3 Storage Lens metrics export including the destination, schema and format. See Data Export below for more details.
	// +kubebuilder:validation:Optional
	dataExport?: [...#DataExportParameters] @go(DataExport,[]DataExportParameters)

	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Required
	enabled?: null | bool @go(Enabled,*bool)

	// What is excluded in this configuration. Conflicts with include. See Exclude below for more details.
	// +kubebuilder:validation:Optional
	exclude?: [...#ExcludeParameters] @go(Exclude,[]ExcludeParameters)

	// What is included in this configuration. Conflicts with exclude. See Include below for more details.
	// +kubebuilder:validation:Optional
	include?: [...#IncludeParameters] @go(Include,[]IncludeParameters)
}

#StorageMetricsObservation: {
}

#StorageMetricsParameters: {
	// Whether the S3 Storage Lens configuration is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// Selection criteria. See Selection Criteria below for more details.
	// +kubebuilder:validation:Optional
	selectionCriteria?: [...#SelectionCriteriaParameters] @go(SelectionCriteria,[]SelectionCriteriaParameters)
}

// StorageLensConfigurationSpec defines the desired state of StorageLensConfiguration
#StorageLensConfigurationSpec: {
	forProvider: #StorageLensConfigurationParameters @go(ForProvider)
}

// StorageLensConfigurationStatus defines the observed state of StorageLensConfiguration.
#StorageLensConfigurationStatus: {
	atProvider?: #StorageLensConfigurationObservation @go(AtProvider)
}

// StorageLensConfiguration is the Schema for the StorageLensConfigurations API. Provides a resource to manage an S3 Storage Lens configuration.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#StorageLensConfiguration: {
	spec:    #StorageLensConfigurationSpec   @go(Spec)
	status?: #StorageLensConfigurationStatus @go(Status)
}

// StorageLensConfigurationList contains a list of StorageLensConfigurations
#StorageLensConfigurationList: {
	items: [...#StorageLensConfiguration] @go(Items,[]StorageLensConfiguration)
}