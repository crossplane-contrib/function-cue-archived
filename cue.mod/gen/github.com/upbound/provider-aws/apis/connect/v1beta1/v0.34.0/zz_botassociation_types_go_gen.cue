// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/connect/v1beta1

package v1beta1

#BotAssociationObservation: {
	// The Amazon Connect instance ID, Lex (V1) bot name, and Lex (V1) bot region separated by colons (:).
	id?: null | string @go(ID,*string)

	// The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.
	instanceId?: null | string @go(InstanceID,*string)

	// Configuration information of an Amazon Lex (V1) bot. Detailed below.
	lexBot?: [...#LexBotObservation] @go(LexBot,[]LexBotObservation)
}

#BotAssociationParameters: {
	// The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/connect/v1beta1.Instance
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	instanceId?: null | string @go(InstanceID,*string)

	// Configuration information of an Amazon Lex (V1) bot. Detailed below.
	// +kubebuilder:validation:Optional
	lexBot?: [...#LexBotParameters] @go(LexBot,[]LexBotParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

#LexBotObservation: {
	// The Region that the Amazon Lex (V1) bot was created in. Defaults to current region.
	lexRegion?: null | string @go(LexRegion,*string)

	// The name of the Amazon Lex (V1) bot.
	name?: null | string @go(Name,*string)
}

#LexBotParameters: {
	// The Region that the Amazon Lex (V1) bot was created in. Defaults to current region.
	// +kubebuilder:validation:Optional
	lexRegion?: null | string @go(LexRegion,*string)

	// The name of the Amazon Lex (V1) bot.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/lexmodels/v1beta1.Bot
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)
}

// BotAssociationSpec defines the desired state of BotAssociation
#BotAssociationSpec: {
	forProvider: #BotAssociationParameters @go(ForProvider)
}

// BotAssociationStatus defines the observed state of BotAssociation.
#BotAssociationStatus: {
	atProvider?: #BotAssociationObservation @go(AtProvider)
}

// BotAssociation is the Schema for the BotAssociations API. Associates an Amazon Connect instance to an Amazon Lex (V1) bot
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#BotAssociation: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.lexBot)",message="lexBot is a required parameter"
	spec:    #BotAssociationSpec   @go(Spec)
	status?: #BotAssociationStatus @go(Status)
}

// BotAssociationList contains a list of BotAssociations
#BotAssociationList: {
	items: [...#BotAssociation] @go(Items,[]BotAssociation)
}