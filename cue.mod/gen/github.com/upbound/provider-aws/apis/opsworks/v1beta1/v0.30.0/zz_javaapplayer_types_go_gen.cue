// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/opsworks/v1beta1

package v1beta1

#JavaAppLayerCloudwatchConfigurationLogStreamsObservation: {
}

#JavaAppLayerCloudwatchConfigurationLogStreamsParameters: {
	// +kubebuilder:validation:Optional
	batchCount?: null | float64 @go(BatchCount,*float64)

	// +kubebuilder:validation:Optional
	batchSize?: null | float64 @go(BatchSize,*float64)

	// +kubebuilder:validation:Optional
	bufferDuration?: null | float64 @go(BufferDuration,*float64)

	// +kubebuilder:validation:Optional
	datetimeFormat?: null | string @go(DatetimeFormat,*string)

	// +kubebuilder:validation:Optional
	encoding?: null | string @go(Encoding,*string)

	// +kubebuilder:validation:Required
	file?: null | string @go(File,*string)

	// +kubebuilder:validation:Optional
	fileFingerprintLines?: null | string @go(FileFingerprintLines,*string)

	// +kubebuilder:validation:Optional
	initialPosition?: null | string @go(InitialPosition,*string)

	// A human-readable name for the layer.
	// +kubebuilder:validation:Required
	logGroupName?: null | string @go(LogGroupName,*string)

	// +kubebuilder:validation:Optional
	multilineStartPattern?: null | string @go(MultilineStartPattern,*string)

	// +kubebuilder:validation:Optional
	timeZone?: null | string @go(TimeZone,*string)
}

#JavaAppLayerCloudwatchConfigurationObservation: {
}

#JavaAppLayerCloudwatchConfigurationParameters: {
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// +kubebuilder:validation:Optional
	logStreams?: [...#JavaAppLayerCloudwatchConfigurationLogStreamsParameters] @go(LogStreams,[]JavaAppLayerCloudwatchConfigurationLogStreamsParameters)
}

#JavaAppLayerEBSVolumeObservation: {
}

#JavaAppLayerEBSVolumeParameters: {
	// +kubebuilder:validation:Optional
	encrypted?: null | bool @go(Encrypted,*bool)

	// For PIOPS volumes, the IOPS per disk.
	// +kubebuilder:validation:Optional
	iops?: null | float64 @go(Iops,*float64)

	// The path to mount the EBS volume on the layer's instances.
	// +kubebuilder:validation:Required
	mountPoint?: null | string @go(MountPoint,*string)

	// The number of disks to use for the EBS volume.
	// +kubebuilder:validation:Required
	numberOfDisks?: null | float64 @go(NumberOfDisks,*float64)

	// The RAID level to use for the volume.
	// +kubebuilder:validation:Optional
	raidLevel?: null | string @go(RaidLevel,*string)

	// The size of the volume in gigabytes.
	// +kubebuilder:validation:Required
	size?: null | float64 @go(Size,*float64)

	// The type of volume to create. This may be standard (the default), io1 or gp2.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#JavaAppLayerLoadBasedAutoScalingDownscalingObservation: {
}

#JavaAppLayerLoadBasedAutoScalingDownscalingParameters: {
	// +kubebuilder:validation:Optional
	alarms?: [...null | string] @go(Alarms,[]*string)

	// +kubebuilder:validation:Optional
	cpuThreshold?: null | float64 @go(CPUThreshold,*float64)

	// +kubebuilder:validation:Optional
	ignoreMetricsTime?: null | float64 @go(IgnoreMetricsTime,*float64)

	// +kubebuilder:validation:Optional
	instanceCount?: null | float64 @go(InstanceCount,*float64)

	// +kubebuilder:validation:Optional
	loadThreshold?: null | float64 @go(LoadThreshold,*float64)

	// +kubebuilder:validation:Optional
	memoryThreshold?: null | float64 @go(MemoryThreshold,*float64)

	// +kubebuilder:validation:Optional
	thresholdsWaitTime?: null | float64 @go(ThresholdsWaitTime,*float64)
}

#JavaAppLayerLoadBasedAutoScalingObservation: {
}

#JavaAppLayerLoadBasedAutoScalingParameters: {
	// +kubebuilder:validation:Optional
	downscaling?: [...#JavaAppLayerLoadBasedAutoScalingDownscalingParameters] @go(Downscaling,[]JavaAppLayerLoadBasedAutoScalingDownscalingParameters)

	// +kubebuilder:validation:Optional
	enable?: null | bool @go(Enable,*bool)

	// +kubebuilder:validation:Optional
	upscaling?: [...#JavaAppLayerLoadBasedAutoScalingUpscalingParameters] @go(Upscaling,[]JavaAppLayerLoadBasedAutoScalingUpscalingParameters)
}

#JavaAppLayerLoadBasedAutoScalingUpscalingObservation: {
}

#JavaAppLayerLoadBasedAutoScalingUpscalingParameters: {
	// +kubebuilder:validation:Optional
	alarms?: [...null | string] @go(Alarms,[]*string)

	// +kubebuilder:validation:Optional
	cpuThreshold?: null | float64 @go(CPUThreshold,*float64)

	// +kubebuilder:validation:Optional
	ignoreMetricsTime?: null | float64 @go(IgnoreMetricsTime,*float64)

	// +kubebuilder:validation:Optional
	instanceCount?: null | float64 @go(InstanceCount,*float64)

	// +kubebuilder:validation:Optional
	loadThreshold?: null | float64 @go(LoadThreshold,*float64)

	// +kubebuilder:validation:Optional
	memoryThreshold?: null | float64 @go(MemoryThreshold,*float64)

	// +kubebuilder:validation:Optional
	thresholdsWaitTime?: null | float64 @go(ThresholdsWaitTime,*float64)
}

#JavaAppLayerObservation: {
	// The Amazon Resource Name(ARN) of the layer.
	arn?: null | string @go(Arn,*string)

	// The id of the layer.
	id?: null | string @go(ID,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#JavaAppLayerParameters: {
	// Keyword for the application container to use. Defaults to "tomcat".
	// +kubebuilder:validation:Optional
	appServer?: null | string @go(AppServer,*string)

	// Version of the selected application container to use. Defaults to "7".
	// +kubebuilder:validation:Optional
	appServerVersion?: null | string @go(AppServerVersion,*string)

	// Whether to automatically assign an elastic IP address to the layer's instances.
	// +kubebuilder:validation:Optional
	autoAssignElasticIps?: null | bool @go(AutoAssignElasticIps,*bool)

	// For stacks belonging to a VPC, whether to automatically assign a public IP address to each of the layer's instances.
	// +kubebuilder:validation:Optional
	autoAssignPublicIps?: null | bool @go(AutoAssignPublicIps,*bool)

	// Whether to enable auto-healing for the layer.
	// +kubebuilder:validation:Optional
	autoHealing?: null | bool @go(AutoHealing,*bool)

	// +kubebuilder:validation:Optional
	cloudwatchConfiguration?: [...#JavaAppLayerCloudwatchConfigurationParameters] @go(CloudwatchConfiguration,[]JavaAppLayerCloudwatchConfigurationParameters)

	// +kubebuilder:validation:Optional
	customConfigureRecipes?: [...null | string] @go(CustomConfigureRecipes,[]*string)

	// +kubebuilder:validation:Optional
	customDeployRecipes?: [...null | string] @go(CustomDeployRecipes,[]*string)

	// The ARN of an IAM profile that will be used for the layer's instances.
	// +kubebuilder:validation:Optional
	customInstanceProfileArn?: null | string @go(CustomInstanceProfileArn,*string)

	// Custom JSON attributes to apply to the layer.
	// +kubebuilder:validation:Optional
	customJson?: null | string @go(CustomJSON,*string)

	// Ids for a set of security groups to apply to the layer's instances.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.SecurityGroup
	// +crossplane:generate:reference:refFieldName=CustomSecurityGroupIDRefs
	// +crossplane:generate:reference:selectorFieldName=CustomSecurityGroupIDSelector
	// +kubebuilder:validation:Optional
	customSecurityGroupIds?: [...null | string] @go(CustomSecurityGroupIds,[]*string)

	// +kubebuilder:validation:Optional
	customSetupRecipes?: [...null | string] @go(CustomSetupRecipes,[]*string)

	// +kubebuilder:validation:Optional
	customShutdownRecipes?: [...null | string] @go(CustomShutdownRecipes,[]*string)

	// +kubebuilder:validation:Optional
	customUndeployRecipes?: [...null | string] @go(CustomUndeployRecipes,[]*string)

	// Whether to enable Elastic Load Balancing connection draining.
	// +kubebuilder:validation:Optional
	drainElbOnShutdown?: null | bool @go(DrainELBOnShutdown,*bool)

	// ebs_volume blocks, as described below, will each create an EBS volume and connect it to the layer's instances.
	// +kubebuilder:validation:Optional
	ebsVolume?: [...#JavaAppLayerEBSVolumeParameters] @go(EBSVolume,[]JavaAppLayerEBSVolumeParameters)

	// Name of an Elastic Load Balancer to attach to this layer
	// +kubebuilder:validation:Optional
	elasticLoadBalancer?: null | string @go(ElasticLoadBalancer,*string)

	// Whether to install OS and package updates on each instance when it boots.
	// +kubebuilder:validation:Optional
	installUpdatesOnBoot?: null | bool @go(InstallUpdatesOnBoot,*bool)

	// The time, in seconds, that OpsWorks will wait for Chef to complete after triggering the Shutdown event.
	// +kubebuilder:validation:Optional
	instanceShutdownTimeout?: null | float64 @go(InstanceShutdownTimeout,*float64)

	// Options to set for the JVM.
	// +kubebuilder:validation:Optional
	jvmOptions?: null | string @go(JvmOptions,*string)

	// Keyword for the type of JVM to use. Defaults to openjdk.
	// +kubebuilder:validation:Optional
	jvmType?: null | string @go(JvmType,*string)

	// Version of JVM to use. Defaults to "7".
	// +kubebuilder:validation:Optional
	jvmVersion?: null | string @go(JvmVersion,*string)

	// +kubebuilder:validation:Optional
	loadBasedAutoScaling?: [...#JavaAppLayerLoadBasedAutoScalingParameters] @go(LoadBasedAutoScaling,[]JavaAppLayerLoadBasedAutoScalingParameters)

	// A human-readable name for the layer.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// ID of the stack the layer will belong to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/opsworks/v1beta1.Stack
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	stackId?: null | string @go(StackID,*string)

	// Names of a set of system packages to install on the layer's instances.
	// +kubebuilder:validation:Optional
	systemPackages?: [...null | string] @go(SystemPackages,[]*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Whether to use EBS-optimized instances.
	// +kubebuilder:validation:Optional
	useEbsOptimizedInstances?: null | bool @go(UseEBSOptimizedInstances,*bool)
}

// JavaAppLayerSpec defines the desired state of JavaAppLayer
#JavaAppLayerSpec: {
	forProvider: #JavaAppLayerParameters @go(ForProvider)
}

// JavaAppLayerStatus defines the observed state of JavaAppLayer.
#JavaAppLayerStatus: {
	atProvider?: #JavaAppLayerObservation @go(AtProvider)
}

// JavaAppLayer is the Schema for the JavaAppLayers API. Provides an OpsWorks Java application layer resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#JavaAppLayer: {
	spec:    #JavaAppLayerSpec   @go(Spec)
	status?: #JavaAppLayerStatus @go(Status)
}

// JavaAppLayerList contains a list of JavaAppLayers
#JavaAppLayerList: {
	items: [...#JavaAppLayer] @go(Items,[]JavaAppLayer)
}