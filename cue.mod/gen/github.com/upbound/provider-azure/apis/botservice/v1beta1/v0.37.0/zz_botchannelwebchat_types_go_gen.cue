// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/botservice/v1beta1

package v1beta1

#BotChannelWebChatInitParameters: {
	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// A list of Web Chat Site names.
	siteNames?: [...null | string] @go(SiteNames,[]*string)
}

#BotChannelWebChatObservation: {
	// The name of the Bot Resource this channel will be associated with. Changing this forces a new resource to be created.
	botName?: null | string @go(BotName,*string)

	// The ID of the Web Chat Channel.
	id?: null | string @go(ID,*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// The name of the resource group where the Web Chat Channel should be created. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A list of Web Chat Site names.
	siteNames?: [...null | string] @go(SiteNames,[]*string)
}

#BotChannelWebChatParameters: {
	// The name of the Bot Resource this channel will be associated with. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/botservice/v1beta1.BotChannelsRegistration
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	botName?: null | string @go(BotName,*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the resource group where the Web Chat Channel should be created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A list of Web Chat Site names.
	// +kubebuilder:validation:Optional
	siteNames?: [...null | string] @go(SiteNames,[]*string)
}

// BotChannelWebChatSpec defines the desired state of BotChannelWebChat
#BotChannelWebChatSpec: {
	forProvider: #BotChannelWebChatParameters @go(ForProvider)

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
	initProvider?: #BotChannelWebChatInitParameters @go(InitProvider)
}

// BotChannelWebChatStatus defines the observed state of BotChannelWebChat.
#BotChannelWebChatStatus: {
	atProvider?: #BotChannelWebChatObservation @go(AtProvider)
}

// BotChannelWebChat is the Schema for the BotChannelWebChats API. Manages a Web Chat integration for a Bot Channel
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#BotChannelWebChat: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || (has(self.initProvider) && has(self.initProvider.location))",message="spec.forProvider.location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.siteNames) || (has(self.initProvider) && has(self.initProvider.siteNames))",message="spec.forProvider.siteNames is a required parameter"
	spec:    #BotChannelWebChatSpec   @go(Spec)
	status?: #BotChannelWebChatStatus @go(Status)
}

// BotChannelWebChatList contains a list of BotChannelWebChats
#BotChannelWebChatList: {
	items: [...#BotChannelWebChat] @go(Items,[]BotChannelWebChat)
}