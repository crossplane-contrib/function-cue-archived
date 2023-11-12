// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/consumption/v1beta1

package v1beta1

#BudgetSubscriptionFilterDimensionInitParameters: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterDimensionObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterDimensionParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Optional
	values: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterInitParameters: {
	// One or more dimension blocks as defined below to filter the budget on.
	dimension?: [...#BudgetSubscriptionFilterDimensionInitParameters] @go(Dimension,[]BudgetSubscriptionFilterDimensionInitParameters)

	// A not block as defined below to filter the budget on. This is deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
	not?: [...#BudgetSubscriptionFilterNotInitParameters] @go(Not,[]BudgetSubscriptionFilterNotInitParameters)

	// One or more tag blocks as defined below to filter the budget on.
	tag?: [...#BudgetSubscriptionFilterTagInitParameters] @go(Tag,[]BudgetSubscriptionFilterTagInitParameters)
}

#BudgetSubscriptionFilterNotDimensionInitParameters: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterNotDimensionObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterNotDimensionParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Optional
	values: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterNotInitParameters: {
	// One dimension block as defined below to filter the budget on. Conflicts with tag.
	dimension?: [...#BudgetSubscriptionFilterNotDimensionInitParameters] @go(Dimension,[]BudgetSubscriptionFilterNotDimensionInitParameters)

	// One tag block as defined below to filter the budget on. Conflicts with dimension.
	tag?: [...#FilterNotTagInitParameters] @go(Tag,[]FilterNotTagInitParameters)
}

#BudgetSubscriptionFilterNotObservation: {
	// One dimension block as defined below to filter the budget on. Conflicts with tag.
	dimension?: [...#BudgetSubscriptionFilterNotDimensionObservation] @go(Dimension,[]BudgetSubscriptionFilterNotDimensionObservation)

	// One tag block as defined below to filter the budget on. Conflicts with dimension.
	tag?: [...#FilterNotTagObservation] @go(Tag,[]FilterNotTagObservation)
}

#BudgetSubscriptionFilterNotParameters: {
	// One dimension block as defined below to filter the budget on. Conflicts with tag.
	// +kubebuilder:validation:Optional
	dimension?: [...#BudgetSubscriptionFilterNotDimensionParameters] @go(Dimension,[]BudgetSubscriptionFilterNotDimensionParameters)

	// One tag block as defined below to filter the budget on. Conflicts with dimension.
	// +kubebuilder:validation:Optional
	tag?: [...#FilterNotTagParameters] @go(Tag,[]FilterNotTagParameters)
}

#BudgetSubscriptionFilterObservation: {
	// One or more dimension blocks as defined below to filter the budget on.
	dimension?: [...#BudgetSubscriptionFilterDimensionObservation] @go(Dimension,[]BudgetSubscriptionFilterDimensionObservation)

	// A not block as defined below to filter the budget on. This is deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
	not?: [...#BudgetSubscriptionFilterNotObservation] @go(Not,[]BudgetSubscriptionFilterNotObservation)

	// One or more tag blocks as defined below to filter the budget on.
	tag?: [...#BudgetSubscriptionFilterTagObservation] @go(Tag,[]BudgetSubscriptionFilterTagObservation)
}

#BudgetSubscriptionFilterParameters: {
	// One or more dimension blocks as defined below to filter the budget on.
	// +kubebuilder:validation:Optional
	dimension?: [...#BudgetSubscriptionFilterDimensionParameters] @go(Dimension,[]BudgetSubscriptionFilterDimensionParameters)

	// A not block as defined below to filter the budget on. This is deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
	// +kubebuilder:validation:Optional
	not?: [...#BudgetSubscriptionFilterNotParameters] @go(Not,[]BudgetSubscriptionFilterNotParameters)

	// One or more tag blocks as defined below to filter the budget on.
	// +kubebuilder:validation:Optional
	tag?: [...#BudgetSubscriptionFilterTagParameters] @go(Tag,[]BudgetSubscriptionFilterTagParameters)
}

#BudgetSubscriptionFilterTagInitParameters: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterTagObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionFilterTagParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Optional
	values: [...null | string] @go(Values,[]*string)
}

#BudgetSubscriptionInitParameters: {
	// The total amount of cost to track with the budget.
	amount?: null | float64 @go(Amount,*float64)

	// The ETag of the Subscription Consumption Budget.
	etag?: null | string @go(Etag,*string)

	// A filter block as defined below.
	filter?: [...#BudgetSubscriptionFilterInitParameters] @go(Filter,[]BudgetSubscriptionFilterInitParameters)

	// One or more notification blocks as defined below.
	notification?: [...#BudgetSubscriptionNotificationInitParameters] @go(Notification,[]BudgetSubscriptionNotificationInitParameters)

	// The ID of the Subscription for which to create a Consumption Budget. Changing this forces a new resource to be created.
	subscriptionId?: null | string @go(SubscriptionID,*string)

	// The time covered by a budget. Tracking of the amount will be reset based on the time grain. Must be one of BillingAnnual, BillingMonth, BillingQuarter, Annually, Monthly and Quarterly. Defaults to Monthly. Changing this forces a new resource to be created.
	timeGrain?: null | string @go(TimeGrain,*string)

	// A time_period block as defined below.
	timePeriod?: [...#BudgetSubscriptionTimePeriodInitParameters] @go(TimePeriod,[]BudgetSubscriptionTimePeriodInitParameters)
}

#BudgetSubscriptionNotificationInitParameters: {
	// Specifies a list of email addresses to send the budget notification to when the threshold is exceeded.
	contactEmails?: [...null | string] @go(ContactEmails,[]*string)

	// Specifies a list of contact roles to send the budget notification to when the threshold is exceeded.
	contactRoles?: [...null | string] @go(ContactRoles,[]*string)

	// Should the notification be enabled? Defaults to true.
	enabled?: null | bool @go(Enabled,*bool)

	// The comparison operator for the notification. Must be one of EqualTo, GreaterThan, or GreaterThanOrEqualTo.
	operator?: null | string @go(Operator,*string)

	// Threshold value associated with a notification. Notification is sent when the cost exceeded the threshold. It is always percent and has to be between 0 and 1000.
	threshold?: null | float64 @go(Threshold,*float64)

	// The type of threshold for the notification. This determines whether the notification is triggered by forecasted costs or actual costs. The allowed values are Actual and Forecasted. Default is Actual. Changing this forces a new resource to be created.
	thresholdType?: null | string @go(ThresholdType,*string)
}

#BudgetSubscriptionNotificationObservation: {
	// Specifies a list of email addresses to send the budget notification to when the threshold is exceeded.
	contactEmails?: [...null | string] @go(ContactEmails,[]*string)

	// Specifies a list of Action Group IDs to send the budget notification to when the threshold is exceeded.
	contactGroups?: [...null | string] @go(ContactGroups,[]*string)

	// Specifies a list of contact roles to send the budget notification to when the threshold is exceeded.
	contactRoles?: [...null | string] @go(ContactRoles,[]*string)

	// Should the notification be enabled? Defaults to true.
	enabled?: null | bool @go(Enabled,*bool)

	// The comparison operator for the notification. Must be one of EqualTo, GreaterThan, or GreaterThanOrEqualTo.
	operator?: null | string @go(Operator,*string)

	// Threshold value associated with a notification. Notification is sent when the cost exceeded the threshold. It is always percent and has to be between 0 and 1000.
	threshold?: null | float64 @go(Threshold,*float64)

	// The type of threshold for the notification. This determines whether the notification is triggered by forecasted costs or actual costs. The allowed values are Actual and Forecasted. Default is Actual. Changing this forces a new resource to be created.
	thresholdType?: null | string @go(ThresholdType,*string)
}

#BudgetSubscriptionNotificationParameters: {
	// Specifies a list of email addresses to send the budget notification to when the threshold is exceeded.
	// +kubebuilder:validation:Optional
	contactEmails?: [...null | string] @go(ContactEmails,[]*string)

	// Specifies a list of Action Group IDs to send the budget notification to when the threshold is exceeded.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/insights/v1beta1.MonitorActionGroup
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	contactGroups?: [...null | string] @go(ContactGroups,[]*string)

	// Specifies a list of contact roles to send the budget notification to when the threshold is exceeded.
	// +kubebuilder:validation:Optional
	contactRoles?: [...null | string] @go(ContactRoles,[]*string)

	// Should the notification be enabled? Defaults to true.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// The comparison operator for the notification. Must be one of EqualTo, GreaterThan, or GreaterThanOrEqualTo.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Threshold value associated with a notification. Notification is sent when the cost exceeded the threshold. It is always percent and has to be between 0 and 1000.
	// +kubebuilder:validation:Optional
	threshold?: null | float64 @go(Threshold,*float64)

	// The type of threshold for the notification. This determines whether the notification is triggered by forecasted costs or actual costs. The allowed values are Actual and Forecasted. Default is Actual. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	thresholdType?: null | string @go(ThresholdType,*string)
}

#BudgetSubscriptionObservation: {
	// The total amount of cost to track with the budget.
	amount?: null | float64 @go(Amount,*float64)

	// The ETag of the Subscription Consumption Budget.
	etag?: null | string @go(Etag,*string)

	// A filter block as defined below.
	filter?: [...#BudgetSubscriptionFilterObservation] @go(Filter,[]BudgetSubscriptionFilterObservation)

	// The ID of the Subscription Consumption Budget.
	id?: null | string @go(ID,*string)

	// One or more notification blocks as defined below.
	notification?: [...#BudgetSubscriptionNotificationObservation] @go(Notification,[]BudgetSubscriptionNotificationObservation)

	// The ID of the Subscription for which to create a Consumption Budget. Changing this forces a new resource to be created.
	subscriptionId?: null | string @go(SubscriptionID,*string)

	// The time covered by a budget. Tracking of the amount will be reset based on the time grain. Must be one of BillingAnnual, BillingMonth, BillingQuarter, Annually, Monthly and Quarterly. Defaults to Monthly. Changing this forces a new resource to be created.
	timeGrain?: null | string @go(TimeGrain,*string)

	// A time_period block as defined below.
	timePeriod?: [...#BudgetSubscriptionTimePeriodObservation] @go(TimePeriod,[]BudgetSubscriptionTimePeriodObservation)
}

#BudgetSubscriptionParameters: {
	// The total amount of cost to track with the budget.
	// +kubebuilder:validation:Optional
	amount?: null | float64 @go(Amount,*float64)

	// The ETag of the Subscription Consumption Budget.
	// +kubebuilder:validation:Optional
	etag?: null | string @go(Etag,*string)

	// A filter block as defined below.
	// +kubebuilder:validation:Optional
	filter?: [...#BudgetSubscriptionFilterParameters] @go(Filter,[]BudgetSubscriptionFilterParameters)

	// One or more notification blocks as defined below.
	// +kubebuilder:validation:Optional
	notification?: [...#BudgetSubscriptionNotificationParameters] @go(Notification,[]BudgetSubscriptionNotificationParameters)

	// The ID of the Subscription for which to create a Consumption Budget. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	subscriptionId?: null | string @go(SubscriptionID,*string)

	// The time covered by a budget. Tracking of the amount will be reset based on the time grain. Must be one of BillingAnnual, BillingMonth, BillingQuarter, Annually, Monthly and Quarterly. Defaults to Monthly. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	timeGrain?: null | string @go(TimeGrain,*string)

	// A time_period block as defined below.
	// +kubebuilder:validation:Optional
	timePeriod?: [...#BudgetSubscriptionTimePeriodParameters] @go(TimePeriod,[]BudgetSubscriptionTimePeriodParameters)
}

#BudgetSubscriptionTimePeriodInitParameters: {
	// The end date for the budget. If not set this will be 10 years after the start date.
	endDate?: null | string @go(EndDate,*string)

	// The start date for the budget. The start date must be first of the month and should be less than the end date. Budget start date must be on or after June 1, 2017. Future start date should not be more than twelve months. Past start date should be selected within the timegrain period. Changing this forces a new Subscription Consumption Budget to be created.
	startDate?: null | string @go(StartDate,*string)
}

#BudgetSubscriptionTimePeriodObservation: {
	// The end date for the budget. If not set this will be 10 years after the start date.
	endDate?: null | string @go(EndDate,*string)

	// The start date for the budget. The start date must be first of the month and should be less than the end date. Budget start date must be on or after June 1, 2017. Future start date should not be more than twelve months. Past start date should be selected within the timegrain period. Changing this forces a new Subscription Consumption Budget to be created.
	startDate?: null | string @go(StartDate,*string)
}

#BudgetSubscriptionTimePeriodParameters: {
	// The end date for the budget. If not set this will be 10 years after the start date.
	// +kubebuilder:validation:Optional
	endDate?: null | string @go(EndDate,*string)

	// The start date for the budget. The start date must be first of the month and should be less than the end date. Budget start date must be on or after June 1, 2017. Future start date should not be more than twelve months. Past start date should be selected within the timegrain period. Changing this forces a new Subscription Consumption Budget to be created.
	// +kubebuilder:validation:Optional
	startDate?: null | string @go(StartDate,*string)
}

#FilterNotTagInitParameters: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#FilterNotTagObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#FilterNotTagParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Optional
	values: [...null | string] @go(Values,[]*string)
}

// BudgetSubscriptionSpec defines the desired state of BudgetSubscription
#BudgetSubscriptionSpec: {
	forProvider: #BudgetSubscriptionParameters @go(ForProvider)

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
	initProvider?: #BudgetSubscriptionInitParameters @go(InitProvider)
}

// BudgetSubscriptionStatus defines the observed state of BudgetSubscription.
#BudgetSubscriptionStatus: {
	atProvider?: #BudgetSubscriptionObservation @go(AtProvider)
}

// BudgetSubscription is the Schema for the BudgetSubscriptions API. Manages a Subscription Consumption Budget.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#BudgetSubscription: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.amount) || has(self.initProvider.amount)",message="amount is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.notification) || has(self.initProvider.notification)",message="notification is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.subscriptionId) || has(self.initProvider.subscriptionId)",message="subscriptionId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.timePeriod) || has(self.initProvider.timePeriod)",message="timePeriod is a required parameter"
	spec:    #BudgetSubscriptionSpec   @go(Spec)
	status?: #BudgetSubscriptionStatus @go(Status)
}

// BudgetSubscriptionList contains a list of BudgetSubscriptions
#BudgetSubscriptionList: {
	items: [...#BudgetSubscription] @go(Items,[]BudgetSubscription)
}