// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/botservice/v1beta1

package v1beta1

#BotChannelMSTeamsObservation: {
	// The name of the Bot Resource this channel will be associated with. Changing this forces a new resource to be created.
	botName?: null | string @go(BotName,*string)

	// Specifies the webhook for Microsoft Teams channel calls.
	callingWebHook?: null | string @go(CallingWebHook,*string)

	// Specifies whether to enable Microsoft Teams channel calls. This defaults to false.
	enableCalling?: null | bool @go(EnableCalling,*bool)

	// The ID of the Microsoft Teams Integration for a Bot Channel.
	id?: null | string @go(ID,*string)

	// The supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// The name of the resource group in which to create the Bot Channel. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

#BotChannelMSTeamsParameters: {
	// The name of the Bot Resource this channel will be associated with. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/botservice/v1beta1.BotChannelsRegistration
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	botName?: null | string @go(BotName,*string)

	// Specifies the webhook for Microsoft Teams channel calls.
	// +kubebuilder:validation:Optional
	callingWebHook?: null | string @go(CallingWebHook,*string)

	// Specifies whether to enable Microsoft Teams channel calls. This defaults to false.
	// +kubebuilder:validation:Optional
	enableCalling?: null | bool @go(EnableCalling,*bool)

	// The supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The name of the resource group in which to create the Bot Channel. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)
}

// BotChannelMSTeamsSpec defines the desired state of BotChannelMSTeams
#BotChannelMSTeamsSpec: {
	forProvider: #BotChannelMSTeamsParameters @go(ForProvider)
}

// BotChannelMSTeamsStatus defines the observed state of BotChannelMSTeams.
#BotChannelMSTeamsStatus: {
	atProvider?: #BotChannelMSTeamsObservation @go(AtProvider)
}

// BotChannelMSTeams is the Schema for the BotChannelMSTeamss API. Manages an MS Teams integration for a Bot Channel
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#BotChannelMSTeams: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.location)",message="location is a required parameter"
	spec:    #BotChannelMSTeamsSpec   @go(Spec)
	status?: #BotChannelMSTeamsStatus @go(Status)
}

// BotChannelMSTeamsList contains a list of BotChannelMSTeamss
#BotChannelMSTeamsList: {
	items: [...#BotChannelMSTeams] @go(Items,[]BotChannelMSTeams)
}