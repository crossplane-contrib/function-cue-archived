// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/iam/v1beta1

package v1beta1

#UserSSHKeyObservation: {
	// Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM.
	encoding?: null | string @go(Encoding,*string)

	// The MD5 message digest of the SSH public key.
	fingerprint?: null | string @go(Fingerprint,*string)
	id?:          null | string @go(ID,*string)

	// The SSH public key. The public key must be encoded in ssh-rsa format or PEM format.
	publicKey?: null | string @go(PublicKey,*string)

	// The unique identifier for the SSH public key.
	sshPublicKeyId?: null | string @go(SSHPublicKeyID,*string)

	// The status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used. Default is active.
	status?: null | string @go(Status,*string)

	// The name of the IAM user to associate the SSH public key with.
	username?: null | string @go(Username,*string)
}

#UserSSHKeyParameters: {
	// Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM.
	// +kubebuilder:validation:Optional
	encoding?: null | string @go(Encoding,*string)

	// The SSH public key. The public key must be encoded in ssh-rsa format or PEM format.
	// +kubebuilder:validation:Optional
	publicKey?: null | string @go(PublicKey,*string)

	// The status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used. Default is active.
	// +kubebuilder:validation:Optional
	status?: null | string @go(Status,*string)

	// The name of the IAM user to associate the SSH public key with.
	// +crossplane:generate:reference:type=User
	// +kubebuilder:validation:Optional
	username?: null | string @go(Username,*string)
}

// UserSSHKeySpec defines the desired state of UserSSHKey
#UserSSHKeySpec: {
	forProvider: #UserSSHKeyParameters @go(ForProvider)
}

// UserSSHKeyStatus defines the observed state of UserSSHKey.
#UserSSHKeyStatus: {
	atProvider?: #UserSSHKeyObservation @go(AtProvider)
}

// UserSSHKey is the Schema for the UserSSHKeys API. Uploads an SSH public key and associates it with the specified IAM user.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#UserSSHKey: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.encoding)",message="encoding is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.publicKey)",message="publicKey is a required parameter"
	spec:    #UserSSHKeySpec   @go(Spec)
	status?: #UserSSHKeyStatus @go(Status)
}

// UserSSHKeyList contains a list of UserSSHKeys
#UserSSHKeyList: {
	items: [...#UserSSHKey] @go(Items,[]UserSSHKey)
}