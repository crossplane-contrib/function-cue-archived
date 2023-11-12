// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/datafactory/v1beta1

package v1beta1

#MonthlyObservation: {
	// The occurrence of the specified day during the month. For example, a monthly property with weekday and week values of Sunday, -1 means the last Sunday of the month.
	week?: null | float64 @go(Week,*float64)

	// The day of the week on which the trigger runs. For example, a monthly property with a weekday value of Sunday means every Sunday of the month.
	weekday?: null | string @go(Weekday,*string)
}

#MonthlyParameters: {
	// The occurrence of the specified day during the month. For example, a monthly property with weekday and week values of Sunday, -1 means the last Sunday of the month.
	// +kubebuilder:validation:Optional
	week?: null | float64 @go(Week,*float64)

	// The day of the week on which the trigger runs. For example, a monthly property with a weekday value of Sunday means every Sunday of the month.
	// +kubebuilder:validation:Required
	weekday?: null | string @go(Weekday,*string)
}

#ScheduleObservation: {
	// Day(s) of the month on which the trigger is scheduled. This value can be specified with a monthly frequency only.
	daysOfMonth?: [...null | float64] @go(DaysOfMonth,[]*float64)

	// Days of the week on which the trigger is scheduled. This value can be specified only with a weekly frequency.
	daysOfWeek?: [...null | string] @go(DaysOfWeek,[]*string)

	// Hours of the day on which the trigger is scheduled.
	hours?: [...null | float64] @go(Hours,[]*float64)

	// Minutes of the hour on which the trigger is scheduled.
	minutes?: [...null | float64] @go(Minutes,[]*float64)

	// A monthly block as documented below, which specifies the days of the month on which the trigger is scheduled. The value can be specified only with a monthly frequency.
	monthly?: [...#MonthlyObservation] @go(Monthly,[]MonthlyObservation)
}

#ScheduleParameters: {
	// Day(s) of the month on which the trigger is scheduled. This value can be specified with a monthly frequency only.
	// +kubebuilder:validation:Optional
	daysOfMonth?: [...null | float64] @go(DaysOfMonth,[]*float64)

	// Days of the week on which the trigger is scheduled. This value can be specified only with a weekly frequency.
	// +kubebuilder:validation:Optional
	daysOfWeek?: [...null | string] @go(DaysOfWeek,[]*string)

	// Hours of the day on which the trigger is scheduled.
	// +kubebuilder:validation:Optional
	hours?: [...null | float64] @go(Hours,[]*float64)

	// Minutes of the hour on which the trigger is scheduled.
	// +kubebuilder:validation:Optional
	minutes?: [...null | float64] @go(Minutes,[]*float64)

	// A monthly block as documented below, which specifies the days of the month on which the trigger is scheduled. The value can be specified only with a monthly frequency.
	// +kubebuilder:validation:Optional
	monthly?: [...#MonthlyParameters] @go(Monthly,[]MonthlyParameters)
}

#TriggerScheduleObservation: {
	// Specifies if the Data Factory Schedule Trigger is activated. Defaults to true.
	activated?: null | bool @go(Activated,*bool)

	// List of tags that can be used for describing the Data Factory Schedule Trigger.
	annotations?: [...null | string] @go(Annotations,[]*string)

	// The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource.
	dataFactoryId?: null | string @go(DataFactoryID,*string)

	// The Schedule Trigger's description.
	description?: null | string @go(Description,*string)

	// The time the Schedule Trigger should end. The time will be represented in UTC.
	endTime?: null | string @go(EndTime,*string)

	// The trigger frequency. Valid values include Minute, Hour, Day, Week, Month. Defaults to Minute.
	frequency?: null | string @go(Frequency,*string)

	// The ID of the Data Factory Schedule Trigger.
	id?: null | string @go(ID,*string)

	// The interval for how often the trigger occurs. This defaults to 1.
	interval?: null | float64 @go(Interval,*float64)

	// block as defined below.
	pipeline?: [...#TriggerSchedulePipelineObservation] @go(Pipeline,[]TriggerSchedulePipelineObservation)

	// The Data Factory Pipeline name that the trigger will act on.
	pipelineName?: null | string @go(PipelineName,*string)

	// The pipeline parameters that the trigger will act upon.
	pipelineParameters?: {[string]: null | string} @go(PipelineParameters,map[string]*string)

	// A schedule block as defined below, which further specifies the recurrence schedule for the trigger. A schedule is capable of limiting or increasing the number of trigger executions specified by the frequency and interval properties.
	schedule?: [...#ScheduleObservation] @go(Schedule,[]ScheduleObservation)

	// The time the Schedule Trigger will start. This defaults to the current time. The time will be represented in UTC.
	startTime?: null | string @go(StartTime,*string)

	// The timezone of the start/end time.
	timeZone?: null | string @go(TimeZone,*string)
}

#TriggerScheduleParameters: {
	// Specifies if the Data Factory Schedule Trigger is activated. Defaults to true.
	// +kubebuilder:validation:Optional
	activated?: null | bool @go(Activated,*bool)

	// List of tags that can be used for describing the Data Factory Schedule Trigger.
	// +kubebuilder:validation:Optional
	annotations?: [...null | string] @go(Annotations,[]*string)

	// The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/datafactory/v1beta1.Factory
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dataFactoryId?: null | string @go(DataFactoryID,*string)

	// The Schedule Trigger's description.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The time the Schedule Trigger should end. The time will be represented in UTC.
	// +kubebuilder:validation:Optional
	endTime?: null | string @go(EndTime,*string)

	// The trigger frequency. Valid values include Minute, Hour, Day, Week, Month. Defaults to Minute.
	// +kubebuilder:validation:Optional
	frequency?: null | string @go(Frequency,*string)

	// The interval for how often the trigger occurs. This defaults to 1.
	// +kubebuilder:validation:Optional
	interval?: null | float64 @go(Interval,*float64)

	// block as defined below.
	// +kubebuilder:validation:Optional
	pipeline?: [...#TriggerSchedulePipelineParameters] @go(Pipeline,[]TriggerSchedulePipelineParameters)

	// The Data Factory Pipeline name that the trigger will act on.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/datafactory/v1beta1.Pipeline
	// +kubebuilder:validation:Optional
	pipelineName?: null | string @go(PipelineName,*string)

	// The pipeline parameters that the trigger will act upon.
	// +kubebuilder:validation:Optional
	pipelineParameters?: {[string]: null | string} @go(PipelineParameters,map[string]*string)

	// A schedule block as defined below, which further specifies the recurrence schedule for the trigger. A schedule is capable of limiting or increasing the number of trigger executions specified by the frequency and interval properties.
	// +kubebuilder:validation:Optional
	schedule?: [...#ScheduleParameters] @go(Schedule,[]ScheduleParameters)

	// The time the Schedule Trigger will start. This defaults to the current time. The time will be represented in UTC.
	// +kubebuilder:validation:Optional
	startTime?: null | string @go(StartTime,*string)

	// The timezone of the start/end time.
	// +kubebuilder:validation:Optional
	timeZone?: null | string @go(TimeZone,*string)
}

#TriggerSchedulePipelineObservation: {
	// Reference pipeline name.
	name?: null | string @go(Name,*string)

	// The pipeline parameters that the trigger will act upon.
	parameters?: {[string]: null | string} @go(Parameters,map[string]*string)
}

#TriggerSchedulePipelineParameters: {
	// Reference pipeline name.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The pipeline parameters that the trigger will act upon.
	// +kubebuilder:validation:Optional
	parameters?: {[string]: null | string} @go(Parameters,map[string]*string)
}

// TriggerScheduleSpec defines the desired state of TriggerSchedule
#TriggerScheduleSpec: {
	forProvider: #TriggerScheduleParameters @go(ForProvider)
}

// TriggerScheduleStatus defines the observed state of TriggerSchedule.
#TriggerScheduleStatus: {
	atProvider?: #TriggerScheduleObservation @go(AtProvider)
}

// TriggerSchedule is the Schema for the TriggerSchedules API. Manages a Trigger Schedule inside a Azure Data Factory.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#TriggerSchedule: {
	spec:    #TriggerScheduleSpec   @go(Spec)
	status?: #TriggerScheduleStatus @go(Status)
}

// TriggerScheduleList contains a list of TriggerSchedules
#TriggerScheduleList: {
	items: [...#TriggerSchedule] @go(Items,[]TriggerSchedule)
}