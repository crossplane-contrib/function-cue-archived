// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/servicediscovery/v1alpha1

package v1alpha1

#AnnotationKeyOperationID: "servicediscovery.aws.crossplane.io/operation-id"

// CustomServiceParameters are custom parameters for Services.
#CustomServiceParameters: {
}

// CustomPrivateDNSNamespaceParameters are custom parameters for PrivateDNSNamespaces.
#CustomPrivateDNSNamespaceParameters: {
	// VPC of the PrivateDNSNamespace.
	// One if vpc, vpcRef or vpcSelector has to be supplied.
	vpc?: null | string @go(VPC,*string)
}

// CustomHTTPNamespaceParameters are custom parameters for HTTPNamespaces.
#CustomHTTPNamespaceParameters: {
}

// CustomPublicDNSNamespaceParameters are custom parameters for PublicDNSNamespaces.
#CustomPublicDNSNamespaceParameters: {
}