// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/servicediscovery/v1alpha1

package v1alpha1

// PublicDNSNamespaceParameters defines the desired state of PublicDNSNamespace
#PublicDNSNamespaceParameters: {
	// Region is which region the PublicDNSNamespace will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// A description for the namespace.
	description?: null | string @go(Description,*string)

	// The name that you want to assign to this namespace.
	//
	// Do not include sensitive information in the name. The name is publicly available
	// using DNS queries.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// Properties for the public DNS namespace.
	properties?: null | #PublicDNSNamespaceProperties @go(Properties,*PublicDNSNamespaceProperties)

	// The tags to add to the namespace. Each tag consists of a key and an optional
	// value that you define. Tags keys can be up to 128 characters in length, and
	// tag values can be up to 256 characters in length.
	tags?: [...null | #Tag] @go(Tags,[]*Tag)

	#CustomPublicDNSNamespaceParameters
}

// PublicDNSNamespaceSpec defines the desired state of PublicDNSNamespace
#PublicDNSNamespaceSpec: {
	forProvider: #PublicDNSNamespaceParameters @go(ForProvider)
}

// PublicDNSNamespaceObservation defines the observed state of PublicDNSNamespace
#PublicDNSNamespaceObservation: {
	// A value that you can use to determine whether the request completed successfully.
	// To get the status of the operation, see GetOperation (https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html).
	operationID?: null | string @go(OperationID,*string)
}

// PublicDNSNamespaceStatus defines the observed state of PublicDNSNamespace.
#PublicDNSNamespaceStatus: {
	atProvider?: #PublicDNSNamespaceObservation @go(AtProvider)
}

// PublicDNSNamespace is the Schema for the PublicDNSNamespaces API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#PublicDNSNamespace: {
	spec:    #PublicDNSNamespaceSpec   @go(Spec)
	status?: #PublicDNSNamespaceStatus @go(Status)
}

// PublicDNSNamespaceList contains a list of PublicDNSNamespaces
#PublicDNSNamespaceList: {
	items: [...#PublicDNSNamespace] @go(Items,[]PublicDNSNamespace)
}