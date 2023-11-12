// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/consumption/v1beta1

package v1beta1

#BudgetResourceGroupFilterObservation: {
	// One or more dimension blocks as defined below to filter the budget on.
	dimension?: [...#FilterDimensionObservation] @go(Dimension,[]FilterDimensionObservation)

	// A not block as defined below to filter the budget on. This is deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
	not?: [...#FilterNotObservation] @go(Not,[]FilterNotObservation)

	// One or more tag blocks as defined below to filter the budget on.
	tag?: [...#BudgetResourceGroupFilterTagObservation] @go(Tag,[]BudgetResourceGroupFilterTagObservation)
}

#BudgetResourceGroupFilterParameters: {
	// One or more dimension blocks as defined below to filter the budget on.
	// +kubebuilder:validation:Optional
	dimension?: [...#FilterDimensionParameters] @go(Dimension,[]FilterDimensionParameters)

	// A not block as defined below to filter the budget on. This is deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
	// +kubebuilder:validation:Optional
	not?: [...#FilterNotParameters] @go(Not,[]FilterNotParameters)

	// One or more tag blocks as defined below to filter the budget on.
	// +kubebuilder:validation:Optional
	tag?: [...#BudgetResourceGroupFilterTagParameters] @go(Tag,[]BudgetResourceGroupFilterTagParameters)
}

#BudgetResourceGroupFilterTagObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#BudgetResourceGroupFilterTagParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#BudgetResourceGroupNotificationObservation: {
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

#BudgetResourceGroupNotificationParameters: {
	// Specifies a list of email addresses to send the budget notification to when the threshold is exceeded.
	// +kubebuilder:validation:Optional
	contactEmails?: [...null | string] @go(ContactEmails,[]*string)

	// Specifies a list of Action Group IDs to send the budget notification to when the threshold is exceeded.
	// +kubebuilder:validation:Optional
	contactGroups?: [...null | string] @go(ContactGroups,[]*string)

	// Specifies a list of contact roles to send the budget notification to when the threshold is exceeded.
	// +kubebuilder:validation:Optional
	contactRoles?: [...null | string] @go(ContactRoles,[]*string)

	// Should the notification be enabled? Defaults to true.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// The comparison operator for the notification. Must be one of EqualTo, GreaterThan, or GreaterThanOrEqualTo.
	// +kubebuilder:validation:Required
	operator?: null | string @go(Operator,*string)

	// Threshold value associated with a notification. Notification is sent when the cost exceeded the threshold. It is always percent and has to be between 0 and 1000.
	// +kubebuilder:validation:Required
	threshold?: null | float64 @go(Threshold,*float64)

	// The type of threshold for the notification. This determines whether the notification is triggered by forecasted costs or actual costs. The allowed values are Actual and Forecasted. Default is Actual. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	thresholdType?: null | string @go(ThresholdType,*string)
}

#BudgetResourceGroupObservation: {
	// The total amount of cost to track with the budget.
	amount?: null | float64 @go(Amount,*float64)

	// The ETag of the Resource Group Consumption Budget
	etag?: null | string @go(Etag,*string)

	// A filter block as defined below.
	filter?: [...#BudgetResourceGroupFilterObservation] @go(Filter,[]BudgetResourceGroupFilterObservation)

	// The ID of the Resource Group Consumption Budget.
	id?: null | string @go(ID,*string)

	// The name which should be used for this Resource Group Consumption Budget. Changing this forces a new Resource Group Consumption Budget to be created.
	name?: null | string @go(Name,*string)

	// One or more notification blocks as defined below.
	notification?: [...#BudgetResourceGroupNotificationObservation] @go(Notification,[]BudgetResourceGroupNotificationObservation)

	// The ID of the Resource Group to create the consumption budget for in the form of /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resourceGroup1. Changing this forces a new Resource Group Consumption Budget to be created.
	resourceGroupId?: null | string @go(ResourceGroupID,*string)

	// The time covered by a budget. Tracking of the amount will be reset based on the time grain. Must be one of BillingAnnual, BillingMonth, BillingQuarter, Annually, Monthly and Quarterly. Defaults to Monthly. Changing this forces a new resource to be created.
	timeGrain?: null | string @go(TimeGrain,*string)

	// A time_period block as defined below.
	timePeriod?: [...#BudgetResourceGroupTimePeriodObservation] @go(TimePeriod,[]BudgetResourceGroupTimePeriodObservation)
}

#BudgetResourceGroupParameters: {
	// The total amount of cost to track with the budget.
	// +kubebuilder:validation:Optional
	amount?: null | float64 @go(Amount,*float64)

	// The ETag of the Resource Group Consumption Budget
	// +kubebuilder:validation:Optional
	etag?: null | string @go(Etag,*string)

	// A filter block as defined below.
	// +kubebuilder:validation:Optional
	filter?: [...#BudgetResourceGroupFilterParameters] @go(Filter,[]BudgetResourceGroupFilterParameters)

	// The name which should be used for this Resource Group Consumption Budget. Changing this forces a new Resource Group Consumption Budget to be created.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// One or more notification blocks as defined below.
	// +kubebuilder:validation:Optional
	notification?: [...#BudgetResourceGroupNotificationParameters] @go(Notification,[]BudgetResourceGroupNotificationParameters)

	// The ID of the Resource Group to create the consumption budget for in the form of /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resourceGroup1. Changing this forces a new Resource Group Consumption Budget to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	resourceGroupId?: null | string @go(ResourceGroupID,*string)

	// The time covered by a budget. Tracking of the amount will be reset based on the time grain. Must be one of BillingAnnual, BillingMonth, BillingQuarter, Annually, Monthly and Quarterly. Defaults to Monthly. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	timeGrain?: null | string @go(TimeGrain,*string)

	// A time_period block as defined below.
	// +kubebuilder:validation:Optional
	timePeriod?: [...#BudgetResourceGroupTimePeriodParameters] @go(TimePeriod,[]BudgetResourceGroupTimePeriodParameters)
}

#BudgetResourceGroupTimePeriodObservation: {
	// The end date for the budget. If not set this will be 10 years after the start date.
	endDate?: null | string @go(EndDate,*string)

	// The start date for the budget. The start date must be first of the month and should be less than the end date. Budget start date must be on or after June 1, 2017. Future start date should not be more than twelve months. Past start date should be selected within the timegrain period. Changing this forces a new Resource Group Consumption Budget to be created.
	startDate?: null | string @go(StartDate,*string)
}

#BudgetResourceGroupTimePeriodParameters: {
	// The end date for the budget. If not set this will be 10 years after the start date.
	// +kubebuilder:validation:Optional
	endDate?: null | string @go(EndDate,*string)

	// The start date for the budget. The start date must be first of the month and should be less than the end date. Budget start date must be on or after June 1, 2017. Future start date should not be more than twelve months. Past start date should be selected within the timegrain period. Changing this forces a new Resource Group Consumption Budget to be created.
	// +kubebuilder:validation:Required
	startDate?: null | string @go(StartDate,*string)
}

#FilterDimensionObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#FilterDimensionParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#FilterNotDimensionObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#FilterNotDimensionParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

#FilterNotObservation: {
	// One dimension block as defined below to filter the budget on. Conflicts with tag.
	dimension?: [...#FilterNotDimensionObservation] @go(Dimension,[]FilterNotDimensionObservation)

	// One tag block as defined below to filter the budget on. Conflicts with dimension.
	tag?: [...#NotTagObservation] @go(Tag,[]NotTagObservation)
}

#FilterNotParameters: {
	// One dimension block as defined below to filter the budget on. Conflicts with tag.
	// +kubebuilder:validation:Optional
	dimension?: [...#FilterNotDimensionParameters] @go(Dimension,[]FilterNotDimensionParameters)

	// One tag block as defined below to filter the budget on. Conflicts with dimension.
	// +kubebuilder:validation:Optional
	tag?: [...#NotTagParameters] @go(Tag,[]NotTagParameters)
}

#NotTagObservation: {
	// The name of the tag to use for the filter.
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	values?: [...null | string] @go(Values,[]*string)
}

#NotTagParameters: {
	// The name of the tag to use for the filter.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The operator to use for comparison. The allowed values are In.
	// +kubebuilder:validation:Optional
	operator?: null | string @go(Operator,*string)

	// Specifies a list of values for the tag.
	// +kubebuilder:validation:Required
	values: [...null | string] @go(Values,[]*string)
}

// BudgetResourceGroupSpec defines the desired state of BudgetResourceGroup
#BudgetResourceGroupSpec: {
	forProvider: #BudgetResourceGroupParameters @go(ForProvider)
}

// BudgetResourceGroupStatus defines the observed state of BudgetResourceGroup.
#BudgetResourceGroupStatus: {
	atProvider?: #BudgetResourceGroupObservation @go(AtProvider)
}

// BudgetResourceGroup is the Schema for the BudgetResourceGroups API. Manages a Resource Group Consumption Budget.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#BudgetResourceGroup: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.amount)",message="amount is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.notification)",message="notification is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.timePeriod)",message="timePeriod is a required parameter"
	spec:    #BudgetResourceGroupSpec   @go(Spec)
	status?: #BudgetResourceGroupStatus @go(Status)
}

// BudgetResourceGroupList contains a list of BudgetResourceGroups
#BudgetResourceGroupList: {
	items: [...#BudgetResourceGroup] @go(Items,[]BudgetResourceGroup)
}