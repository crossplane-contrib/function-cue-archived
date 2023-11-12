// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/gke/v1beta1

package v1beta1

#BackupBackupPlanObservation: {
	// Defines the configuration of Backups created via this BackupPlan.
	// Structure is documented below.
	backupConfig?: [...#BackupConfigObservation] @go(BackupConfig,[]BackupConfigObservation)

	// Defines a schedule for automatic Backup creation via this BackupPlan.
	// Structure is documented below.
	backupSchedule?: [...#BackupScheduleObservation] @go(BackupSchedule,[]BackupScheduleObservation)

	// The source cluster from which Backups will be created via this BackupPlan.
	cluster?: null | string @go(Cluster,*string)

	// This flag indicates whether this BackupPlan has been deactivated.
	// Setting this field to True locks the BackupPlan such that no further updates will be allowed
	// (except deletes), including the deactivated field itself. It also prevents any new Backups
	// from being created via this BackupPlan (including scheduled Backups).
	deactivated?: null | bool @go(Deactivated,*bool)

	// User specified descriptive string for this BackupPlan.
	description?: null | string @go(Description,*string)

	// etag is used for optimistic concurrency control as a way to help prevent simultaneous
	// updates of a backup plan from overwriting each other. It is strongly suggested that
	// systems make use of the 'etag' in the read-modify-write cycle to perform BackupPlan updates
	// in order to avoid race conditions: An etag is returned in the response to backupPlans.get,
	// and systems are expected to put that etag in the request to backupPlans.patch or
	// backupPlans.delete to ensure that their change will be applied to the same version of the resource.
	etag?: null | string @go(Etag,*string)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/backupPlans/{{name}}
	id?: null | string @go(ID,*string)

	// Description: A set of custom labels supplied by the user.
	// A list of key->value pairs.
	// Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The region of the Backup Plan.
	location?: null | string @go(Location,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The number of Kubernetes Pods backed up in the last successful Backup created via this BackupPlan.
	protectedPodCount?: null | float64 @go(ProtectedPodCount,*float64)

	// RetentionPolicy governs lifecycle of Backups created under this plan.
	// Structure is documented below.
	retentionPolicy?: [...#RetentionPolicyObservation] @go(RetentionPolicy,[]RetentionPolicyObservation)

	// Server generated, unique identifier of UUID format.
	uid?: null | string @go(UID,*string)
}

#BackupBackupPlanParameters: {
	// Defines the configuration of Backups created via this BackupPlan.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	backupConfig?: [...#BackupConfigParameters] @go(BackupConfig,[]BackupConfigParameters)

	// Defines a schedule for automatic Backup creation via this BackupPlan.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	backupSchedule?: [...#BackupScheduleParameters] @go(BackupSchedule,[]BackupScheduleParameters)

	// The source cluster from which Backups will be created via this BackupPlan.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/container/v1beta1.Cluster
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	cluster?: null | string @go(Cluster,*string)

	// This flag indicates whether this BackupPlan has been deactivated.
	// Setting this field to True locks the BackupPlan such that no further updates will be allowed
	// (except deletes), including the deactivated field itself. It also prevents any new Backups
	// from being created via this BackupPlan (including scheduled Backups).
	// +kubebuilder:validation:Optional
	deactivated?: null | bool @go(Deactivated,*bool)

	// User specified descriptive string for this BackupPlan.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Description: A set of custom labels supplied by the user.
	// A list of key->value pairs.
	// Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The region of the Backup Plan.
	// +kubebuilder:validation:Required
	location?: null | string @go(Location,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// RetentionPolicy governs lifecycle of Backups created under this plan.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	retentionPolicy?: [...#RetentionPolicyParameters] @go(RetentionPolicy,[]RetentionPolicyParameters)
}

#BackupConfigObservation: {
	// If True, include all namespaced resources.
	allNamespaces?: null | bool @go(AllNamespaces,*bool)

	// This defines a customer managed encryption key that will be used to encrypt the "config"
	// portion (the Kubernetes resources) of Backups created via this plan.
	// Structure is documented below.
	encryptionKey?: [...#EncryptionKeyObservation] @go(EncryptionKey,[]EncryptionKeyObservation)

	// This flag specifies whether Kubernetes Secret resources should be included
	// when they fall into the scope of Backups.
	includeSecrets?: null | bool @go(IncludeSecrets,*bool)

	// This flag specifies whether volume data should be backed up when PVCs are
	// included in the scope of a Backup.
	includeVolumeData?: null | bool @go(IncludeVolumeData,*bool)

	// A list of namespaced Kubernetes Resources.
	// Structure is documented below.
	selectedApplications?: [...#SelectedApplicationsObservation] @go(SelectedApplications,[]SelectedApplicationsObservation)

	// If set, include just the resources in the listed namespaces.
	// Structure is documented below.
	selectedNamespaces?: [...#SelectedNamespacesObservation] @go(SelectedNamespaces,[]SelectedNamespacesObservation)
}

#BackupConfigParameters: {
	// If True, include all namespaced resources.
	// +kubebuilder:validation:Optional
	allNamespaces?: null | bool @go(AllNamespaces,*bool)

	// This defines a customer managed encryption key that will be used to encrypt the "config"
	// portion (the Kubernetes resources) of Backups created via this plan.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	encryptionKey?: [...#EncryptionKeyParameters] @go(EncryptionKey,[]EncryptionKeyParameters)

	// This flag specifies whether Kubernetes Secret resources should be included
	// when they fall into the scope of Backups.
	// +kubebuilder:validation:Optional
	includeSecrets?: null | bool @go(IncludeSecrets,*bool)

	// This flag specifies whether volume data should be backed up when PVCs are
	// included in the scope of a Backup.
	// +kubebuilder:validation:Optional
	includeVolumeData?: null | bool @go(IncludeVolumeData,*bool)

	// A list of namespaced Kubernetes Resources.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	selectedApplications?: [...#SelectedApplicationsParameters] @go(SelectedApplications,[]SelectedApplicationsParameters)

	// If set, include just the resources in the listed namespaces.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	selectedNamespaces?: [...#SelectedNamespacesParameters] @go(SelectedNamespaces,[]SelectedNamespacesParameters)
}

#BackupScheduleObservation: {
	// A standard cron string that defines a repeating schedule for
	// creating Backups via this BackupPlan.
	// If this is defined, then backupRetainDays must also be defined.
	cronSchedule?: null | string @go(CronSchedule,*string)

	// This flag denotes whether automatic Backup creation is paused for this BackupPlan.
	paused?: null | bool @go(Paused,*bool)
}

#BackupScheduleParameters: {
	// A standard cron string that defines a repeating schedule for
	// creating Backups via this BackupPlan.
	// If this is defined, then backupRetainDays must also be defined.
	// +kubebuilder:validation:Optional
	cronSchedule?: null | string @go(CronSchedule,*string)

	// This flag denotes whether automatic Backup creation is paused for this BackupPlan.
	// +kubebuilder:validation:Optional
	paused?: null | bool @go(Paused,*bool)
}

#EncryptionKeyObservation: {
	// Google Cloud KMS encryption key. Format: projects//locations//keyRings//cryptoKeys/
	gcpKmsEncryptionKey?: null | string @go(GCPKMSEncryptionKey,*string)
}

#EncryptionKeyParameters: {
	// Google Cloud KMS encryption key. Format: projects//locations//keyRings//cryptoKeys/
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/kms/v1beta1.CryptoKey
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	gcpKmsEncryptionKey?: null | string @go(GCPKMSEncryptionKey,*string)
}

#NamespacedNamesObservation: {
	// The name of a Kubernetes Resource.
	name?: null | string @go(Name,*string)

	// The namespace of a Kubernetes Resource.
	namespace?: null | string @go(Namespace,*string)
}

#NamespacedNamesParameters: {
	// The name of a Kubernetes Resource.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The namespace of a Kubernetes Resource.
	// +kubebuilder:validation:Required
	namespace?: null | string @go(Namespace,*string)
}

#RetentionPolicyObservation: {
	// Minimum age for a Backup created via this BackupPlan (in days).
	// Must be an integer value between 0-90 (inclusive).
	// A Backup created under this BackupPlan will not be deletable
	// until it reaches Backup's (create time + backup_delete_lock_days).
	// Updating this field of a BackupPlan does not affect existing Backups.
	// Backups created after a successful update will inherit this new value.
	backupDeleteLockDays?: null | float64 @go(BackupDeleteLockDays,*float64)

	// The default maximum age of a Backup created via this BackupPlan.
	// This field MUST be an integer value >= 0 and <= 365. If specified,
	// a Backup created under this BackupPlan will be automatically deleted
	// after its age reaches (createTime + backupRetainDays).
	// If not specified, Backups created under this BackupPlan will NOT be
	// subject to automatic deletion. Updating this field does NOT affect
	// existing Backups under it. Backups created AFTER a successful update
	// will automatically pick up the new value.
	// NOTE: backupRetainDays must be >= backupDeleteLockDays.
	// If cronSchedule is defined, then this must be <= 360 * the creation interval.]
	backupRetainDays?: null | float64 @go(BackupRetainDays,*float64)

	// This flag denotes whether the retention policy of this BackupPlan is locked.
	// If set to True, no further update is allowed on this policy, including
	// the locked field itself.
	locked?: null | bool @go(Locked,*bool)
}

#RetentionPolicyParameters: {
	// Minimum age for a Backup created via this BackupPlan (in days).
	// Must be an integer value between 0-90 (inclusive).
	// A Backup created under this BackupPlan will not be deletable
	// until it reaches Backup's (create time + backup_delete_lock_days).
	// Updating this field of a BackupPlan does not affect existing Backups.
	// Backups created after a successful update will inherit this new value.
	// +kubebuilder:validation:Optional
	backupDeleteLockDays?: null | float64 @go(BackupDeleteLockDays,*float64)

	// The default maximum age of a Backup created via this BackupPlan.
	// This field MUST be an integer value >= 0 and <= 365. If specified,
	// a Backup created under this BackupPlan will be automatically deleted
	// after its age reaches (createTime + backupRetainDays).
	// If not specified, Backups created under this BackupPlan will NOT be
	// subject to automatic deletion. Updating this field does NOT affect
	// existing Backups under it. Backups created AFTER a successful update
	// will automatically pick up the new value.
	// NOTE: backupRetainDays must be >= backupDeleteLockDays.
	// If cronSchedule is defined, then this must be <= 360 * the creation interval.]
	// +kubebuilder:validation:Optional
	backupRetainDays?: null | float64 @go(BackupRetainDays,*float64)

	// This flag denotes whether the retention policy of this BackupPlan is locked.
	// If set to True, no further update is allowed on this policy, including
	// the locked field itself.
	// +kubebuilder:validation:Optional
	locked?: null | bool @go(Locked,*bool)
}

#SelectedApplicationsObservation: {
	// A list of namespaced Kubernetes resources.
	// Structure is documented below.
	namespacedNames?: [...#NamespacedNamesObservation] @go(NamespacedNames,[]NamespacedNamesObservation)
}

#SelectedApplicationsParameters: {
	// A list of namespaced Kubernetes resources.
	// Structure is documented below.
	// +kubebuilder:validation:Required
	namespacedNames: [...#NamespacedNamesParameters] @go(NamespacedNames,[]NamespacedNamesParameters)
}

#SelectedNamespacesObservation: {
	// A list of Kubernetes Namespaces.
	namespaces?: [...null | string] @go(Namespaces,[]*string)
}

#SelectedNamespacesParameters: {
	// A list of Kubernetes Namespaces.
	// +kubebuilder:validation:Required
	namespaces: [...null | string] @go(Namespaces,[]*string)
}

// BackupBackupPlanSpec defines the desired state of BackupBackupPlan
#BackupBackupPlanSpec: {
	forProvider: #BackupBackupPlanParameters @go(ForProvider)
}

// BackupBackupPlanStatus defines the observed state of BackupBackupPlan.
#BackupBackupPlanStatus: {
	atProvider?: #BackupBackupPlanObservation @go(AtProvider)
}

// BackupBackupPlan is the Schema for the BackupBackupPlans API. Represents a Backup Plan instance.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#BackupBackupPlan: {
	spec:    #BackupBackupPlanSpec   @go(Spec)
	status?: #BackupBackupPlanStatus @go(Status)
}

// BackupBackupPlanList contains a list of BackupBackupPlans
#BackupBackupPlanList: {
	items: [...#BackupBackupPlan] @go(Items,[]BackupBackupPlan)
}