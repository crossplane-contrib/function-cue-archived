// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/eks/v1beta1

package v1beta1

#IdentityProviderConfigObservation: {
	// Amazon Resource Name (ARN) of the EKS Identity Provider Configuration.
	arn?: null | string @go(Arn,*string)

	// EKS Cluster name and EKS Identity Provider Configuration name separated by a colon (:).
	id?: null | string @go(ID,*string)

	// Status of the EKS Identity Provider Configuration.
	status?: null | string @go(Status,*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#IdentityProviderConfigOidcObservation: {
}

#IdentityProviderConfigOidcParameters: {
	// –  Client ID for the OpenID Connect identity provider.
	// +kubebuilder:validation:Required
	clientId?: null | string @go(ClientID,*string)

	// The JWT claim that the provider will use to return groups.
	// +kubebuilder:validation:Optional
	groupsClaim?: null | string @go(GroupsClaim,*string)

	// A prefix that is prepended to group claims e.g., oidc:.
	// +kubebuilder:validation:Optional
	groupsPrefix?: null | string @go(GroupsPrefix,*string)

	// Issuer URL for the OpenID Connect identity provider.
	// +kubebuilder:validation:Required
	issuerUrl?: null | string @go(IssuerURL,*string)

	// The key value pairs that describe required claims in the identity token.
	// +kubebuilder:validation:Optional
	requiredClaims?: {[string]: null | string} @go(RequiredClaims,map[string]*string)

	// The JWT claim that the provider will use as the username.
	// +kubebuilder:validation:Optional
	usernameClaim?: null | string @go(UsernameClaim,*string)

	// A prefix that is prepended to username claims.
	// +kubebuilder:validation:Optional
	usernamePrefix?: null | string @go(UsernamePrefix,*string)
}

#IdentityProviderConfigParameters: {
	// –  Name of the EKS Cluster.
	// +crossplane:generate:reference:type=Cluster
	// +kubebuilder:validation:Optional
	clusterName?: null | string @go(ClusterName,*string)

	// Nested attribute containing OpenID Connect identity provider information for the cluster. Detailed below.
	// +kubebuilder:validation:Required
	oidc: [...#IdentityProviderConfigOidcParameters] @go(Oidc,[]IdentityProviderConfigOidcParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// IdentityProviderConfigSpec defines the desired state of IdentityProviderConfig
#IdentityProviderConfigSpec: {
	forProvider: #IdentityProviderConfigParameters @go(ForProvider)
}

// IdentityProviderConfigStatus defines the observed state of IdentityProviderConfig.
#IdentityProviderConfigStatus: {
	atProvider?: #IdentityProviderConfigObservation @go(AtProvider)
}

// IdentityProviderConfig is the Schema for the IdentityProviderConfigs API. Manages an EKS Identity Provider Configuration.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#IdentityProviderConfig: {
	spec:    #IdentityProviderConfigSpec   @go(Spec)
	status?: #IdentityProviderConfigStatus @go(Status)
}

// IdentityProviderConfigList contains a list of IdentityProviderConfigs
#IdentityProviderConfigList: {
	items: [...#IdentityProviderConfig] @go(Items,[]IdentityProviderConfig)
}