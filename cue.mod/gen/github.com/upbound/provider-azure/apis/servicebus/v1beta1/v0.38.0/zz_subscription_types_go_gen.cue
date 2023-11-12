// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/servicebus/v1beta1

package v1beta1

#ClientScopedSubscriptionInitParameters: {
	// Specifies the Client ID of the application that created the client-scoped subscription. Changing this forces a new resource to be created.
	clientId?: null | string @go(ClientID,*string)

	// Whether the client scoped subscription is shareable. Defaults to true Changing this forces a new resource to be created.
	isClientScopedSubscriptionShareable?: null | bool @go(IsClientScopedSubscriptionShareable,*bool)
}

#ClientScopedSubscriptionObservation: {
	// Specifies the Client ID of the application that created the client-scoped subscription. Changing this forces a new resource to be created.
	clientId?: null | string @go(ClientID,*string)

	// Whether the client scoped subscription is durable. This property can only be controlled from the application side.
	isClientScopedSubscriptionDurable?: null | bool @go(IsClientScopedSubscriptionDurable,*bool)

	// Whether the client scoped subscription is shareable. Defaults to true Changing this forces a new resource to be created.
	isClientScopedSubscriptionShareable?: null | bool @go(IsClientScopedSubscriptionShareable,*bool)
}

#ClientScopedSubscriptionParameters: {
	// Specifies the Client ID of the application that created the client-scoped subscription. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	clientId?: null | string @go(ClientID,*string)

	// Whether the client scoped subscription is shareable. Defaults to true Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	isClientScopedSubscriptionShareable?: null | bool @go(IsClientScopedSubscriptionShareable,*bool)
}

#SubscriptionInitParameters: {
	// The idle interval after which the topic is automatically deleted as an ISO 8601 duration. The minimum duration is 5 minutes or PT5M.
	autoDeleteOnIdle?: null | string @go(AutoDeleteOnIdle,*string)

	// A client_scoped_subscription block as defined below.
	clientScopedSubscription?: [...#ClientScopedSubscriptionInitParameters] @go(ClientScopedSubscription,[]ClientScopedSubscriptionInitParameters)

	// whether the subscription is scoped to a client id. Defaults to False.
	clientScopedSubscriptionEnabled?: null | bool @go(ClientScopedSubscriptionEnabled,*bool)

	// Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true.
	deadLetteringOnFilterEvaluationError?: null | bool @go(DeadLetteringOnFilterEvaluationError,*bool)

	// Boolean flag which controls whether the Subscription has dead letter support when a message expires.
	deadLetteringOnMessageExpiration?: null | bool @go(DeadLetteringOnMessageExpiration,*bool)

	// The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself.
	defaultMessageTtl?: null | string @go(DefaultMessageTTL,*string)

	// Boolean flag which controls whether the Subscription supports batched operations.
	enableBatchedOperations?: null | bool @go(EnableBatchedOperations,*bool)

	// The name of a Queue or Topic to automatically forward Dead Letter messages to.
	forwardDeadLetteredMessagesTo?: null | string @go(ForwardDeadLetteredMessagesTo,*string)

	// The name of a Queue or Topic to automatically forward messages to.
	forwardTo?: null | string @go(ForwardTo,*string)

	// The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or P0DT0H1M0S . The maximum value is 5 minutes or P0DT0H5M0S .
	lockDuration?: null | string @go(LockDuration,*string)

	// The maximum number of deliveries.
	maxDeliveryCount?: null | float64 @go(MaxDeliveryCount,*float64)

	// Boolean flag which controls whether this Subscription supports the concept of a session. Changing this forces a new resource to be created.
	requiresSession?: null | bool @go(RequiresSession,*bool)

	// The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active.
	status?: null | string @go(Status,*string)
}

#SubscriptionObservation: {
	// The idle interval after which the topic is automatically deleted as an ISO 8601 duration. The minimum duration is 5 minutes or PT5M.
	autoDeleteOnIdle?: null | string @go(AutoDeleteOnIdle,*string)

	// A client_scoped_subscription block as defined below.
	clientScopedSubscription?: [...#ClientScopedSubscriptionObservation] @go(ClientScopedSubscription,[]ClientScopedSubscriptionObservation)

	// whether the subscription is scoped to a client id. Defaults to False.
	clientScopedSubscriptionEnabled?: null | bool @go(ClientScopedSubscriptionEnabled,*bool)

	// Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true.
	deadLetteringOnFilterEvaluationError?: null | bool @go(DeadLetteringOnFilterEvaluationError,*bool)

	// Boolean flag which controls whether the Subscription has dead letter support when a message expires.
	deadLetteringOnMessageExpiration?: null | bool @go(DeadLetteringOnMessageExpiration,*bool)

	// The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself.
	defaultMessageTtl?: null | string @go(DefaultMessageTTL,*string)

	// Boolean flag which controls whether the Subscription supports batched operations.
	enableBatchedOperations?: null | bool @go(EnableBatchedOperations,*bool)

	// The name of a Queue or Topic to automatically forward Dead Letter messages to.
	forwardDeadLetteredMessagesTo?: null | string @go(ForwardDeadLetteredMessagesTo,*string)

	// The name of a Queue or Topic to automatically forward messages to.
	forwardTo?: null | string @go(ForwardTo,*string)

	// The ServiceBus Subscription ID.
	id?: null | string @go(ID,*string)

	// The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or P0DT0H1M0S . The maximum value is 5 minutes or P0DT0H5M0S .
	lockDuration?: null | string @go(LockDuration,*string)

	// The maximum number of deliveries.
	maxDeliveryCount?: null | float64 @go(MaxDeliveryCount,*float64)

	// Boolean flag which controls whether this Subscription supports the concept of a session. Changing this forces a new resource to be created.
	requiresSession?: null | bool @go(RequiresSession,*bool)

	// The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active.
	status?: null | string @go(Status,*string)

	// The ID of the ServiceBus Topic to create this Subscription in. Changing this forces a new resource to be created.
	topicId?: null | string @go(TopicID,*string)
}

#SubscriptionParameters: {
	// The idle interval after which the topic is automatically deleted as an ISO 8601 duration. The minimum duration is 5 minutes or PT5M.
	// +kubebuilder:validation:Optional
	autoDeleteOnIdle?: null | string @go(AutoDeleteOnIdle,*string)

	// A client_scoped_subscription block as defined below.
	// +kubebuilder:validation:Optional
	clientScopedSubscription?: [...#ClientScopedSubscriptionParameters] @go(ClientScopedSubscription,[]ClientScopedSubscriptionParameters)

	// whether the subscription is scoped to a client id. Defaults to False.
	// +kubebuilder:validation:Optional
	clientScopedSubscriptionEnabled?: null | bool @go(ClientScopedSubscriptionEnabled,*bool)

	// Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true.
	// +kubebuilder:validation:Optional
	deadLetteringOnFilterEvaluationError?: null | bool @go(DeadLetteringOnFilterEvaluationError,*bool)

	// Boolean flag which controls whether the Subscription has dead letter support when a message expires.
	// +kubebuilder:validation:Optional
	deadLetteringOnMessageExpiration?: null | bool @go(DeadLetteringOnMessageExpiration,*bool)

	// The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself.
	// +kubebuilder:validation:Optional
	defaultMessageTtl?: null | string @go(DefaultMessageTTL,*string)

	// Boolean flag which controls whether the Subscription supports batched operations.
	// +kubebuilder:validation:Optional
	enableBatchedOperations?: null | bool @go(EnableBatchedOperations,*bool)

	// The name of a Queue or Topic to automatically forward Dead Letter messages to.
	// +kubebuilder:validation:Optional
	forwardDeadLetteredMessagesTo?: null | string @go(ForwardDeadLetteredMessagesTo,*string)

	// The name of a Queue or Topic to automatically forward messages to.
	// +kubebuilder:validation:Optional
	forwardTo?: null | string @go(ForwardTo,*string)

	// The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or P0DT0H1M0S . The maximum value is 5 minutes or P0DT0H5M0S .
	// +kubebuilder:validation:Optional
	lockDuration?: null | string @go(LockDuration,*string)

	// The maximum number of deliveries.
	// +kubebuilder:validation:Optional
	maxDeliveryCount?: null | float64 @go(MaxDeliveryCount,*float64)

	// Boolean flag which controls whether this Subscription supports the concept of a session. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	requiresSession?: null | bool @go(RequiresSession,*bool)

	// The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active.
	// +kubebuilder:validation:Optional
	status?: null | string @go(Status,*string)

	// The ID of the ServiceBus Topic to create this Subscription in. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/servicebus/v1beta1.Topic
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	topicId?: null | string @go(TopicID,*string)
}

// SubscriptionSpec defines the desired state of Subscription
#SubscriptionSpec: {
	forProvider: #SubscriptionParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #SubscriptionInitParameters @go(InitProvider)
}

// SubscriptionStatus defines the observed state of Subscription.
#SubscriptionStatus: {
	atProvider?: #SubscriptionObservation @go(AtProvider)
}

// Subscription is the Schema for the Subscriptions API. Manages a ServiceBus Subscription.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Subscription: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.maxDeliveryCount) || (has(self.initProvider) && has(self.initProvider.maxDeliveryCount))",message="spec.forProvider.maxDeliveryCount is a required parameter"
	spec:    #SubscriptionSpec   @go(Spec)
	status?: #SubscriptionStatus @go(Status)
}

// SubscriptionList contains a list of Subscriptions
#SubscriptionList: {
	items: [...#Subscription] @go(Items,[]Subscription)
}