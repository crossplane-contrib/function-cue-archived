// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

#DailyScheduleObservation: {
	// The number of days between snapshots.
	daysInCycle?: null | float64 @go(DaysInCycle,*float64)

	// Time within the window to start the operations.
	// It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.
	startTime?: null | string @go(StartTime,*string)
}

#DailyScheduleParameters: {
	// The number of days between snapshots.
	// +kubebuilder:validation:Required
	daysInCycle?: null | float64 @go(DaysInCycle,*float64)

	// Time within the window to start the operations.
	// It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.
	// +kubebuilder:validation:Required
	startTime?: null | string @go(StartTime,*string)
}

#DayOfWeeksObservation: {
	// The day of the week to create the snapshot. e.g. MONDAY
	// Possible values are: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.
	day?: null | string @go(Day,*string)

	// Time within the window to start the operations.
	// It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.
	startTime?: null | string @go(StartTime,*string)
}

#DayOfWeeksParameters: {
	// The day of the week to create the snapshot. e.g. MONDAY
	// Possible values are: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.
	// +kubebuilder:validation:Required
	day?: null | string @go(Day,*string)

	// Time within the window to start the operations.
	// It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.
	// +kubebuilder:validation:Required
	startTime?: null | string @go(StartTime,*string)
}

#GroupPlacementPolicyObservation: {
	// The number of availability domains instances will be spread across. If two instances are in different
	// availability domain, they will not be put in the same low latency network
	availabilityDomainCount?: null | float64 @go(AvailabilityDomainCount,*float64)

	// Collocation specifies whether to place VMs inside the same availability domain on the same low-latency network.
	// Specify COLLOCATED to enable collocation. Can only be specified with vm_count. If compute instances are created
	// with a COLLOCATED policy, then exactly vm_count instances must be created at the same time with the resource policy
	// attached.
	// Possible values are: COLLOCATED.
	collocation?: null | string @go(Collocation,*string)

	// Number of VMs in this placement group. Google does not recommend that you use this field
	// unless you use a compact policy and you want your policy to work only if it contains this
	// exact number of VMs.
	vmCount?: null | float64 @go(VMCount,*float64)
}

#GroupPlacementPolicyParameters: {
	// The number of availability domains instances will be spread across. If two instances are in different
	// availability domain, they will not be put in the same low latency network
	// +kubebuilder:validation:Optional
	availabilityDomainCount?: null | float64 @go(AvailabilityDomainCount,*float64)

	// Collocation specifies whether to place VMs inside the same availability domain on the same low-latency network.
	// Specify COLLOCATED to enable collocation. Can only be specified with vm_count. If compute instances are created
	// with a COLLOCATED policy, then exactly vm_count instances must be created at the same time with the resource policy
	// attached.
	// Possible values are: COLLOCATED.
	// +kubebuilder:validation:Optional
	collocation?: null | string @go(Collocation,*string)

	// Number of VMs in this placement group. Google does not recommend that you use this field
	// unless you use a compact policy and you want your policy to work only if it contains this
	// exact number of VMs.
	// +kubebuilder:validation:Optional
	vmCount?: null | float64 @go(VMCount,*float64)
}

#HourlyScheduleObservation: {
	// The number of hours between snapshots.
	hoursInCycle?: null | float64 @go(HoursInCycle,*float64)

	// Time within the window to start the operations.
	// It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.
	startTime?: null | string @go(StartTime,*string)
}

#HourlyScheduleParameters: {
	// The number of hours between snapshots.
	// +kubebuilder:validation:Required
	hoursInCycle?: null | float64 @go(HoursInCycle,*float64)

	// Time within the window to start the operations.
	// It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.
	// +kubebuilder:validation:Required
	startTime?: null | string @go(StartTime,*string)
}

#InstanceSchedulePolicyObservation: {
	// The expiration time of the schedule. The timestamp is an RFC3339 string.
	expirationTime?: null | string @go(ExpirationTime,*string)

	// The start time of the schedule. The timestamp is an RFC3339 string.
	startTime?: null | string @go(StartTime,*string)

	// Specifies the time zone to be used in interpreting the schedule. The value of this field must be a time zone name
	// from the tz database: http://en.wikipedia.org/wiki/Tz_database.
	timeZone?: null | string @go(TimeZone,*string)

	// Specifies the schedule for starting instances.
	// Structure is documented below.
	vmStartSchedule?: [...#VMStartScheduleObservation] @go(VMStartSchedule,[]VMStartScheduleObservation)

	// Specifies the schedule for stopping instances.
	// Structure is documented below.
	vmStopSchedule?: [...#VMStopScheduleObservation] @go(VMStopSchedule,[]VMStopScheduleObservation)
}

#InstanceSchedulePolicyParameters: {
	// The expiration time of the schedule. The timestamp is an RFC3339 string.
	// +kubebuilder:validation:Optional
	expirationTime?: null | string @go(ExpirationTime,*string)

	// The start time of the schedule. The timestamp is an RFC3339 string.
	// +kubebuilder:validation:Optional
	startTime?: null | string @go(StartTime,*string)

	// Specifies the time zone to be used in interpreting the schedule. The value of this field must be a time zone name
	// from the tz database: http://en.wikipedia.org/wiki/Tz_database.
	// +kubebuilder:validation:Required
	timeZone?: null | string @go(TimeZone,*string)

	// Specifies the schedule for starting instances.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	vmStartSchedule?: [...#VMStartScheduleParameters] @go(VMStartSchedule,[]VMStartScheduleParameters)

	// Specifies the schedule for stopping instances.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	vmStopSchedule?: [...#VMStopScheduleParameters] @go(VMStopSchedule,[]VMStopScheduleParameters)
}

#ResourcePolicyObservation: {
	// An optional description of this resource. Provide this property when you create the resource.
	description?: null | string @go(Description,*string)

	// Resource policy for instances used for placement configuration.
	// Structure is documented below.
	groupPlacementPolicy?: [...#GroupPlacementPolicyObservation] @go(GroupPlacementPolicy,[]GroupPlacementPolicyObservation)

	// an identifier for the resource with format projects/{{project}}/regions/{{region}}/resourcePolicies/{{name}}
	id?: null | string @go(ID,*string)

	// Resource policy for scheduling instance operations.
	// Structure is documented below.
	instanceSchedulePolicy?: [...#InstanceSchedulePolicyObservation] @go(InstanceSchedulePolicy,[]InstanceSchedulePolicyObservation)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Region where resource policy resides.
	region?: null | string @go(Region,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)

	// Policy for creating snapshots of persistent disks.
	// Structure is documented below.
	snapshotSchedulePolicy?: [...#SnapshotSchedulePolicyObservation] @go(SnapshotSchedulePolicy,[]SnapshotSchedulePolicyObservation)
}

#ResourcePolicyParameters: {
	// An optional description of this resource. Provide this property when you create the resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Resource policy for instances used for placement configuration.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	groupPlacementPolicy?: [...#GroupPlacementPolicyParameters] @go(GroupPlacementPolicy,[]GroupPlacementPolicyParameters)

	// Resource policy for scheduling instance operations.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	instanceSchedulePolicy?: [...#InstanceSchedulePolicyParameters] @go(InstanceSchedulePolicy,[]InstanceSchedulePolicyParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Region where resource policy resides.
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Policy for creating snapshots of persistent disks.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	snapshotSchedulePolicy?: [...#SnapshotSchedulePolicyParameters] @go(SnapshotSchedulePolicy,[]SnapshotSchedulePolicyParameters)
}

#RetentionPolicyObservation: {
	// Maximum age of the snapshot that is allowed to be kept.
	maxRetentionDays?: null | float64 @go(MaxRetentionDays,*float64)

	// Specifies the behavior to apply to scheduled snapshots when
	// the source disk is deleted.
	// Default value is KEEP_AUTO_SNAPSHOTS.
	// Possible values are: KEEP_AUTO_SNAPSHOTS, APPLY_RETENTION_POLICY.
	onSourceDiskDelete?: null | string @go(OnSourceDiskDelete,*string)
}

#RetentionPolicyParameters: {
	// Maximum age of the snapshot that is allowed to be kept.
	// +kubebuilder:validation:Required
	maxRetentionDays?: null | float64 @go(MaxRetentionDays,*float64)

	// Specifies the behavior to apply to scheduled snapshots when
	// the source disk is deleted.
	// Default value is KEEP_AUTO_SNAPSHOTS.
	// Possible values are: KEEP_AUTO_SNAPSHOTS, APPLY_RETENTION_POLICY.
	// +kubebuilder:validation:Optional
	onSourceDiskDelete?: null | string @go(OnSourceDiskDelete,*string)
}

#ScheduleObservation: {
	// The policy will execute every nth day at the specified time.
	// Structure is documented below.
	dailySchedule?: [...#DailyScheduleObservation] @go(DailySchedule,[]DailyScheduleObservation)

	// The policy will execute every nth hour starting at the specified time.
	// Structure is documented below.
	hourlySchedule?: [...#HourlyScheduleObservation] @go(HourlySchedule,[]HourlyScheduleObservation)

	// Allows specifying a snapshot time for each day of the week.
	// Structure is documented below.
	weeklySchedule?: [...#WeeklyScheduleObservation] @go(WeeklySchedule,[]WeeklyScheduleObservation)
}

#ScheduleParameters: {
	// The policy will execute every nth day at the specified time.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	dailySchedule?: [...#DailyScheduleParameters] @go(DailySchedule,[]DailyScheduleParameters)

	// The policy will execute every nth hour starting at the specified time.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	hourlySchedule?: [...#HourlyScheduleParameters] @go(HourlySchedule,[]HourlyScheduleParameters)

	// Allows specifying a snapshot time for each day of the week.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	weeklySchedule?: [...#WeeklyScheduleParameters] @go(WeeklySchedule,[]WeeklyScheduleParameters)
}

#SnapshotPropertiesObservation: {
	// Creates the new snapshot in the snapshot chain labeled with the
	// specified name. The chain name must be 1-63 characters long and comply
	// with RFC1035.
	chainName?: null | string @go(ChainName,*string)

	// Whether to perform a 'guest aware' snapshot.
	guestFlush?: null | bool @go(GuestFlush,*bool)

	// A set of key-value pairs.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Cloud Storage bucket location to store the auto snapshot
	// (regional or multi-regional)
	storageLocations?: [...null | string] @go(StorageLocations,[]*string)
}

#SnapshotPropertiesParameters: {
	// Creates the new snapshot in the snapshot chain labeled with the
	// specified name. The chain name must be 1-63 characters long and comply
	// with RFC1035.
	// +kubebuilder:validation:Optional
	chainName?: null | string @go(ChainName,*string)

	// Whether to perform a 'guest aware' snapshot.
	// +kubebuilder:validation:Optional
	guestFlush?: null | bool @go(GuestFlush,*bool)

	// A set of key-value pairs.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Cloud Storage bucket location to store the auto snapshot
	// (regional or multi-regional)
	// +kubebuilder:validation:Optional
	storageLocations?: [...null | string] @go(StorageLocations,[]*string)
}

#SnapshotSchedulePolicyObservation: {
	// Retention policy applied to snapshots created by this resource policy.
	// Structure is documented below.
	retentionPolicy?: [...#RetentionPolicyObservation] @go(RetentionPolicy,[]RetentionPolicyObservation)

	// Contains one of an hourlySchedule, dailySchedule, or weeklySchedule.
	// Structure is documented below.
	schedule?: [...#ScheduleObservation] @go(Schedule,[]ScheduleObservation)

	// Properties with which the snapshots are created, such as labels.
	// Structure is documented below.
	snapshotProperties?: [...#SnapshotPropertiesObservation] @go(SnapshotProperties,[]SnapshotPropertiesObservation)
}

#SnapshotSchedulePolicyParameters: {
	// Retention policy applied to snapshots created by this resource policy.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	retentionPolicy?: [...#RetentionPolicyParameters] @go(RetentionPolicy,[]RetentionPolicyParameters)

	// Contains one of an hourlySchedule, dailySchedule, or weeklySchedule.
	// Structure is documented below.
	// +kubebuilder:validation:Required
	schedule: [...#ScheduleParameters] @go(Schedule,[]ScheduleParameters)

	// Properties with which the snapshots are created, such as labels.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	snapshotProperties?: [...#SnapshotPropertiesParameters] @go(SnapshotProperties,[]SnapshotPropertiesParameters)
}

#VMStartScheduleObservation: {
	// Specifies the frequency for the operation, using the unix-cron format.
	schedule?: null | string @go(Schedule,*string)
}

#VMStartScheduleParameters: {
	// Specifies the frequency for the operation, using the unix-cron format.
	// +kubebuilder:validation:Required
	schedule?: null | string @go(Schedule,*string)
}

#VMStopScheduleObservation: {
	// Specifies the frequency for the operation, using the unix-cron format.
	schedule?: null | string @go(Schedule,*string)
}

#VMStopScheduleParameters: {
	// Specifies the frequency for the operation, using the unix-cron format.
	// +kubebuilder:validation:Required
	schedule?: null | string @go(Schedule,*string)
}

#WeeklyScheduleObservation: {
	// May contain up to seven (one for each day of the week) snapshot times.
	// Structure is documented below.
	dayOfWeeks?: [...#DayOfWeeksObservation] @go(DayOfWeeks,[]DayOfWeeksObservation)
}

#WeeklyScheduleParameters: {
	// May contain up to seven (one for each day of the week) snapshot times.
	// Structure is documented below.
	// +kubebuilder:validation:Required
	dayOfWeeks: [...#DayOfWeeksParameters] @go(DayOfWeeks,[]DayOfWeeksParameters)
}

// ResourcePolicySpec defines the desired state of ResourcePolicy
#ResourcePolicySpec: {
	forProvider: #ResourcePolicyParameters @go(ForProvider)
}

// ResourcePolicyStatus defines the observed state of ResourcePolicy.
#ResourcePolicyStatus: {
	atProvider?: #ResourcePolicyObservation @go(AtProvider)
}

// ResourcePolicy is the Schema for the ResourcePolicys API. A policy that can be attached to a resource to specify or schedule actions on that resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ResourcePolicy: {
	spec:    #ResourcePolicySpec   @go(Spec)
	status?: #ResourcePolicyStatus @go(Status)
}

// ResourcePolicyList contains a list of ResourcePolicys
#ResourcePolicyList: {
	items: [...#ResourcePolicy] @go(Items,[]ResourcePolicy)
}