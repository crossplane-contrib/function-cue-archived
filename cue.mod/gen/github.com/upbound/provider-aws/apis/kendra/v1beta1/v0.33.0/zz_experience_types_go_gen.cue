// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/kendra/v1beta1

package v1beta1

#ContentSourceConfigurationObservation: {
}

#ContentSourceConfigurationParameters: {
	// The identifiers of the data sources you want to use for your Amazon Kendra experience. Maximum number of 100 items.
	// +kubebuilder:validation:Optional
	dataSourceIds?: [...null | string] @go(DataSourceIds,[]*string)

	// Whether to use documents you indexed directly using the BatchPutDocument API. Defaults to false.
	// +kubebuilder:validation:Optional
	directPutContent?: null | bool @go(DirectPutContent,*bool)

	// The identifier of the FAQs that you want to use for your Amazon Kendra experience. Maximum number of 100 items.
	// +kubebuilder:validation:Optional
	faqIds?: [...null | string] @go(FaqIds,[]*string)
}

#EndpointsObservation: {
	// The endpoint of your Amazon Kendra experience.
	endpoint?: null | string @go(Endpoint,*string)

	// The type of endpoint for your Amazon Kendra experience.
	endpointType?: null | string @go(EndpointType,*string)
}

#EndpointsParameters: {
}

#ExperienceConfigurationObservation: {
}

#ExperienceConfigurationParameters: {
	// The identifiers of your data sources and FAQs. Or, you can specify that you want to use documents indexed via the BatchPutDocument API. Detailed below.
	// +kubebuilder:validation:Optional
	contentSourceConfiguration?: [...#ContentSourceConfigurationParameters] @go(ContentSourceConfiguration,[]ContentSourceConfigurationParameters)

	// The AWS SSO field name that contains the identifiers of your users, such as their emails. Detailed below.
	// +kubebuilder:validation:Optional
	userIdentityConfiguration?: [...#UserIdentityConfigurationParameters] @go(UserIdentityConfiguration,[]UserIdentityConfigurationParameters)
}

#ExperienceObservation: {
	// ARN of the Experience.
	arn?: null | string @go(Arn,*string)

	// Shows the endpoint URLs for your Amazon Kendra experiences. The URLs are unique and fully hosted by AWS.
	endpoints?: [...#EndpointsObservation] @go(Endpoints,[]EndpointsObservation)

	// The unique identifier of the experience.
	experienceId?: null | string @go(ExperienceID,*string)

	// The unique identifiers of the experience and index separated by a slash (/).
	id?: null | string @go(ID,*string)

	// The current processing status of your Amazon Kendra experience.
	status?: null | string @go(Status,*string)
}

#ExperienceParameters: {
	// Configuration information for your Amazon Kendra experience. Detailed below.
	// +kubebuilder:validation:Optional
	configuration?: [...#ExperienceConfigurationParameters] @go(Configuration,[]ExperienceConfigurationParameters)

	// A description for your Amazon Kendra experience.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The identifier of the index for your Amazon Kendra experience.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/kendra/v1beta1.Index
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	indexId?: null | string @go(IndexID,*string)

	// A name for your Amazon Kendra experience.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The Amazon Resource Name (ARN) of a role with permission to access Query API, QuerySuggestions API, SubmitFeedback API, and AWS SSO that stores your user and group information. For more information, see IAM roles for Amazon Kendra.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	roleArn?: null | string @go(RoleArn,*string)
}

#UserIdentityConfigurationObservation: {
}

#UserIdentityConfigurationParameters: {
	// The AWS SSO field name that contains the identifiers of your users, such as their emails.
	// +kubebuilder:validation:Required
	identityAttributeName?: null | string @go(IdentityAttributeName,*string)
}

// ExperienceSpec defines the desired state of Experience
#ExperienceSpec: {
	forProvider: #ExperienceParameters @go(ForProvider)
}

// ExperienceStatus defines the observed state of Experience.
#ExperienceStatus: {
	atProvider?: #ExperienceObservation @go(AtProvider)
}

// Experience is the Schema for the Experiences API.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Experience: {
	spec:    #ExperienceSpec   @go(Spec)
	status?: #ExperienceStatus @go(Status)
}

// ExperienceList contains a list of Experiences
#ExperienceList: {
	items: [...#Experience] @go(Items,[]Experience)
}