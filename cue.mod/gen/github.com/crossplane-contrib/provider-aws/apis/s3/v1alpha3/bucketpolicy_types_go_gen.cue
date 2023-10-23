// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/s3/v1alpha3

package v1alpha3

import "github.com/crossplane-contrib/provider-aws/apis/s3/common"

// BucketPolicyParameters define the desired state of an AWS BucketPolicy.
#BucketPolicyParameters: {
	// Region is where the Bucket referenced by this BucketPolicy resides.
	// +immutable
	region: string @go(Region)

	// RawPolicy is a stringified version of the S3 Bucket Policy.
	// either policy or rawPolicy must be specified in the policy
	// +optional
	rawPolicy?: null | string @go(RawPolicy,*string)

	// Policy is a well defined type which can be parsed into an JSON S3 Bucket Policy
	// either policy or rawPolicy must be specified in the policy
	// +optional
	policy?: null | common.#BucketPolicyBody @go(Policy,*common.BucketPolicyBody)

	// BucketName presents the name of the bucket.
	// +optional
	// +immutable
	bucketName?: null | string @go(BucketName,*string)
}

// An BucketPolicySpec defines the desired state of an
// BucketPolicy.
#BucketPolicySpec: {
	forProvider: #BucketPolicyParameters @go(Parameters)
}

// An BucketPolicy is a managed resource that represents an AWS Bucket
// policy.
// +kubebuilder:printcolumn:name="BUCKETNAME",type="string",JSONPath=".spec.forProvider.bucketName"
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
// +kubebuilder:deprecatedversion:warning="BucketPolicy has been deprecated. Use spec.forProvider.policy in Bucket instead."
#BucketPolicy: {
	spec: #BucketPolicySpec @go(Spec)
}

// BucketPolicyList contains a list of BucketPolicies
#BucketPolicyList: {
	items: [...#BucketPolicy] @go(Items,[]BucketPolicy)
}