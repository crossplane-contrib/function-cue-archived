// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/streamanalytics/v1beta1

package v1beta1

#IdentityInitParameters: {
	// Specifies the type of Managed Service Identity that should be configured on this Stream Analytics Job. The only possible value is SystemAssigned.
	type?: null | string @go(Type,*string)
}

#IdentityObservation: {
	// The Principal ID associated with this Managed Service Identity.
	principalId?: null | string @go(PrincipalID,*string)

	// The Tenant ID associated with this Managed Service Identity.
	tenantId?: null | string @go(TenantID,*string)

	// Specifies the type of Managed Service Identity that should be configured on this Stream Analytics Job. The only possible value is SystemAssigned.
	type?: null | string @go(Type,*string)
}

#IdentityParameters: {
	// Specifies the type of Managed Service Identity that should be configured on this Stream Analytics Job. The only possible value is SystemAssigned.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#JobInitParameters: {
	// Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job. Possible values are 1.0, 1.1 and 1.2.
	compatibilityLevel?: null | string @go(CompatibilityLevel,*string)

	// The policy for storing stream analytics content. Possible values are JobStorageAccount, SystemAccount.
	contentStoragePolicy?: null | string @go(ContentStoragePolicy,*string)

	// Specifies the Data Locale of the Job, which should be a supported .NET Culture.
	dataLocale?: null | string @go(DataLocale,*string)

	// Specifies the maximum tolerable delay in seconds where events arriving late could be included. Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s). Default is 0.
	eventsLateArrivalMaxDelayInSeconds?: null | float64 @go(EventsLateArrivalMaxDelayInSeconds,*float64)

	// Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. Supported range is 0 to 599 (9m 59s). Default is 5.
	eventsOutOfOrderMaxDelayInSeconds?: null | float64 @go(EventsOutOfOrderMaxDelayInSeconds,*float64)

	// Specifies the policy which should be applied to events which arrive out of order in the input event stream. Possible values are Adjust and Drop. Default is Adjust.
	eventsOutOfOrderPolicy?: null | string @go(EventsOutOfOrderPolicy,*string)

	// An identity block as defined below.
	identity?: [...#IdentityInitParameters] @go(Identity,[]IdentityInitParameters)

	// The details of the job storage account. A job_storage_account block as defined below.
	jobStorageAccount?: [...#JobStorageAccountInitParameters] @go(JobStorageAccount,[]JobStorageAccountInitParameters)

	// The Azure Region in which the Resource Group exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size). Possible values are Drop and Stop. Default is Drop.
	outputErrorPolicy?: null | string @go(OutputErrorPolicy,*string)

	// The ID of an existing Stream Analytics Cluster where the Stream Analytics Job should run.
	streamAnalyticsClusterId?: null | string @go(StreamAnalyticsClusterID,*string)

	// Specifies the number of streaming units that the streaming job uses. Supported values are 1, 3, 6 and multiples of 6 up to 120.
	streamingUnits?: null | float64 @go(StreamingUnits,*float64)

	// A mapping of tags assigned to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the query that will be run in the streaming job, written in Stream Analytics Query Language (SAQL).
	transformationQuery?: null | string @go(TransformationQuery,*string)

	// The type of the Stream Analytics Job. Possible values are Cloud and Edge. Defaults to Cloud. Changing this forces a new resource to be created.
	type?: null | string @go(Type,*string)
}

#JobObservation: {
	// Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job. Possible values are 1.0, 1.1 and 1.2.
	compatibilityLevel?: null | string @go(CompatibilityLevel,*string)

	// The policy for storing stream analytics content. Possible values are JobStorageAccount, SystemAccount.
	contentStoragePolicy?: null | string @go(ContentStoragePolicy,*string)

	// Specifies the Data Locale of the Job, which should be a supported .NET Culture.
	dataLocale?: null | string @go(DataLocale,*string)

	// Specifies the maximum tolerable delay in seconds where events arriving late could be included. Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s). Default is 0.
	eventsLateArrivalMaxDelayInSeconds?: null | float64 @go(EventsLateArrivalMaxDelayInSeconds,*float64)

	// Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. Supported range is 0 to 599 (9m 59s). Default is 5.
	eventsOutOfOrderMaxDelayInSeconds?: null | float64 @go(EventsOutOfOrderMaxDelayInSeconds,*float64)

	// Specifies the policy which should be applied to events which arrive out of order in the input event stream. Possible values are Adjust and Drop. Default is Adjust.
	eventsOutOfOrderPolicy?: null | string @go(EventsOutOfOrderPolicy,*string)

	// The ID of the Stream Analytics Job.
	id?: null | string @go(ID,*string)

	// An identity block as defined below.
	identity?: [...#IdentityObservation] @go(Identity,[]IdentityObservation)

	// The Job ID assigned by the Stream Analytics Job.
	jobId?: null | string @go(JobID,*string)

	// The details of the job storage account. A job_storage_account block as defined below.
	jobStorageAccount?: [...#JobStorageAccountObservation] @go(JobStorageAccount,[]JobStorageAccountObservation)

	// The Azure Region in which the Resource Group exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size). Possible values are Drop and Stop. Default is Drop.
	outputErrorPolicy?: null | string @go(OutputErrorPolicy,*string)

	// The name of the Resource Group where the Stream Analytics Job should exist. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The ID of an existing Stream Analytics Cluster where the Stream Analytics Job should run.
	streamAnalyticsClusterId?: null | string @go(StreamAnalyticsClusterID,*string)

	// Specifies the number of streaming units that the streaming job uses. Supported values are 1, 3, 6 and multiples of 6 up to 120.
	streamingUnits?: null | float64 @go(StreamingUnits,*float64)

	// A mapping of tags assigned to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the query that will be run in the streaming job, written in Stream Analytics Query Language (SAQL).
	transformationQuery?: null | string @go(TransformationQuery,*string)

	// The type of the Stream Analytics Job. Possible values are Cloud and Edge. Defaults to Cloud. Changing this forces a new resource to be created.
	type?: null | string @go(Type,*string)
}

#JobParameters: {
	// Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job. Possible values are 1.0, 1.1 and 1.2.
	// +kubebuilder:validation:Optional
	compatibilityLevel?: null | string @go(CompatibilityLevel,*string)

	// The policy for storing stream analytics content. Possible values are JobStorageAccount, SystemAccount.
	// +kubebuilder:validation:Optional
	contentStoragePolicy?: null | string @go(ContentStoragePolicy,*string)

	// Specifies the Data Locale of the Job, which should be a supported .NET Culture.
	// +kubebuilder:validation:Optional
	dataLocale?: null | string @go(DataLocale,*string)

	// Specifies the maximum tolerable delay in seconds where events arriving late could be included. Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s). Default is 0.
	// +kubebuilder:validation:Optional
	eventsLateArrivalMaxDelayInSeconds?: null | float64 @go(EventsLateArrivalMaxDelayInSeconds,*float64)

	// Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. Supported range is 0 to 599 (9m 59s). Default is 5.
	// +kubebuilder:validation:Optional
	eventsOutOfOrderMaxDelayInSeconds?: null | float64 @go(EventsOutOfOrderMaxDelayInSeconds,*float64)

	// Specifies the policy which should be applied to events which arrive out of order in the input event stream. Possible values are Adjust and Drop. Default is Adjust.
	// +kubebuilder:validation:Optional
	eventsOutOfOrderPolicy?: null | string @go(EventsOutOfOrderPolicy,*string)

	// An identity block as defined below.
	// +kubebuilder:validation:Optional
	identity?: [...#IdentityParameters] @go(Identity,[]IdentityParameters)

	// The details of the job storage account. A job_storage_account block as defined below.
	// +kubebuilder:validation:Optional
	jobStorageAccount?: [...#JobStorageAccountParameters] @go(JobStorageAccount,[]JobStorageAccountParameters)

	// The Azure Region in which the Resource Group exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size). Possible values are Drop and Stop. Default is Drop.
	// +kubebuilder:validation:Optional
	outputErrorPolicy?: null | string @go(OutputErrorPolicy,*string)

	// The name of the Resource Group where the Stream Analytics Job should exist. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The ID of an existing Stream Analytics Cluster where the Stream Analytics Job should run.
	// +kubebuilder:validation:Optional
	streamAnalyticsClusterId?: null | string @go(StreamAnalyticsClusterID,*string)

	// Specifies the number of streaming units that the streaming job uses. Supported values are 1, 3, 6 and multiples of 6 up to 120.
	// +kubebuilder:validation:Optional
	streamingUnits?: null | float64 @go(StreamingUnits,*float64)

	// A mapping of tags assigned to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the query that will be run in the streaming job, written in Stream Analytics Query Language (SAQL).
	// +kubebuilder:validation:Optional
	transformationQuery?: null | string @go(TransformationQuery,*string)

	// The type of the Stream Analytics Job. Possible values are Cloud and Edge. Defaults to Cloud. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#JobStorageAccountInitParameters: {
	// The name of the Azure storage account.
	accountName?: null | string @go(AccountName,*string)

	// The authentication mode of the storage account. The only supported value is ConnectionString. Defaults to ConnectionString.
	authenticationMode?: null | string @go(AuthenticationMode,*string)
}

#JobStorageAccountObservation: {
	// The name of the Azure storage account.
	accountName?: null | string @go(AccountName,*string)

	// The authentication mode of the storage account. The only supported value is ConnectionString. Defaults to ConnectionString.
	authenticationMode?: null | string @go(AuthenticationMode,*string)
}

#JobStorageAccountParameters: {
	// The name of the Azure storage account.
	// +kubebuilder:validation:Optional
	accountName?: null | string @go(AccountName,*string)

	// The authentication mode of the storage account. The only supported value is ConnectionString. Defaults to ConnectionString.
	// +kubebuilder:validation:Optional
	authenticationMode?: null | string @go(AuthenticationMode,*string)
}

// JobSpec defines the desired state of Job
#JobSpec: {
	forProvider: #JobParameters @go(ForProvider)

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
	initProvider?: #JobInitParameters @go(InitProvider)
}

// JobStatus defines the observed state of Job.
#JobStatus: {
	atProvider?: #JobObservation @go(AtProvider)
}

// Job is the Schema for the Jobs API. Manages a Stream Analytics Job.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Job: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || has(self.initProvider.location)",message="location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.transformationQuery) || has(self.initProvider.transformationQuery)",message="transformationQuery is a required parameter"
	spec:    #JobSpec   @go(Spec)
	status?: #JobStatus @go(Status)
}

// JobList contains a list of Jobs
#JobList: {
	items: [...#Job] @go(Items,[]Job)
}