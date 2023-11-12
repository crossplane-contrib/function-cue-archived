// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/apigateway/v1alpha1

package v1alpha1

// UsagePlanParameters defines the desired state of UsagePlan
#UsagePlanParameters: {
	// Region is which region the UsagePlan will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// The description of the usage plan.
	description?: null | string @go(Description,*string)

	// The name of the usage plan.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The quota of the usage plan.
	quota?: null | #QuotaSettings @go(Quota,*QuotaSettings)

	// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
	// The tag key can be up to 128 characters and must not start with aws:. The
	// tag value can be up to 256 characters.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The throttling limits of the usage plan.
	throttle?: null | #ThrottleSettings @go(Throttle,*ThrottleSettings)

	#CustomUsagePlanParameters
}

// UsagePlanSpec defines the desired state of UsagePlan
#UsagePlanSpec: {
	forProvider: #UsagePlanParameters @go(ForProvider)
}

// UsagePlanObservation defines the observed state of UsagePlan
#UsagePlanObservation: {
	// The associated API stages of a usage plan.
	apiStages?: [...null | #APIStage] @go(APIStages,[]*APIStage)

	// The identifier of a UsagePlan resource.
	id?: null | string @go(ID,*string)

	// The AWS Markeplace product identifier to associate with the usage plan as
	// a SaaS product on AWS Marketplace.
	productCode?: null | string @go(ProductCode,*string)
}

// UsagePlanStatus defines the observed state of UsagePlan.
#UsagePlanStatus: {
	atProvider?: #UsagePlanObservation @go(AtProvider)
}

// UsagePlan is the Schema for the UsagePlans API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#UsagePlan: {
	spec:    #UsagePlanSpec   @go(Spec)
	status?: #UsagePlanStatus @go(Status)
}

// UsagePlanList contains a list of UsagePlans
#UsagePlanList: {
	items: [...#UsagePlan] @go(Items,[]UsagePlan)
}