// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/budgets/v1beta1

package v1beta1

#ActionThresholdObservation: {
	// The type of threshold for a notification. Valid values are PERCENTAGE or ABSOLUTE_VALUE.
	actionThresholdType?: null | string @go(ActionThresholdType,*string)

	// The threshold of a notification.
	actionThresholdValue?: null | float64 @go(ActionThresholdValue,*float64)
}

#ActionThresholdParameters: {
	// The type of threshold for a notification. Valid values are PERCENTAGE or ABSOLUTE_VALUE.
	// +kubebuilder:validation:Required
	actionThresholdType?: null | string @go(ActionThresholdType,*string)

	// The threshold of a notification.
	// +kubebuilder:validation:Required
	actionThresholdValue?: null | float64 @go(ActionThresholdValue,*float64)
}

#BudgetActionObservation: {
	// The ID of the target account for budget. Will use current user's account_id by default if omitted.
	accountId?: null | string @go(AccountID,*string)

	// The id of the budget action.
	actionId?: null | string @go(ActionID,*string)

	// The trigger threshold of the action. See Action Threshold.
	actionThreshold?: [...#ActionThresholdObservation] @go(ActionThreshold,[]ActionThresholdObservation)

	// The type of action. This defines the type of tasks that can be carried out by this action. This field also determines the format for definition. Valid values are APPLY_IAM_POLICY, APPLY_SCP_POLICY, and RUN_SSM_DOCUMENTS.
	actionType?: null | string @go(ActionType,*string)

	// This specifies if the action needs manual or automatic approval. Valid values are AUTOMATIC and MANUAL.
	approvalModel?: null | string @go(ApprovalModel,*string)

	// The ARN of the budget action.
	arn?: null | string @go(Arn,*string)

	// The name of a budget.
	budgetName?: null | string @go(BudgetName,*string)

	// Specifies all of the type-specific parameters. See Definition.
	definition?: [...#DefinitionObservation] @go(Definition,[]DefinitionObservation)

	// The role passed for action execution and reversion. Roles and actions must be in the same account.
	executionRoleArn?: null | string @go(ExecutionRoleArn,*string)

	// ID of resource.
	id?: null | string @go(ID,*string)

	// The type of a notification. Valid values are ACTUAL or FORECASTED.
	notificationType?: null | string @go(NotificationType,*string)

	// The status of the budget action.
	status?: null | string @go(Status,*string)

	// A list of subscribers. See Subscriber.
	subscriber?: [...#SubscriberObservation] @go(Subscriber,[]SubscriberObservation)
}

#BudgetActionParameters: {
	// The ID of the target account for budget. Will use current user's account_id by default if omitted.
	// +kubebuilder:validation:Optional
	accountId?: null | string @go(AccountID,*string)

	// The trigger threshold of the action. See Action Threshold.
	// +kubebuilder:validation:Optional
	actionThreshold?: [...#ActionThresholdParameters] @go(ActionThreshold,[]ActionThresholdParameters)

	// The type of action. This defines the type of tasks that can be carried out by this action. This field also determines the format for definition. Valid values are APPLY_IAM_POLICY, APPLY_SCP_POLICY, and RUN_SSM_DOCUMENTS.
	// +kubebuilder:validation:Optional
	actionType?: null | string @go(ActionType,*string)

	// This specifies if the action needs manual or automatic approval. Valid values are AUTOMATIC and MANUAL.
	// +kubebuilder:validation:Optional
	approvalModel?: null | string @go(ApprovalModel,*string)

	// The name of a budget.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/budgets/v1beta1.Budget
	// +kubebuilder:validation:Optional
	budgetName?: null | string @go(BudgetName,*string)

	// Specifies all of the type-specific parameters. See Definition.
	// +kubebuilder:validation:Optional
	definition?: [...#DefinitionParameters] @go(Definition,[]DefinitionParameters)

	// The role passed for action execution and reversion. Roles and actions must be in the same account.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	executionRoleArn?: null | string @go(ExecutionRoleArn,*string)

	// The type of a notification. Valid values are ACTUAL or FORECASTED.
	// +kubebuilder:validation:Optional
	notificationType?: null | string @go(NotificationType,*string)

	// The Region to run the SSM document.
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// A list of subscribers. See Subscriber.
	// +kubebuilder:validation:Optional
	subscriber?: [...#SubscriberParameters] @go(Subscriber,[]SubscriberParameters)
}

#DefinitionObservation: {
	// The AWS Identity and Access Management (IAM) action definition details. See IAM Action Definition.
	iamActionDefinition?: [...#IAMActionDefinitionObservation] @go(IAMActionDefinition,[]IAMActionDefinitionObservation)

	// The service control policies (SCPs) action definition details. See SCP Action Definition.
	scpActionDefinition?: [...#ScpActionDefinitionObservation] @go(ScpActionDefinition,[]ScpActionDefinitionObservation)

	// The AWS Systems Manager (SSM) action definition details. See SSM Action Definition.
	ssmActionDefinition?: [...#SsmActionDefinitionObservation] @go(SsmActionDefinition,[]SsmActionDefinitionObservation)
}

#DefinitionParameters: {
	// The AWS Identity and Access Management (IAM) action definition details. See IAM Action Definition.
	// +kubebuilder:validation:Optional
	iamActionDefinition?: [...#IAMActionDefinitionParameters] @go(IAMActionDefinition,[]IAMActionDefinitionParameters)

	// The service control policies (SCPs) action definition details. See SCP Action Definition.
	// +kubebuilder:validation:Optional
	scpActionDefinition?: [...#ScpActionDefinitionParameters] @go(ScpActionDefinition,[]ScpActionDefinitionParameters)

	// The AWS Systems Manager (SSM) action definition details. See SSM Action Definition.
	// +kubebuilder:validation:Optional
	ssmActionDefinition?: [...#SsmActionDefinitionParameters] @go(SsmActionDefinition,[]SsmActionDefinitionParameters)
}

#IAMActionDefinitionObservation: {
	// A list of groups to be attached. There must be at least one group.
	groups?: [...null | string] @go(Groups,[]*string)

	// The Amazon Resource Name (ARN) of the policy to be attached.
	policyArn?: null | string @go(PolicyArn,*string)

	// A list of roles to be attached. There must be at least one role.
	roles?: [...null | string] @go(Roles,[]*string)

	// A list of users to be attached. There must be at least one user.
	users?: [...null | string] @go(Users,[]*string)
}

#IAMActionDefinitionParameters: {
	// A list of groups to be attached. There must be at least one group.
	// +kubebuilder:validation:Optional
	groups?: [...null | string] @go(Groups,[]*string)

	// The Amazon Resource Name (ARN) of the policy to be attached.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Policy
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	policyArn?: null | string @go(PolicyArn,*string)

	// A list of roles to be attached. There must be at least one role.
	// +kubebuilder:validation:Optional
	roles?: [...null | string] @go(Roles,[]*string)

	// A list of users to be attached. There must be at least one user.
	// +kubebuilder:validation:Optional
	users?: [...null | string] @go(Users,[]*string)
}

#ScpActionDefinitionObservation: {
	// The policy ID attached.
	policyId?: null | string @go(PolicyID,*string)

	// A list of target IDs.
	targetIds?: [...null | string] @go(TargetIds,[]*string)
}

#ScpActionDefinitionParameters: {
	// The policy ID attached.
	// +kubebuilder:validation:Required
	policyId?: null | string @go(PolicyID,*string)

	// A list of target IDs.
	// +kubebuilder:validation:Required
	targetIds: [...null | string] @go(TargetIds,[]*string)
}

#SsmActionDefinitionObservation: {
	// The action subType. Valid values are STOP_EC2_INSTANCES or STOP_RDS_INSTANCES.
	actionSubType?: null | string @go(ActionSubType,*string)

	// The EC2 and RDS instance IDs.
	instanceIds?: [...null | string] @go(InstanceIds,[]*string)

	// The Region to run the SSM document.
	region?: null | string @go(Region,*string)
}

#SsmActionDefinitionParameters: {
	// The action subType. Valid values are STOP_EC2_INSTANCES or STOP_RDS_INSTANCES.
	// +kubebuilder:validation:Required
	actionSubType?: null | string @go(ActionSubType,*string)

	// The EC2 and RDS instance IDs.
	// +kubebuilder:validation:Required
	instanceIds: [...null | string] @go(InstanceIds,[]*string)

	// The Region to run the SSM document.
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

#SubscriberObservation: {
	// The address that AWS sends budget notifications to, either an SNS topic or an email.
	address?: null | string @go(Address,*string)

	// The type of notification that AWS sends to a subscriber. Valid values are SNS or EMAIL.
	subscriptionType?: null | string @go(SubscriptionType,*string)
}

#SubscriberParameters: {
	// The address that AWS sends budget notifications to, either an SNS topic or an email.
	// +kubebuilder:validation:Required
	address?: null | string @go(Address,*string)

	// The type of notification that AWS sends to a subscriber. Valid values are SNS or EMAIL.
	// +kubebuilder:validation:Required
	subscriptionType?: null | string @go(SubscriptionType,*string)
}

// BudgetActionSpec defines the desired state of BudgetAction
#BudgetActionSpec: {
	forProvider: #BudgetActionParameters @go(ForProvider)
}

// BudgetActionStatus defines the observed state of BudgetAction.
#BudgetActionStatus: {
	atProvider?: #BudgetActionObservation @go(AtProvider)
}

// BudgetAction is the Schema for the BudgetActions API. Provides a budget action resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#BudgetAction: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.actionThreshold)",message="actionThreshold is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.actionType)",message="actionType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.approvalModel)",message="approvalModel is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.definition)",message="definition is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.notificationType)",message="notificationType is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.subscriber)",message="subscriber is a required parameter"
	spec:    #BudgetActionSpec   @go(Spec)
	status?: #BudgetActionStatus @go(Status)
}

// BudgetActionList contains a list of BudgetActions
#BudgetActionList: {
	items: [...#BudgetAction] @go(Items,[]BudgetAction)
}