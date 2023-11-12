// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/kms/v1alpha1

package v1alpha1

// AliasParameters defines the desired state of Alias
#AliasParameters: {
	// Region is which region the Alias will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// Associates the alias with the specified customer managed CMK (https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk).
	// The CMK must be in the same AWS Region.
	//
	// A valid CMK ID is required. If you supply a null or empty string value, this
	// operation returns an error.
	//
	// For help finding the key ID and ARN, see Finding the Key ID and ARN (https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn)
	// in the AWS Key Management Service Developer Guide.
	//
	// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
	//
	// For example:
	//
	//    * Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab
	//
	//    * Key ARN: arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab
	//
	// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
	// +crossplane:generate:reference:type=Key
	targetKeyId?: null | string @go(TargetKeyID,*string)
}

// AliasSpec defines the desired state of Alias
#AliasSpec: {
	forProvider: #AliasParameters @go(ForProvider)
}

// AliasObservation defines the observed state of Alias
#AliasObservation: {
}

// AliasStatus defines the observed state of Alias.
#AliasStatus: {
	atProvider?: #AliasObservation @go(AtProvider)
}

// Alias is the Schema for the Aliases API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Alias: {
	spec:    #AliasSpec   @go(Spec)
	status?: #AliasStatus @go(Status)
}

// AliasList contains a list of Aliases
#AliasList: {
	items: [...#Alias] @go(Items,[]Alias)
}