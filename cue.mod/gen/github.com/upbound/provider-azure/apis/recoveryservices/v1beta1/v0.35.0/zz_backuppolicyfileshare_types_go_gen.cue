// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/recoveryservices/v1beta1

package v1beta1

#BackupInitParameters: {
	// Sets the backup frequency. Currently, only Daily is supported
	frequency?: null | string @go(Frequency,*string)

	// The time of day to perform the backup in 24-hour format. Times must be either on the hour or half hour (e.g. 12:00, 12:30, 13:00, etc.)
	time?: null | string @go(Time,*string)
}

#BackupObservation: {
	// Sets the backup frequency. Currently, only Daily is supported
	frequency?: null | string @go(Frequency,*string)

	// The time of day to perform the backup in 24-hour format. Times must be either on the hour or half hour (e.g. 12:00, 12:30, 13:00, etc.)
	time?: null | string @go(Time,*string)
}

#BackupParameters: {
	// Sets the backup frequency. Currently, only Daily is supported
	// +kubebuilder:validation:Optional
	frequency?: null | string @go(Frequency,*string)

	// The time of day to perform the backup in 24-hour format. Times must be either on the hour or half hour (e.g. 12:00, 12:30, 13:00, etc.)
	// +kubebuilder:validation:Optional
	time?: null | string @go(Time,*string)
}

#BackupPolicyFileShareInitParameters: {
	// Configures the Policy backup frequency and times as documented in the backup block below.
	backup?: [...#BackupInitParameters] @go(Backup,[]BackupInitParameters)

	// Configures the policy daily retention as documented in the retention_daily block below.
	retentionDaily?: [...#RetentionDailyInitParameters] @go(RetentionDaily,[]RetentionDailyInitParameters)

	// Configures the policy monthly retention as documented in the retention_monthly block below.
	retentionMonthly?: [...#RetentionMonthlyInitParameters] @go(RetentionMonthly,[]RetentionMonthlyInitParameters)

	// Configures the policy weekly retention as documented in the retention_weekly block below.
	retentionWeekly?: [...#RetentionWeeklyInitParameters] @go(RetentionWeekly,[]RetentionWeeklyInitParameters)

	// Configures the policy yearly retention as documented in the retention_yearly block below.
	retentionYearly?: [...#RetentionYearlyInitParameters] @go(RetentionYearly,[]RetentionYearlyInitParameters)

	// Specifies the timezone. the possible values are defined here. Defaults to UTC
	timezone?: null | string @go(Timezone,*string)
}

#BackupPolicyFileShareObservation: {
	// Configures the Policy backup frequency and times as documented in the backup block below.
	backup?: [...#BackupObservation] @go(Backup,[]BackupObservation)

	// The ID of the Azure File Share Backup Policy.
	id?: null | string @go(ID,*string)

	// Specifies the name of the Recovery Services Vault to use. Changing this forces a new resource to be created.
	recoveryVaultName?: null | string @go(RecoveryVaultName,*string)

	// The name of the resource group in which to create the policy. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// Configures the policy daily retention as documented in the retention_daily block below.
	retentionDaily?: [...#RetentionDailyObservation] @go(RetentionDaily,[]RetentionDailyObservation)

	// Configures the policy monthly retention as documented in the retention_monthly block below.
	retentionMonthly?: [...#RetentionMonthlyObservation] @go(RetentionMonthly,[]RetentionMonthlyObservation)

	// Configures the policy weekly retention as documented in the retention_weekly block below.
	retentionWeekly?: [...#RetentionWeeklyObservation] @go(RetentionWeekly,[]RetentionWeeklyObservation)

	// Configures the policy yearly retention as documented in the retention_yearly block below.
	retentionYearly?: [...#RetentionYearlyObservation] @go(RetentionYearly,[]RetentionYearlyObservation)

	// Specifies the timezone. the possible values are defined here. Defaults to UTC
	timezone?: null | string @go(Timezone,*string)
}

#BackupPolicyFileShareParameters: {
	// Configures the Policy backup frequency and times as documented in the backup block below.
	// +kubebuilder:validation:Optional
	backup?: [...#BackupParameters] @go(Backup,[]BackupParameters)

	// Specifies the name of the Recovery Services Vault to use. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/recoveryservices/v1beta1.Vault
	// +kubebuilder:validation:Optional
	recoveryVaultName?: null | string @go(RecoveryVaultName,*string)

	// The name of the resource group in which to create the policy. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// Configures the policy daily retention as documented in the retention_daily block below.
	// +kubebuilder:validation:Optional
	retentionDaily?: [...#RetentionDailyParameters] @go(RetentionDaily,[]RetentionDailyParameters)

	// Configures the policy monthly retention as documented in the retention_monthly block below.
	// +kubebuilder:validation:Optional
	retentionMonthly?: [...#RetentionMonthlyParameters] @go(RetentionMonthly,[]RetentionMonthlyParameters)

	// Configures the policy weekly retention as documented in the retention_weekly block below.
	// +kubebuilder:validation:Optional
	retentionWeekly?: [...#RetentionWeeklyParameters] @go(RetentionWeekly,[]RetentionWeeklyParameters)

	// Configures the policy yearly retention as documented in the retention_yearly block below.
	// +kubebuilder:validation:Optional
	retentionYearly?: [...#RetentionYearlyParameters] @go(RetentionYearly,[]RetentionYearlyParameters)

	// Specifies the timezone. the possible values are defined here. Defaults to UTC
	// +kubebuilder:validation:Optional
	timezone?: null | string @go(Timezone,*string)
}

#RetentionDailyInitParameters: {
	// The number of daily backups to keep. Must be between 1 and 200 (inclusive)
	count?: null | float64 @go(Count,*float64)
}

#RetentionDailyObservation: {
	// The number of daily backups to keep. Must be between 1 and 200 (inclusive)
	count?: null | float64 @go(Count,*float64)
}

#RetentionDailyParameters: {
	// The number of daily backups to keep. Must be between 1 and 200 (inclusive)
	// +kubebuilder:validation:Optional
	count?: null | float64 @go(Count,*float64)
}

#RetentionMonthlyInitParameters: {
	// The number of monthly backups to keep. Must be between 1 and 120
	count?: null | float64 @go(Count,*float64)

	// The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	weekdays?: [...null | string] @go(Weekdays,[]*string)

	// The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.
	weeks?: [...null | string] @go(Weeks,[]*string)
}

#RetentionMonthlyObservation: {
	// The number of monthly backups to keep. Must be between 1 and 120
	count?: null | float64 @go(Count,*float64)

	// The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	weekdays?: [...null | string] @go(Weekdays,[]*string)

	// The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.
	weeks?: [...null | string] @go(Weeks,[]*string)
}

#RetentionMonthlyParameters: {
	// The number of monthly backups to keep. Must be between 1 and 120
	// +kubebuilder:validation:Optional
	count?: null | float64 @go(Count,*float64)

	// The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	// +kubebuilder:validation:Optional
	weekdays?: [...null | string] @go(Weekdays,[]*string)

	// The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.
	// +kubebuilder:validation:Optional
	weeks?: [...null | string] @go(Weeks,[]*string)
}

#RetentionWeeklyInitParameters: {
	// The number of daily backups to keep. Must be between 1 and 200 (inclusive)
	count?: null | float64 @go(Count,*float64)

	// The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	weekdays?: [...null | string] @go(Weekdays,[]*string)
}

#RetentionWeeklyObservation: {
	// The number of daily backups to keep. Must be between 1 and 200 (inclusive)
	count?: null | float64 @go(Count,*float64)

	// The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	weekdays?: [...null | string] @go(Weekdays,[]*string)
}

#RetentionWeeklyParameters: {
	// The number of daily backups to keep. Must be between 1 and 200 (inclusive)
	// +kubebuilder:validation:Optional
	count?: null | float64 @go(Count,*float64)

	// The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	// +kubebuilder:validation:Optional
	weekdays?: [...null | string] @go(Weekdays,[]*string)
}

#RetentionYearlyInitParameters: {
	// The number of yearly backups to keep. Must be between 1 and 10
	count?: null | float64 @go(Count,*float64)

	// The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, Augest, September, October, November and December.
	months?: [...null | string] @go(Months,[]*string)

	// The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	weekdays?: [...null | string] @go(Weekdays,[]*string)

	// The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.
	weeks?: [...null | string] @go(Weeks,[]*string)
}

#RetentionYearlyObservation: {
	// The number of yearly backups to keep. Must be between 1 and 10
	count?: null | float64 @go(Count,*float64)

	// The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, Augest, September, October, November and December.
	months?: [...null | string] @go(Months,[]*string)

	// The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	weekdays?: [...null | string] @go(Weekdays,[]*string)

	// The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.
	weeks?: [...null | string] @go(Weeks,[]*string)
}

#RetentionYearlyParameters: {
	// The number of yearly backups to keep. Must be between 1 and 10
	// +kubebuilder:validation:Optional
	count?: null | float64 @go(Count,*float64)

	// The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, Augest, September, October, November and December.
	// +kubebuilder:validation:Optional
	months?: [...null | string] @go(Months,[]*string)

	// The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday.
	// +kubebuilder:validation:Optional
	weekdays?: [...null | string] @go(Weekdays,[]*string)

	// The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.
	// +kubebuilder:validation:Optional
	weeks?: [...null | string] @go(Weeks,[]*string)
}

// BackupPolicyFileShareSpec defines the desired state of BackupPolicyFileShare
#BackupPolicyFileShareSpec: {
	forProvider: #BackupPolicyFileShareParameters @go(ForProvider)

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
	initProvider?: #BackupPolicyFileShareInitParameters @go(InitProvider)
}

// BackupPolicyFileShareStatus defines the observed state of BackupPolicyFileShare.
#BackupPolicyFileShareStatus: {
	atProvider?: #BackupPolicyFileShareObservation @go(AtProvider)
}

// BackupPolicyFileShare is the Schema for the BackupPolicyFileShares API. Manages an Azure File Share Backup Policy.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#BackupPolicyFileShare: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.backup) || has(self.initProvider.backup)",message="backup is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.retentionDaily) || has(self.initProvider.retentionDaily)",message="retentionDaily is a required parameter"
	spec:    #BackupPolicyFileShareSpec   @go(Spec)
	status?: #BackupPolicyFileShareStatus @go(Status)
}

// BackupPolicyFileShareList contains a list of BackupPolicyFileShares
#BackupPolicyFileShareList: {
	items: [...#BackupPolicyFileShare] @go(Items,[]BackupPolicyFileShare)
}