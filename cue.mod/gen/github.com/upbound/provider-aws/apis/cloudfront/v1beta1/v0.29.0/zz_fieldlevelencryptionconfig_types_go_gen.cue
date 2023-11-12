// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudfront/v1beta1

package v1beta1

#ContentTypeProfileConfigObservation: {
}

#ContentTypeProfileConfigParameters: {
	// Object that contains an attribute items that contains the list of configurations for a field-level encryption content type-profile. See Content Type Profile.
	// +kubebuilder:validation:Required
	contentTypeProfiles: [...#ContentTypeProfilesParameters] @go(ContentTypeProfiles,[]ContentTypeProfilesParameters)

	// specifies what to do when an unknown content type is provided for the profile. If true, content is forwarded without being encrypted when the content type is unknown. If false (the default), an error is returned when the content type is unknown.
	// +kubebuilder:validation:Required
	forwardWhenContentTypeIsUnknown?: null | bool @go(ForwardWhenContentTypeIsUnknown,*bool)
}

#ContentTypeProfilesItemsObservation: {
}

#ContentTypeProfilesItemsParameters: {
	// he content type for a field-level encryption content type-profile mapping. Valid value is application/x-www-form-urlencoded.
	// +kubebuilder:validation:Required
	contentType?: null | string @go(ContentType,*string)

	// The format for a field-level encryption content type-profile mapping. Valid value is URLEncoded.
	// +kubebuilder:validation:Required
	format?: null | string @go(Format,*string)

	// The profile ID for a field-level encryption content type-profile mapping.
	// +kubebuilder:validation:Optional
	profileId?: null | string @go(ProfileID,*string)
}

#ContentTypeProfilesObservation: {
}

#ContentTypeProfilesParameters: {
	// +kubebuilder:validation:Required
	items: [...#ContentTypeProfilesItemsParameters] @go(Items,[]ContentTypeProfilesItemsParameters)
}

#FieldLevelEncryptionConfigObservation: {
	// Internal value used by CloudFront to allow future updates to the Field Level Encryption Config.
	callerReference?: null | string @go(CallerReference,*string)

	// The current version of the Field Level Encryption Config. For example: E2QWRUHAPOMQZL.
	etag?: null | string @go(Etag,*string)

	// The identifier for the Field Level Encryption Config. For example: K3D5EWEUDCCXON.
	id?: null | string @go(ID,*string)
}

#FieldLevelEncryptionConfigParameters: {
	// An optional comment about the Field Level Encryption Config.
	// +kubebuilder:validation:Optional
	comment?: null | string @go(Comment,*string)

	// Content Type Profile Config specifies when to forward content if a content type isn't recognized and profiles to use as by default in a request if a query argument doesn't specify a profile to use.
	// +kubebuilder:validation:Required
	contentTypeProfileConfig: [...#ContentTypeProfileConfigParameters] @go(ContentTypeProfileConfig,[]ContentTypeProfileConfigParameters)

	// Query Arg Profile Config that specifies when to forward content if a profile isn't found and the profile that can be provided as a query argument in a request.
	// +kubebuilder:validation:Required
	queryArgProfileConfig: [...#QueryArgProfileConfigParameters] @go(QueryArgProfileConfig,[]QueryArgProfileConfigParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

#QueryArgProfileConfigObservation: {
}

#QueryArgProfileConfigParameters: {
	// Flag to set if you want a request to be forwarded to the origin even if the profile specified by the field-level encryption query argument, fle-profile, is unknown.
	// +kubebuilder:validation:Required
	forwardWhenQueryArgProfileIsUnknown?: null | bool @go(ForwardWhenQueryArgProfileIsUnknown,*bool)

	// Object that contains an attribute items that contains the list ofrofiles specified for query argument-profile mapping for field-level encryption. see Query Arg Profile.
	// +kubebuilder:validation:Optional
	queryArgProfiles?: [...#QueryArgProfilesParameters] @go(QueryArgProfiles,[]QueryArgProfilesParameters)
}

#QueryArgProfilesItemsObservation: {
}

#QueryArgProfilesItemsParameters: {
	// The profile ID for a field-level encryption content type-profile mapping.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/cloudfront/v1beta1.FieldLevelEncryptionProfile
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	profileId?: null | string @go(ProfileID,*string)

	// Query argument for field-level encryption query argument-profile mapping.
	// +kubebuilder:validation:Required
	queryArg?: null | string @go(QueryArg,*string)
}

#QueryArgProfilesObservation: {
}

#QueryArgProfilesParameters: {
	// +kubebuilder:validation:Optional
	items?: [...#QueryArgProfilesItemsParameters] @go(Items,[]QueryArgProfilesItemsParameters)
}

// FieldLevelEncryptionConfigSpec defines the desired state of FieldLevelEncryptionConfig
#FieldLevelEncryptionConfigSpec: {
	forProvider: #FieldLevelEncryptionConfigParameters @go(ForProvider)
}

// FieldLevelEncryptionConfigStatus defines the observed state of FieldLevelEncryptionConfig.
#FieldLevelEncryptionConfigStatus: {
	atProvider?: #FieldLevelEncryptionConfigObservation @go(AtProvider)
}

// FieldLevelEncryptionConfig is the Schema for the FieldLevelEncryptionConfigs API. Provides a CloudFront Field-level Encryption Config resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#FieldLevelEncryptionConfig: {
	spec:    #FieldLevelEncryptionConfigSpec   @go(Spec)
	status?: #FieldLevelEncryptionConfigStatus @go(Status)
}

// FieldLevelEncryptionConfigList contains a list of FieldLevelEncryptionConfigs
#FieldLevelEncryptionConfigList: {
	items: [...#FieldLevelEncryptionConfig] @go(Items,[]FieldLevelEncryptionConfig)
}