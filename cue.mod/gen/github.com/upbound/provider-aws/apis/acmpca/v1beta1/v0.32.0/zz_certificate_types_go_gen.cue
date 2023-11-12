// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/acmpca/v1beta1

package v1beta1

#CertificateObservation: {
	// ARN of the certificate.
	arn?: null | string @go(Arn,*string)

	// PEM-encoded certificate value.
	certificate?: null | string @go(Certificate,*string)

	// PEM-encoded certificate chain that includes any intermediate certificates and chains up to root CA.
	certificateChain?: null | string @go(CertificateChain,*string)
	id?:               null | string @go(ID,*string)
}

#CertificateParameters: {
	// ARN of the certificate authority.
	// +crossplane:generate:reference:type=CertificateAuthority
	// +kubebuilder:validation:Optional
	certificateAuthorityArn?: null | string @go(CertificateAuthorityArn,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Algorithm to use to sign certificate requests. Valid values: SHA256WITHRSA, SHA256WITHECDSA, SHA384WITHRSA, SHA384WITHECDSA, SHA512WITHRSA, SHA512WITHECDSA.
	// +kubebuilder:validation:Required
	signingAlgorithm?: null | string @go(SigningAlgorithm,*string)

	// Template to use when issuing a certificate.
	// See ACM PCA Documentation for more information.
	// +kubebuilder:validation:Optional
	templateArn?: null | string @go(TemplateArn,*string)

	// Configures end of the validity period for the certificate. See validity block below.
	// +kubebuilder:validation:Required
	validity: [...#ValidityParameters] @go(Validity,[]ValidityParameters)
}

#ValidityObservation: {
}

#ValidityParameters: {
	// Determines how value is interpreted. Valid values: DAYS, MONTHS, YEARS, ABSOLUTE, END_DATE.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)

	// If type is DAYS, MONTHS, or YEARS, the relative time until the certificate expires. If type is ABSOLUTE, the date in seconds since the Unix epoch. If type is END_DATE, the  date in RFC 3339 format.
	// +kubebuilder:validation:Required
	value?: null | string @go(Value,*string)
}

// CertificateSpec defines the desired state of Certificate
#CertificateSpec: {
	forProvider: #CertificateParameters @go(ForProvider)
}

// CertificateStatus defines the observed state of Certificate.
#CertificateStatus: {
	atProvider?: #CertificateObservation @go(AtProvider)
}

// Certificate is the Schema for the Certificates API. Provides a resource to issue a certificate using AWS Certificate Manager Private Certificate Authority (ACM PCA)
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Certificate: {
	spec:    #CertificateSpec   @go(Spec)
	status?: #CertificateStatus @go(Status)
}

// CertificateList contains a list of Certificates
#CertificateList: {
	items: [...#Certificate] @go(Items,[]Certificate)
}