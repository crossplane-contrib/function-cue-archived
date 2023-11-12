// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/kms/v1beta1

package v1beta1

#CiphertextObservation: {
	// Base64 encoded ciphertext
	ciphertextBlob?: null | string @go(CiphertextBlob,*string)
	id?:             null | string @go(ID,*string)
}

#CiphertextParameters: {
	// An optional mapping that makes up the encryption context.
	// +kubebuilder:validation:Optional
	context?: {[string]: null | string} @go(Context,map[string]*string)

	// Globally unique key ID for the customer master key.
	// +crossplane:generate:reference:type=Key
	// +kubebuilder:validation:Optional
	keyId?: null | string @go(KeyID,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// CiphertextSpec defines the desired state of Ciphertext
#CiphertextSpec: {
	forProvider: #CiphertextParameters @go(ForProvider)
}

// CiphertextStatus defines the observed state of Ciphertext.
#CiphertextStatus: {
	atProvider?: #CiphertextObservation @go(AtProvider)
}

// Ciphertext is the Schema for the Ciphertexts API. Provides ciphertext encrypted using a KMS key
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Ciphertext: {
	spec:    #CiphertextSpec   @go(Spec)
	status?: #CiphertextStatus @go(Status)
}

// CiphertextList contains a list of Ciphertexts
#CiphertextList: {
	items: [...#Ciphertext] @go(Items,[]Ciphertext)
}