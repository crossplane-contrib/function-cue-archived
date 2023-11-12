// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/evidently/v1beta1

package v1beta1

#EvaluationRulesObservation: {
	// The name of the experiment or launch.
	name?: null | string @go(Name,*string)

	// This value is aws.evidently.splits if this is an evaluation rule for a launch, and it is aws.evidently.onlineab if this is an evaluation rule for an experiment.
	type?: null | string @go(Type,*string)
}

#EvaluationRulesParameters: {
}

#FeatureObservation: {
	// The ARN of the feature.
	arn?: null | string @go(Arn,*string)

	// The date and time that the feature is created.
	createdTime?: null | string @go(CreatedTime,*string)

	// One or more blocks that define the evaluation rules for the feature. Detailed below
	evaluationRules?: [...#EvaluationRulesObservation] @go(EvaluationRules,[]EvaluationRulesObservation)

	// The feature name and the project name or arn separated by a colon (:).
	id?: null | string @go(ID,*string)

	// The date and time that the feature was most recently updated.
	lastUpdatedTime?: null | string @go(LastUpdatedTime,*string)

	// The current state of the feature. Valid values are AVAILABLE and UPDATING.
	status?: null | string @go(Status,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// Defines the type of value used to define the different feature variations. Valid Values: STRING, LONG, DOUBLE, BOOLEAN.
	valueType?: null | string @go(ValueType,*string)
}

#FeatureParameters: {
	// The name of the variation to use as the default variation. The default variation is served to users who are not allocated to any ongoing launches or experiments of this feature. This variation must also be listed in the variations structure. If you omit default_variation, the first variation listed in the variations structure is used as the default variation.
	// +kubebuilder:validation:Optional
	defaultVariation?: null | string @go(DefaultVariation,*string)

	// Specifies the description of the feature.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Specify users that should always be served a specific variation of a feature. Each user is specified by a key-value pair . For each key, specify a user by entering their user ID, account ID, or some other identifier. For the value, specify the name of the variation that they are to be served.
	// +kubebuilder:validation:Optional
	entityOverrides?: {[string]: null | string} @go(EntityOverrides,map[string]*string)

	// Specify ALL_RULES to activate the traffic allocation specified by any ongoing launches or experiments. Specify DEFAULT_VARIATION to serve the default variation to all users instead.
	// +kubebuilder:validation:Optional
	evaluationStrategy?: null | string @go(EvaluationStrategy,*string)

	// The name or ARN of the project that is to contain the new feature.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/evidently/v1beta1.Project
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// One or more blocks that contain the configuration of the feature's different variations. Detailed below
	// +kubebuilder:validation:Required
	variations: [...#VariationsParameters] @go(Variations,[]VariationsParameters)
}

#ValueObservation: {
}

#ValueParameters: {
	// If this feature uses the Boolean variation type, this field contains the Boolean value of this variation.
	// +kubebuilder:validation:Optional
	boolValue?: null | string @go(BoolValue,*string)

	// If this feature uses the double integer variation type, this field contains the double integer value of this variation.
	// +kubebuilder:validation:Optional
	doubleValue?: null | string @go(DoubleValue,*string)

	// If this feature uses the long variation type, this field contains the long value of this variation. Minimum value of -9007199254740991. Maximum value of 9007199254740991.
	// +kubebuilder:validation:Optional
	longValue?: null | string @go(LongValue,*string)

	// If this feature uses the string variation type, this field contains the string value of this variation. Minimum length of 0. Maximum length of 512.
	// +kubebuilder:validation:Optional
	stringValue?: null | string @go(StringValue,*string)
}

#VariationsObservation: {
}

#VariationsParameters: {
	// The name of the variation. Minimum length of 1. Maximum length of 127.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// A block that specifies the value assigned to this variation. Detailed below
	// +kubebuilder:validation:Required
	value: [...#ValueParameters] @go(Value,[]ValueParameters)
}

// FeatureSpec defines the desired state of Feature
#FeatureSpec: {
	forProvider: #FeatureParameters @go(ForProvider)
}

// FeatureStatus defines the observed state of Feature.
#FeatureStatus: {
	atProvider?: #FeatureObservation @go(AtProvider)
}

// Feature is the Schema for the Features API. Provides a CloudWatch Evidently Feature resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Feature: {
	spec:    #FeatureSpec   @go(Spec)
	status?: #FeatureStatus @go(Status)
}

// FeatureList contains a list of Features
#FeatureList: {
	items: [...#Feature] @go(Items,[]Feature)
}