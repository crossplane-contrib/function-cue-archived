// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/elb/v1beta1

package v1beta1

#AttachmentObservation: {
	// The name of the ELB.
	elb?: null | string @go(ELB,*string)
	id?:  null | string @go(ID,*string)

	// Instance ID to place in the ELB pool.
	instance?: null | string @go(Instance,*string)
}

#AttachmentParameters: {
	// The name of the ELB.
	// +crossplane:generate:reference:type=ELB
	// +kubebuilder:validation:Optional
	elb?: null | string @go(ELB,*string)

	// Instance ID to place in the ELB pool.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.Instance
	// +kubebuilder:validation:Optional
	instance?: null | string @go(Instance,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// AttachmentSpec defines the desired state of Attachment
#AttachmentSpec: {
	forProvider: #AttachmentParameters @go(ForProvider)
}

// AttachmentStatus defines the observed state of Attachment.
#AttachmentStatus: {
	atProvider?: #AttachmentObservation @go(AtProvider)
}

// Attachment is the Schema for the Attachments API. Provides an Elastic Load Balancer Attachment resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Attachment: {
	spec:    #AttachmentSpec   @go(Spec)
	status?: #AttachmentStatus @go(Status)
}

// AttachmentList contains a list of Attachments
#AttachmentList: {
	items: [...#Attachment] @go(Items,[]Attachment)
}