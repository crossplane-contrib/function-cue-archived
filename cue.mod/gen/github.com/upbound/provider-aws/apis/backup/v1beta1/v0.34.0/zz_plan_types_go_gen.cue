// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/backup/v1beta1

package v1beta1

#AdvancedBackupSettingObservation: {
	// Specifies the backup option for a selected resource. This option is only available for Windows VSS backup jobs. Set to { WindowsVSS = "enabled" } to enable Windows VSS backup option and create a VSS Windows backup.
	backupOptions?: {[string]: null | string} @go(BackupOptions,map[string]*string)

	// The type of AWS resource to be backed up. For VSS Windows backups, the only supported resource type is Amazon EC2. Valid values: EC2.
	resourceType?: null | string @go(ResourceType,*string)
}

#AdvancedBackupSettingParameters: {
	// Specifies the backup option for a selected resource. This option is only available for Windows VSS backup jobs. Set to { WindowsVSS = "enabled" } to enable Windows VSS backup option and create a VSS Windows backup.
	// +kubebuilder:validation:Required
	backupOptions: {[string]: null | string} @go(BackupOptions,map[string]*string)

	// The type of AWS resource to be backed up. For VSS Windows backups, the only supported resource type is Amazon EC2. Valid values: EC2.
	// +kubebuilder:validation:Required
	resourceType?: null | string @go(ResourceType,*string)
}

#CopyActionObservation: {
	// An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied backup.
	destinationVaultArn?: null | string @go(DestinationVaultArn,*string)

	// The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.  Fields documented below.
	lifecycle?: [...#LifecycleObservation] @go(Lifecycle,[]LifecycleObservation)
}

#CopyActionParameters: {
	// An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied backup.
	// +kubebuilder:validation:Required
	destinationVaultArn?: null | string @go(DestinationVaultArn,*string)

	// The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.  Fields documented below.
	// +kubebuilder:validation:Optional
	lifecycle?: [...#LifecycleParameters] @go(Lifecycle,[]LifecycleParameters)
}

#LifecycleObservation: {
	// Specifies the number of days after creation that a recovery point is moved to cold storage.
	coldStorageAfter?: null | float64 @go(ColdStorageAfter,*float64)

	// Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after.
	deleteAfter?: null | float64 @go(DeleteAfter,*float64)
}

#LifecycleParameters: {
	// Specifies the number of days after creation that a recovery point is moved to cold storage.
	// +kubebuilder:validation:Optional
	coldStorageAfter?: null | float64 @go(ColdStorageAfter,*float64)

	// Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after.
	// +kubebuilder:validation:Optional
	deleteAfter?: null | float64 @go(DeleteAfter,*float64)
}

#PlanObservation: {
	// An object that specifies backup options for each resource type.
	advancedBackupSetting?: [...#AdvancedBackupSettingObservation] @go(AdvancedBackupSetting,[]AdvancedBackupSettingObservation)

	// The ARN of the backup plan.
	arn?: null | string @go(Arn,*string)

	// The id of the backup plan.
	id?: null | string @go(ID,*string)

	// The display name of a backup plan.
	name?: null | string @go(Name,*string)

	// A rule object that specifies a scheduled task that is used to back up a selection of resources.
	rule?: [...#RuleObservation] @go(Rule,[]RuleObservation)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// Unique, randomly generated, Unicode, UTF-8 encoded string that serves as the version ID of the backup plan.
	version?: null | string @go(Version,*string)
}

#PlanParameters: {
	// An object that specifies backup options for each resource type.
	// +kubebuilder:validation:Optional
	advancedBackupSetting?: [...#AdvancedBackupSettingParameters] @go(AdvancedBackupSetting,[]AdvancedBackupSettingParameters)

	// The display name of a backup plan.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// A rule object that specifies a scheduled task that is used to back up a selection of resources.
	// +kubebuilder:validation:Optional
	rule?: [...#RuleParameters] @go(Rule,[]RuleParameters)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#RuleLifecycleObservation: {
	// Specifies the number of days after creation that a recovery point is moved to cold storage.
	coldStorageAfter?: null | float64 @go(ColdStorageAfter,*float64)

	// Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after.
	deleteAfter?: null | float64 @go(DeleteAfter,*float64)
}

#RuleLifecycleParameters: {
	// Specifies the number of days after creation that a recovery point is moved to cold storage.
	// +kubebuilder:validation:Optional
	coldStorageAfter?: null | float64 @go(ColdStorageAfter,*float64)

	// Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after.
	// +kubebuilder:validation:Optional
	deleteAfter?: null | float64 @go(DeleteAfter,*float64)
}

#RuleObservation: {
	// The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error.
	completionWindow?: null | float64 @go(CompletionWindow,*float64)

	// Configuration block(s) with copy operation settings. Detailed below.
	copyAction?: [...#CopyActionObservation] @go(CopyAction,[]CopyActionObservation)

	// Enable continuous backups for supported resources.
	enableContinuousBackup?: null | bool @go(EnableContinuousBackup,*bool)

	// The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.  Fields documented below.
	lifecycle?: [...#RuleLifecycleObservation] @go(Lifecycle,[]RuleLifecycleObservation)

	// Metadata that you can assign to help organize the resources that you create.
	recoveryPointTags?: {[string]: null | string} @go(RecoveryPointTags,map[string]*string)

	// An display name for a backup rule.
	ruleName?: null | string @go(RuleName,*string)

	// A CRON expression specifying when AWS Backup initiates a backup job.
	schedule?: null | string @go(Schedule,*string)

	// The amount of time in minutes before beginning a backup.
	startWindow?: null | float64 @go(StartWindow,*float64)

	// The name of a logical container where backups are stored.
	targetVaultName?: null | string @go(TargetVaultName,*string)
}

#RuleParameters: {
	// The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error.
	// +kubebuilder:validation:Optional
	completionWindow?: null | float64 @go(CompletionWindow,*float64)

	// Configuration block(s) with copy operation settings. Detailed below.
	// +kubebuilder:validation:Optional
	copyAction?: [...#CopyActionParameters] @go(CopyAction,[]CopyActionParameters)

	// Enable continuous backups for supported resources.
	// +kubebuilder:validation:Optional
	enableContinuousBackup?: null | bool @go(EnableContinuousBackup,*bool)

	// The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.  Fields documented below.
	// +kubebuilder:validation:Optional
	lifecycle?: [...#RuleLifecycleParameters] @go(Lifecycle,[]RuleLifecycleParameters)

	// Metadata that you can assign to help organize the resources that you create.
	// +kubebuilder:validation:Optional
	recoveryPointTags?: {[string]: null | string} @go(RecoveryPointTags,map[string]*string)

	// An display name for a backup rule.
	// +kubebuilder:validation:Required
	ruleName?: null | string @go(RuleName,*string)

	// A CRON expression specifying when AWS Backup initiates a backup job.
	// +kubebuilder:validation:Optional
	schedule?: null | string @go(Schedule,*string)

	// The amount of time in minutes before beginning a backup.
	// +kubebuilder:validation:Optional
	startWindow?: null | float64 @go(StartWindow,*float64)

	// The name of a logical container where backups are stored.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/backup/v1beta1.Vault
	// +kubebuilder:validation:Optional
	targetVaultName?: null | string @go(TargetVaultName,*string)
}

// PlanSpec defines the desired state of Plan
#PlanSpec: {
	forProvider: #PlanParameters @go(ForProvider)
}

// PlanStatus defines the observed state of Plan.
#PlanStatus: {
	atProvider?: #PlanObservation @go(AtProvider)
}

// Plan is the Schema for the Plans API. Provides an AWS Backup plan resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Plan: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.rule)",message="rule is a required parameter"
	spec:    #PlanSpec   @go(Spec)
	status?: #PlanStatus @go(Status)
}

// PlanList contains a list of Plans
#PlanList: {
	items: [...#Plan] @go(Items,[]Plan)
}