// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/security/v1beta1

package v1beta1

#SecurityCenterAssessmentInitParameters: {
	// A map of additional data to associate with the assessment.
	additionalData?: {[string]: null | string} @go(AdditionalData,map[string]*string)

	// A status block as defined below.
	status?: [...#StatusInitParameters] @go(Status,[]StatusInitParameters)
}

#SecurityCenterAssessmentObservation: {
	// A map of additional data to associate with the assessment.
	additionalData?: {[string]: null | string} @go(AdditionalData,map[string]*string)

	// The ID of the security Assessment policy to apply to this resource. Changing this forces a new security Assessment to be created.
	assessmentPolicyId?: null | string @go(AssessmentPolicyID,*string)

	// The ID of the Security Center Assessment.
	id?: null | string @go(ID,*string)

	// A status block as defined below.
	status?: [...#StatusObservation] @go(Status,[]StatusObservation)

	// The ID of the target resource. Changing this forces a new security Assessment to be created.
	targetResourceId?: null | string @go(TargetResourceID,*string)
}

#SecurityCenterAssessmentParameters: {
	// A map of additional data to associate with the assessment.
	// +kubebuilder:validation:Optional
	additionalData?: {[string]: null | string} @go(AdditionalData,map[string]*string)

	// The ID of the security Assessment policy to apply to this resource. Changing this forces a new security Assessment to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/security/v1beta1.SecurityCenterAssessmentPolicy
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	assessmentPolicyId?: null | string @go(AssessmentPolicyID,*string)

	// A status block as defined below.
	// +kubebuilder:validation:Optional
	status?: [...#StatusParameters] @go(Status,[]StatusParameters)

	// The ID of the target resource. Changing this forces a new security Assessment to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/compute/v1beta1.LinuxVirtualMachineScaleSet
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	targetResourceId?: null | string @go(TargetResourceID,*string)
}

#StatusInitParameters: {
	// Specifies the cause of the assessment status.
	cause?: null | string @go(Cause,*string)

	// Specifies the programmatic code of the assessment status. Possible values are Healthy, Unhealthy and NotApplicable.
	code?: null | string @go(Code,*string)

	// Specifies the human readable description of the assessment status.
	description?: null | string @go(Description,*string)
}

#StatusObservation: {
	// Specifies the cause of the assessment status.
	cause?: null | string @go(Cause,*string)

	// Specifies the programmatic code of the assessment status. Possible values are Healthy, Unhealthy and NotApplicable.
	code?: null | string @go(Code,*string)

	// Specifies the human readable description of the assessment status.
	description?: null | string @go(Description,*string)
}

#StatusParameters: {
	// Specifies the cause of the assessment status.
	// +kubebuilder:validation:Optional
	cause?: null | string @go(Cause,*string)

	// Specifies the programmatic code of the assessment status. Possible values are Healthy, Unhealthy and NotApplicable.
	// +kubebuilder:validation:Optional
	code?: null | string @go(Code,*string)

	// Specifies the human readable description of the assessment status.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)
}

// SecurityCenterAssessmentSpec defines the desired state of SecurityCenterAssessment
#SecurityCenterAssessmentSpec: {
	forProvider: #SecurityCenterAssessmentParameters @go(ForProvider)

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
	initProvider?: #SecurityCenterAssessmentInitParameters @go(InitProvider)
}

// SecurityCenterAssessmentStatus defines the observed state of SecurityCenterAssessment.
#SecurityCenterAssessmentStatus: {
	atProvider?: #SecurityCenterAssessmentObservation @go(AtProvider)
}

// SecurityCenterAssessment is the Schema for the SecurityCenterAssessments API. Manages the Security Center Assessment for Azure Security Center.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#SecurityCenterAssessment: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.status) || (has(self.initProvider) && has(self.initProvider.status))",message="spec.forProvider.status is a required parameter"
	spec:    #SecurityCenterAssessmentSpec   @go(Spec)
	status?: #SecurityCenterAssessmentStatus @go(Status)
}

// SecurityCenterAssessmentList contains a list of SecurityCenterAssessments
#SecurityCenterAssessmentList: {
	items: [...#SecurityCenterAssessment] @go(Items,[]SecurityCenterAssessment)
}