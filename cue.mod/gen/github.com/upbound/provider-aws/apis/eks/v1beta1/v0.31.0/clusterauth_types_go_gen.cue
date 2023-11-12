// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/eks/v1beta1

package v1beta1

#ClusterAuthParameters: {
	// Region is the region you'd like your resource to be created in.
	// +terrajet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// ClusterName is the name of the cluster you'd like to fetch Kubeconfig of.
	// Either ClusterName, ClusterNameRef or ClusterNameSelector has to be given.
	// +crossplane:generate:reference:type=Cluster
	// +crossplane:generate:reference:extractor=ExternalNameIfClusterActive()
	clusterName?: string @go(ClusterName)
}

// ClusterAuthSpec defines the desired state of ClusterAuth
#ClusterAuthSpec: {
	forProvider: #ClusterAuthParameters @go(ForProvider)
}

// ClusterAuth is used to retrieve Kubeconfig of given EKS cluster.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ClusterAuth: {
	spec: #ClusterAuthSpec @go(Spec)
}

// ClusterAuthList contains a list of ClusterAuths
#ClusterAuthList: {
	items: [...#ClusterAuth] @go(Items,[]ClusterAuth)
}