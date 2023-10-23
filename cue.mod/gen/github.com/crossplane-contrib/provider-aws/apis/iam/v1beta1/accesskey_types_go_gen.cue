// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/iam/v1beta1

package v1beta1

// AccessKeyParameters define the desired state of an AWS IAM Access Key.
#AccessKeyParameters: {
	// Username contains the name of the User.
	// +optional
	// +immutable
	// +crossplane:generate:reference:type=User
	userName?: string @go(Username)

	// The current status of this AccessKey on the AWS
	// Must be either Active or Inactive.
	// +kubebuilder:validation:Enum=Active;Inactive
	accessKeyStatus?: string @go(Status)
}

// An AccessKeySpec defines the desired state of an IAM Access Key.
#AccessKeySpec: {
	forProvider: #AccessKeyParameters @go(ForProvider)
}

// An AccessKey is a managed resource that represents an the Access Key for an AWS IAM User.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:printcolumn:name="STATUS",type="string",JSONPath=".spec.forProvider.accessKeyStatus"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#AccessKey: {
	spec: #AccessKeySpec @go(Spec)
}

// AccessKeyList contains a list of IAM Access Keys
#AccessKeyList: {
	items: [...#AccessKey] @go(Items,[]AccessKey)
}