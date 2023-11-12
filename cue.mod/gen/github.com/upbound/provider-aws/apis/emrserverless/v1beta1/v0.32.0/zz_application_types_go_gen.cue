// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/emrserverless/v1beta1

package v1beta1

#ApplicationObservation: {
	// ARN of the cluster.
	arn?: null | string @go(Arn,*string)

	// The ID of the cluster.
	id?: null | string @go(ID,*string)

	// Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#ApplicationParameters: {
	// –  The CPU architecture of an application. Valid values are ARM64 or X86_64. Default value is X86_64.
	// +kubebuilder:validation:Optional
	architecture?: null | string @go(Architecture,*string)

	// –  The configuration for an application to automatically start on job submission.
	// +kubebuilder:validation:Optional
	autoStartConfiguration?: [...#AutoStartConfigurationParameters] @go(AutoStartConfiguration,[]AutoStartConfigurationParameters)

	// –  The configuration for an application to automatically stop after a certain amount of time being idle.
	// +kubebuilder:validation:Optional
	autoStopConfiguration?: [...#AutoStopConfigurationParameters] @go(AutoStopConfiguration,[]AutoStopConfigurationParameters)

	// –  The capacity to initialize when the application is created.
	// +kubebuilder:validation:Optional
	initialCapacity?: [...#InitialCapacityParameters] @go(InitialCapacity,[]InitialCapacityParameters)

	// –  The maximum capacity to allocate when the application is created. This is cumulative across all workers at any given point in time, not just when an application is created. No new resources will be created once any one of the defined limits is hit.
	// +kubebuilder:validation:Optional
	maximumCapacity?: [...#MaximumCapacityParameters] @go(MaximumCapacity,[]MaximumCapacityParameters)

	// –  The name of the application.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// –  The network configuration for customer VPC connectivity.
	// +kubebuilder:validation:Optional
	networkConfiguration?: [...#NetworkConfigurationParameters] @go(NetworkConfiguration,[]NetworkConfigurationParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// –  The EMR release version associated with the application.
	// +kubebuilder:validation:Required
	releaseLabel?: null | string @go(ReleaseLabel,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// –  The type of application you want to start, such as spark or hive.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

#AutoStartConfigurationObservation: {
}

#AutoStartConfigurationParameters: {
	// Enables the application to automatically start on job submission. Defaults to true.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)
}

#AutoStopConfigurationObservation: {
}

#AutoStopConfigurationParameters: {
	// Enables the application to automatically start on job submission. Defaults to true.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// The amount of idle time in minutes after which your application will automatically stop. Defaults to 15 minutes.
	// +kubebuilder:validation:Optional
	idleTimeoutMinutes?: null | float64 @go(IdleTimeoutMinutes,*float64)
}

#InitialCapacityConfigObservation: {
}

#InitialCapacityConfigParameters: {
	// The resource configuration of the initial capacity configuration.
	// +kubebuilder:validation:Optional
	workerConfiguration?: [...#WorkerConfigurationParameters] @go(WorkerConfiguration,[]WorkerConfigurationParameters)

	// The number of workers in the initial capacity configuration.
	// +kubebuilder:validation:Required
	workerCount?: null | float64 @go(WorkerCount,*float64)
}

#InitialCapacityObservation: {
}

#InitialCapacityParameters: {
	// The initial capacity configuration per worker.
	// +kubebuilder:validation:Optional
	initialCapacityConfig?: [...#InitialCapacityConfigParameters] @go(InitialCapacityConfig,[]InitialCapacityConfigParameters)

	// The worker type for an analytics framework. For Spark applications, the key can either be set to Driver or Executor. For Hive applications, it can be set to HiveDriver or TezTask.
	// +kubebuilder:validation:Required
	initialCapacityType?: null | string @go(InitialCapacityType,*string)
}

#MaximumCapacityObservation: {
}

#MaximumCapacityParameters: {
	// The maximum allowed CPU for an application.
	// +kubebuilder:validation:Required
	cpu?: null | string @go(CPU,*string)

	// The maximum allowed disk for an application.
	// +kubebuilder:validation:Optional
	disk?: null | string @go(Disk,*string)

	// The maximum allowed resources for an application.
	// +kubebuilder:validation:Required
	memory?: null | string @go(Memory,*string)
}

#NetworkConfigurationObservation: {
}

#NetworkConfigurationParameters: {
	// The array of security group Ids for customer VPC connectivity.
	// +kubebuilder:validation:Optional
	securityGroupIds?: [...null | string] @go(SecurityGroupIds,[]*string)

	// The array of subnet Ids for customer VPC connectivity.
	// +kubebuilder:validation:Optional
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)
}

#WorkerConfigurationObservation: {
}

#WorkerConfigurationParameters: {
	// The maximum allowed CPU for an application.
	// +kubebuilder:validation:Required
	cpu?: null | string @go(CPU,*string)

	// The maximum allowed disk for an application.
	// +kubebuilder:validation:Optional
	disk?: null | string @go(Disk,*string)

	// The maximum allowed resources for an application.
	// +kubebuilder:validation:Required
	memory?: null | string @go(Memory,*string)
}

// ApplicationSpec defines the desired state of Application
#ApplicationSpec: {
	forProvider: #ApplicationParameters @go(ForProvider)
}

// ApplicationStatus defines the observed state of Application.
#ApplicationStatus: {
	atProvider?: #ApplicationObservation @go(AtProvider)
}

// Application is the Schema for the Applications API. Manages an EMR Serverless Application
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Application: {
	spec:    #ApplicationSpec   @go(Spec)
	status?: #ApplicationStatus @go(Status)
}

// ApplicationList contains a list of Applications
#ApplicationList: {
	items: [...#Application] @go(Items,[]Application)
}