// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/media/v1beta1

package v1beta1

#ContentKeyObservation: {
	// ID of Content Key. Changing this forces a new Streaming Locator to be created.
	contentKeyId?: null | string @go(ContentKeyID,*string)

	// Label of Content Key as specified in the Streaming Policy. Changing this forces a new Streaming Locator to be created.
	labelReferenceInStreamingPolicy?: null | string @go(LabelReferenceInStreamingPolicy,*string)

	// Content Key Policy used by Content Key. Changing this forces a new Streaming Locator to be created.
	policyName?: null | string @go(PolicyName,*string)

	// Encryption type of Content Key. Supported values are CommonEncryptionCbcs, CommonEncryptionCenc or EnvelopeEncryption. Changing this forces a new Streaming Locator to be created.
	type?: null | string @go(Type,*string)

	// Value of Content Key. Changing this forces a new Streaming Locator to be created.
	value?: null | string @go(Value,*string)
}

#ContentKeyParameters: {
	// ID of Content Key. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	contentKeyId?: null | string @go(ContentKeyID,*string)

	// Label of Content Key as specified in the Streaming Policy. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	labelReferenceInStreamingPolicy?: null | string @go(LabelReferenceInStreamingPolicy,*string)

	// Content Key Policy used by Content Key. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	policyName?: null | string @go(PolicyName,*string)

	// Encryption type of Content Key. Supported values are CommonEncryptionCbcs, CommonEncryptionCenc or EnvelopeEncryption. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)

	// Value of Content Key. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#StreamingLocatorObservation: {
	// Alternative Media ID of this Streaming Locator. Changing this forces a new Streaming Locator to be created.
	alternativeMediaId?: null | string @go(AlternativeMediaID,*string)

	// Asset Name. Changing this forces a new Streaming Locator to be created.
	assetName?: null | string @go(AssetName,*string)

	// One or more content_key blocks as defined below. Changing this forces a new Streaming Locator to be created.
	contentKey?: [...#ContentKeyObservation] @go(ContentKey,[]ContentKeyObservation)

	// Name of the default Content Key Policy used by this Streaming Locator.Changing this forces a new Streaming Locator to be created.
	defaultContentKeyPolicyName?: null | string @go(DefaultContentKeyPolicyName,*string)

	// The end time of the Streaming Locator. Changing this forces a new Streaming Locator to be created.
	endTime?: null | string @go(EndTime,*string)

	// A list of names of asset or account filters which apply to this Streaming Locator. Changing this forces a new Streaming Locator to be created.
	filterNames?: [...null | string] @go(FilterNames,[]*string)

	// The ID of the Streaming Locator.
	id?: null | string @go(ID,*string)

	// The Media Services account name. Changing this forces a new Streaming Locator to be created.
	mediaServicesAccountName?: null | string @go(MediaServicesAccountName,*string)

	// The name of the Resource Group where the Streaming Locator should exist. Changing this forces a new Streaming Locator to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The start time of the Streaming Locator. Changing this forces a new Streaming Locator to be created.
	startTime?: null | string @go(StartTime,*string)

	// The ID of the Streaming Locator. Changing this forces a new Streaming Locator to be created.
	streamingLocatorId?: null | string @go(StreamingLocatorID,*string)

	// Name of the Streaming Policy used by this Streaming Locator. Either specify the name of Streaming Policy you created or use one of the predefined Streaming Policies. The predefined Streaming Policies available are: Predefined_DownloadOnly, Predefined_ClearStreamingOnly, Predefined_DownloadAndClearStreaming, Predefined_ClearKey, Predefined_MultiDrmCencStreaming and Predefined_MultiDrmStreaming. Changing this forces a new Streaming Locator to be created.
	streamingPolicyName?: null | string @go(StreamingPolicyName,*string)
}

#StreamingLocatorParameters: {
	// Alternative Media ID of this Streaming Locator. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	alternativeMediaId?: null | string @go(AlternativeMediaID,*string)

	// Asset Name. Changing this forces a new Streaming Locator to be created.
	// +crossplane:generate:reference:type=Asset
	// +kubebuilder:validation:Optional
	assetName?: null | string @go(AssetName,*string)

	// One or more content_key blocks as defined below. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	contentKey?: [...#ContentKeyParameters] @go(ContentKey,[]ContentKeyParameters)

	// Name of the default Content Key Policy used by this Streaming Locator.Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	defaultContentKeyPolicyName?: null | string @go(DefaultContentKeyPolicyName,*string)

	// The end time of the Streaming Locator. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	endTime?: null | string @go(EndTime,*string)

	// A list of names of asset or account filters which apply to this Streaming Locator. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	filterNames?: [...null | string] @go(FilterNames,[]*string)

	// The Media Services account name. Changing this forces a new Streaming Locator to be created.
	// +crossplane:generate:reference:type=ServicesAccount
	// +kubebuilder:validation:Optional
	mediaServicesAccountName?: null | string @go(MediaServicesAccountName,*string)

	// The name of the Resource Group where the Streaming Locator should exist. Changing this forces a new Streaming Locator to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The start time of the Streaming Locator. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	startTime?: null | string @go(StartTime,*string)

	// The ID of the Streaming Locator. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	streamingLocatorId?: null | string @go(StreamingLocatorID,*string)

	// Name of the Streaming Policy used by this Streaming Locator. Either specify the name of Streaming Policy you created or use one of the predefined Streaming Policies. The predefined Streaming Policies available are: Predefined_DownloadOnly, Predefined_ClearStreamingOnly, Predefined_DownloadAndClearStreaming, Predefined_ClearKey, Predefined_MultiDrmCencStreaming and Predefined_MultiDrmStreaming. Changing this forces a new Streaming Locator to be created.
	// +kubebuilder:validation:Optional
	streamingPolicyName?: null | string @go(StreamingPolicyName,*string)
}

// StreamingLocatorSpec defines the desired state of StreamingLocator
#StreamingLocatorSpec: {
	forProvider: #StreamingLocatorParameters @go(ForProvider)
}

// StreamingLocatorStatus defines the observed state of StreamingLocator.
#StreamingLocatorStatus: {
	atProvider?: #StreamingLocatorObservation @go(AtProvider)
}

// StreamingLocator is the Schema for the StreamingLocators API. Manages a Media Streaming Locator.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#StreamingLocator: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.streamingPolicyName)",message="streamingPolicyName is a required parameter"
	spec:    #StreamingLocatorSpec   @go(Spec)
	status?: #StreamingLocatorStatus @go(Status)
}

// StreamingLocatorList contains a list of StreamingLocators
#StreamingLocatorList: {
	items: [...#StreamingLocator] @go(Items,[]StreamingLocator)
}