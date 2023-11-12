// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/alertsmanagement/v1beta1

package v1beta1

#ConditionAlertRuleNameObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#ConditionAlertRuleNameParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#ConditionMonitorConditionObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#ConditionMonitorConditionParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#ConditionSignalTypeObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#ConditionSignalTypeParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#ConditionTargetResourceGroupObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#ConditionTargetResourceGroupParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#ConditionTargetResourceObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#ConditionTargetResourceParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionAlertContextObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionAlertContextParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionAlertRuleIDObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionAlertRuleIDParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionDescriptionObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionDescriptionParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionMonitorServiceObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionMonitorServiceParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionObservation: {
	// A alert_context block as defined above.
	alertContext?: [...#MonitorAlertProcessingRuleSuppressionConditionAlertContextObservation] @go(AlertContext,[]MonitorAlertProcessingRuleSuppressionConditionAlertContextObservation)

	// A alert_rule_id block as defined above.
	alertRuleId?: [...#MonitorAlertProcessingRuleSuppressionConditionAlertRuleIDObservation] @go(AlertRuleID,[]MonitorAlertProcessingRuleSuppressionConditionAlertRuleIDObservation)

	// A alert_rule_name block as defined above.
	alertRuleName?: [...#ConditionAlertRuleNameObservation] @go(AlertRuleName,[]ConditionAlertRuleNameObservation)

	// A description block as defined below.
	description?: [...#MonitorAlertProcessingRuleSuppressionConditionDescriptionObservation] @go(Description,[]MonitorAlertProcessingRuleSuppressionConditionDescriptionObservation)

	// A monitor_condition block as defined below.
	monitorCondition?: [...#ConditionMonitorConditionObservation] @go(MonitorCondition,[]ConditionMonitorConditionObservation)

	// A monitor_service block as defined below.
	monitorService?: [...#MonitorAlertProcessingRuleSuppressionConditionMonitorServiceObservation] @go(MonitorService,[]MonitorAlertProcessingRuleSuppressionConditionMonitorServiceObservation)

	// A severity block as defined below.
	severity?: [...#MonitorAlertProcessingRuleSuppressionConditionSeverityObservation] @go(Severity,[]MonitorAlertProcessingRuleSuppressionConditionSeverityObservation)

	// A signal_type block as defined below.
	signalType?: [...#ConditionSignalTypeObservation] @go(SignalType,[]ConditionSignalTypeObservation)

	// A target_resource block as defined below.
	targetResource?: [...#ConditionTargetResourceObservation] @go(TargetResource,[]ConditionTargetResourceObservation)

	// A target_resource_group block as defined below.
	targetResourceGroup?: [...#ConditionTargetResourceGroupObservation] @go(TargetResourceGroup,[]ConditionTargetResourceGroupObservation)

	// A target_resource_type block as defined below.
	targetResourceType?: [...#MonitorAlertProcessingRuleSuppressionConditionTargetResourceTypeObservation] @go(TargetResourceType,[]MonitorAlertProcessingRuleSuppressionConditionTargetResourceTypeObservation)
}

#MonitorAlertProcessingRuleSuppressionConditionParameters: {
	// A alert_context block as defined above.
	// +kubebuilder:validation:Optional
	alertContext?: [...#MonitorAlertProcessingRuleSuppressionConditionAlertContextParameters] @go(AlertContext,[]MonitorAlertProcessingRuleSuppressionConditionAlertContextParameters)

	// A alert_rule_id block as defined above.
	// +kubebuilder:validation:Optional
	alertRuleId?: [...#MonitorAlertProcessingRuleSuppressionConditionAlertRuleIDParameters] @go(AlertRuleID,[]MonitorAlertProcessingRuleSuppressionConditionAlertRuleIDParameters)

	// A alert_rule_name block as defined above.
	// +kubebuilder:validation:Optional
	alertRuleName?: [...#ConditionAlertRuleNameParameters] @go(AlertRuleName,[]ConditionAlertRuleNameParameters)

	// A description block as defined below.
	// +kubebuilder:validation:Optional
	description?: [...#MonitorAlertProcessingRuleSuppressionConditionDescriptionParameters] @go(Description,[]MonitorAlertProcessingRuleSuppressionConditionDescriptionParameters)

	// A monitor_condition block as defined below.
	// +kubebuilder:validation:Optional
	monitorCondition?: [...#ConditionMonitorConditionParameters] @go(MonitorCondition,[]ConditionMonitorConditionParameters)

	// A monitor_service block as defined below.
	// +kubebuilder:validation:Optional
	monitorService?: [...#MonitorAlertProcessingRuleSuppressionConditionMonitorServiceParameters] @go(MonitorService,[]MonitorAlertProcessingRuleSuppressionConditionMonitorServiceParameters)

	// A severity block as defined below.
	// +kubebuilder:validation:Optional
	severity?: [...#MonitorAlertProcessingRuleSuppressionConditionSeverityParameters] @go(Severity,[]MonitorAlertProcessingRuleSuppressionConditionSeverityParameters)

	// A signal_type block as defined below.
	// +kubebuilder:validation:Optional
	signalType?: [...#ConditionSignalTypeParameters] @go(SignalType,[]ConditionSignalTypeParameters)

	// A target_resource block as defined below.
	// +kubebuilder:validation:Optional
	targetResource?: [...#ConditionTargetResourceParameters] @go(TargetResource,[]ConditionTargetResourceParameters)

	// A target_resource_group block as defined below.
	// +kubebuilder:validation:Optional
	targetResourceGroup?: [...#ConditionTargetResourceGroupParameters] @go(TargetResourceGroup,[]ConditionTargetResourceGroupParameters)

	// A target_resource_type block as defined below.
	// +kubebuilder:validation:Optional
	targetResourceType?: [...#MonitorAlertProcessingRuleSuppressionConditionTargetResourceTypeParameters] @go(TargetResourceType,[]MonitorAlertProcessingRuleSuppressionConditionTargetResourceTypeParameters)
}

#MonitorAlertProcessingRuleSuppressionConditionSeverityObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionSeverityParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionTargetResourceTypeObservation: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	values?: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionConditionTargetResourceTypeParameters: {
	// The operator for a given condition. Possible values are Equals, NotEquals, Contains, and DoesNotContain.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// A list of values to match for a given condition. The values should be valid resource types. (e.g. Microsoft.Compute/VirtualMachines)
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#MonitorAlertProcessingRuleSuppressionObservation: {
	// A condition block as defined below.
	condition?: [...#MonitorAlertProcessingRuleSuppressionConditionObservation] @go(Condition,[]MonitorAlertProcessingRuleSuppressionConditionObservation)

	// Specifies a description for the Alert Processing Rule.
	description?: null | string @go(Description,*string)

	// Should the Alert Processing Rule be enabled? Defaults to true.
	enabled?: null | bool @go(Enabled,*bool)

	// The ID of the Alert Processing Rule.
	id?: null | string @go(ID,*string)

	// The name of the Resource Group where the Alert Processing Rule should exist. Changing this forces a new Alert Processing Rule to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A schedule block as defined below.
	schedule?: [...#MonitorAlertProcessingRuleSuppressionScheduleObservation] @go(Schedule,[]MonitorAlertProcessingRuleSuppressionScheduleObservation)

	// A list of resource IDs which will be the target of Alert Processing Rule.
	scopes?: [...null | string] @go(Scopes,[]*string)

	// A mapping of tags which should be assigned to the Alert Processing Rule.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#MonitorAlertProcessingRuleSuppressionParameters: {
	// A condition block as defined below.
	// +kubebuilder:validation:Optional
	condition?: [...#MonitorAlertProcessingRuleSuppressionConditionParameters] @go(Condition,[]MonitorAlertProcessingRuleSuppressionConditionParameters)

	// Specifies a description for the Alert Processing Rule.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Should the Alert Processing Rule be enabled? Defaults to true.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// The name of the Resource Group where the Alert Processing Rule should exist. Changing this forces a new Alert Processing Rule to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A schedule block as defined below.
	// +kubebuilder:validation:Optional
	schedule?: [...#MonitorAlertProcessingRuleSuppressionScheduleParameters] @go(Schedule,[]MonitorAlertProcessingRuleSuppressionScheduleParameters)

	// A list of resource IDs which will be the target of Alert Processing Rule.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	scopes?: [...null | string] @go(Scopes,[]*string)

	// A mapping of tags which should be assigned to the Alert Processing Rule.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#MonitorAlertProcessingRuleSuppressionScheduleObservation: {
	// Specifies the Alert Processing Rule effective start time (Y-m-d'T'H:M:S).
	effectiveFrom?: null | string @go(EffectiveFrom,*string)

	// Specifies the Alert Processing Rule effective end time (Y-m-d'T'H:M:S).
	effectiveUntil?: null | string @go(EffectiveUntil,*string)

	// A recurrence block as defined above.
	recurrence?: [...#ScheduleRecurrenceObservation] @go(Recurrence,[]ScheduleRecurrenceObservation)

	// The time zone (e.g. Pacific Standard time, Eastern Standard Time). Defaults to UTC. possible values are defined here.
	timeZone?: null | string @go(TimeZone,*string)
}

#MonitorAlertProcessingRuleSuppressionScheduleParameters: {
	// Specifies the Alert Processing Rule effective start time (Y-m-d'T'H:M:S).
	// +kubebuilder:validation:Optional
	effectiveFrom?: null | string @go(EffectiveFrom,*string)

	// Specifies the Alert Processing Rule effective end time (Y-m-d'T'H:M:S).
	// +kubebuilder:validation:Optional
	effectiveUntil?: null | string @go(EffectiveUntil,*string)

	// A recurrence block as defined above.
	// +kubebuilder:validation:Optional
	recurrence?: [...#ScheduleRecurrenceParameters] @go(Recurrence,[]ScheduleRecurrenceParameters)

	// The time zone (e.g. Pacific Standard time, Eastern Standard Time). Defaults to UTC. possible values are defined here.
	// +kubebuilder:validation:Optional
	timeZone?: null | string @go(TimeZone,*string)
}

#RecurrenceDailyObservation: {
	// Specifies the recurrence end time (H:M:S).
	endTime?: null | string @go(EndTime,*string)

	// Specifies the recurrence start time (H:M:S).
	startTime?: null | string @go(StartTime,*string)
}

#RecurrenceDailyParameters: {
	// Specifies the recurrence end time (H:M:S).
	// +kubebuilder:validation:Required
	endTime?: null | string @go(EndTime,*string)

	// Specifies the recurrence start time (H:M:S).
	// +kubebuilder:validation:Required
	startTime?: null | string @go(StartTime,*string)
}

#RecurrenceMonthlyObservation: {
	// Specifies a list of dayOfMonth to recurrence. Possible values are integers between 1 - 31.
	daysOfMonth?: [...null | float64] @go(DaysOfMonth,[]*float64)

	// Specifies the recurrence end time (H:M:S).
	endTime?: null | string @go(EndTime,*string)

	// Specifies the recurrence start time (H:M:S).
	startTime?: null | string @go(StartTime,*string)
}

#RecurrenceMonthlyParameters: {
	// Specifies a list of dayOfMonth to recurrence. Possible values are integers between 1 - 31.
	// +kubebuilder:validation:Required
	daysOfMonth: [...null | float64] @go(DaysOfMonth,[]*float64)

	// Specifies the recurrence end time (H:M:S).
	// +kubebuilder:validation:Optional
	endTime?: null | string @go(EndTime,*string)

	// Specifies the recurrence start time (H:M:S).
	// +kubebuilder:validation:Optional
	startTime?: null | string @go(StartTime,*string)
}

#RecurrenceWeeklyObservation: {
	// Specifies a list of dayOfWeek to recurrence. Possible values are Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, and Saturday.
	daysOfWeek?: [...null | string] @go(DaysOfWeek,[]*string)

	// Specifies the recurrence end time (H:M:S).
	endTime?: null | string @go(EndTime,*string)

	// Specifies the recurrence start time (H:M:S).
	startTime?: null | string @go(StartTime,*string)
}

#RecurrenceWeeklyParameters: {
	// Specifies a list of dayOfWeek to recurrence. Possible values are Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, and Saturday.
	// +kubebuilder:validation:Required
	daysOfWeek: [...null | string] @go(DaysOfWeek,[]*string)

	// Specifies the recurrence end time (H:M:S).
	// +kubebuilder:validation:Optional
	endTime?: null | string @go(EndTime,*string)

	// Specifies the recurrence start time (H:M:S).
	// +kubebuilder:validation:Optional
	startTime?: null | string @go(StartTime,*string)
}

#ScheduleRecurrenceObservation: {
	// One or more daily blocks as defined above.
	daily?: [...#RecurrenceDailyObservation] @go(Daily,[]RecurrenceDailyObservation)

	// One or more monthly blocks as defined above.
	monthly?: [...#RecurrenceMonthlyObservation] @go(Monthly,[]RecurrenceMonthlyObservation)

	// One or more weekly blocks as defined below.
	weekly?: [...#RecurrenceWeeklyObservation] @go(Weekly,[]RecurrenceWeeklyObservation)
}

#ScheduleRecurrenceParameters: {
	// One or more daily blocks as defined above.
	// +kubebuilder:validation:Optional
	daily?: [...#RecurrenceDailyParameters] @go(Daily,[]RecurrenceDailyParameters)

	// One or more monthly blocks as defined above.
	// +kubebuilder:validation:Optional
	monthly?: [...#RecurrenceMonthlyParameters] @go(Monthly,[]RecurrenceMonthlyParameters)

	// One or more weekly blocks as defined below.
	// +kubebuilder:validation:Optional
	weekly?: [...#RecurrenceWeeklyParameters] @go(Weekly,[]RecurrenceWeeklyParameters)
}

// MonitorAlertProcessingRuleSuppressionSpec defines the desired state of MonitorAlertProcessingRuleSuppression
#MonitorAlertProcessingRuleSuppressionSpec: {
	forProvider: #MonitorAlertProcessingRuleSuppressionParameters @go(ForProvider)
}

// MonitorAlertProcessingRuleSuppressionStatus defines the observed state of MonitorAlertProcessingRuleSuppression.
#MonitorAlertProcessingRuleSuppressionStatus: {
	atProvider?: #MonitorAlertProcessingRuleSuppressionObservation @go(AtProvider)
}

// MonitorAlertProcessingRuleSuppression is the Schema for the MonitorAlertProcessingRuleSuppressions API. Manages an Alert Processing Rule which suppress notifications.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#MonitorAlertProcessingRuleSuppression: {
	spec:    #MonitorAlertProcessingRuleSuppressionSpec   @go(Spec)
	status?: #MonitorAlertProcessingRuleSuppressionStatus @go(Status)
}

// MonitorAlertProcessingRuleSuppressionList contains a list of MonitorAlertProcessingRuleSuppressions
#MonitorAlertProcessingRuleSuppressionList: {
	items: [...#MonitorAlertProcessingRuleSuppression] @go(Items,[]MonitorAlertProcessingRuleSuppression)
}