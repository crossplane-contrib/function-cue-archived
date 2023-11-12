// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/apimanagement/v1beta1

package v1beta1

#AuthorizationServerInitParameters: {
	// The OAUTH Authorization Endpoint.
	authorizationEndpoint?: null | string @go(AuthorizationEndpoint,*string)

	// The HTTP Verbs supported by the Authorization Endpoint. Possible values are DELETE, GET, HEAD, OPTIONS, PATCH, POST, PUT and TRACE.
	authorizationMethods?: [...null | string] @go(AuthorizationMethods,[]*string)

	// The mechanism by which Access Tokens are passed to the API. Possible values are authorizationHeader and query.
	bearerTokenSendingMethods?: [...null | string] @go(BearerTokenSendingMethods,[]*string)

	// The Authentication Methods supported by the Token endpoint of this Authorization Server.. Possible values are Basic and Body.
	clientAuthenticationMethod?: [...null | string] @go(ClientAuthenticationMethod,[]*string)

	// The Client/App ID registered with this Authorization Server.
	clientId?: null | string @go(ClientID,*string)

	// The URI of page where Client/App Registration is performed for this Authorization Server.
	clientRegistrationEndpoint?: null | string @go(ClientRegistrationEndpoint,*string)

	// The Default Scope used when requesting an Access Token, specified as a string containing space-delimited values.
	defaultScope?: null | string @go(DefaultScope,*string)

	// A description of the Authorization Server, which may contain HTML formatting tags.
	description?: null | string @go(Description,*string)

	// The user-friendly name of this Authorization Server.
	displayName?: null | string @go(DisplayName,*string)

	// Form of Authorization Grants required when requesting an Access Token. Possible values are authorizationCode, clientCredentials, implicit and resourceOwnerPassword.
	grantTypes?: [...null | string] @go(GrantTypes,[]*string)

	// The username associated with the Resource Owner.
	resourceOwnerUsername?: null | string @go(ResourceOwnerUsername,*string)

	// Does this Authorization Server support State? If this is set to true the client may use the state parameter to raise protocol security.
	supportState?: null | bool @go(SupportState,*bool)

	// A token_body_parameter block as defined below.
	tokenBodyParameter?: [...#TokenBodyParameterInitParameters] @go(TokenBodyParameter,[]TokenBodyParameterInitParameters)

	// The OAUTH Token Endpoint.
	tokenEndpoint?: null | string @go(TokenEndpoint,*string)
}

#AuthorizationServerObservation: {
	// The name of the API Management Service in which this Authorization Server should be created. Changing this forces a new resource to be created.
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The OAUTH Authorization Endpoint.
	authorizationEndpoint?: null | string @go(AuthorizationEndpoint,*string)

	// The HTTP Verbs supported by the Authorization Endpoint. Possible values are DELETE, GET, HEAD, OPTIONS, PATCH, POST, PUT and TRACE.
	authorizationMethods?: [...null | string] @go(AuthorizationMethods,[]*string)

	// The mechanism by which Access Tokens are passed to the API. Possible values are authorizationHeader and query.
	bearerTokenSendingMethods?: [...null | string] @go(BearerTokenSendingMethods,[]*string)

	// The Authentication Methods supported by the Token endpoint of this Authorization Server.. Possible values are Basic and Body.
	clientAuthenticationMethod?: [...null | string] @go(ClientAuthenticationMethod,[]*string)

	// The Client/App ID registered with this Authorization Server.
	clientId?: null | string @go(ClientID,*string)

	// The URI of page where Client/App Registration is performed for this Authorization Server.
	clientRegistrationEndpoint?: null | string @go(ClientRegistrationEndpoint,*string)

	// The Default Scope used when requesting an Access Token, specified as a string containing space-delimited values.
	defaultScope?: null | string @go(DefaultScope,*string)

	// A description of the Authorization Server, which may contain HTML formatting tags.
	description?: null | string @go(Description,*string)

	// The user-friendly name of this Authorization Server.
	displayName?: null | string @go(DisplayName,*string)

	// Form of Authorization Grants required when requesting an Access Token. Possible values are authorizationCode, clientCredentials, implicit and resourceOwnerPassword.
	grantTypes?: [...null | string] @go(GrantTypes,[]*string)

	// The ID of the API Management Authorization Server.
	id?: null | string @go(ID,*string)

	// The name of the Resource Group in which the API Management Service exists. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The username associated with the Resource Owner.
	resourceOwnerUsername?: null | string @go(ResourceOwnerUsername,*string)

	// Does this Authorization Server support State? If this is set to true the client may use the state parameter to raise protocol security.
	supportState?: null | bool @go(SupportState,*bool)

	// A token_body_parameter block as defined below.
	tokenBodyParameter?: [...#TokenBodyParameterObservation] @go(TokenBodyParameter,[]TokenBodyParameterObservation)

	// The OAUTH Token Endpoint.
	tokenEndpoint?: null | string @go(TokenEndpoint,*string)
}

#AuthorizationServerParameters: {
	// The name of the API Management Service in which this Authorization Server should be created. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=Management
	// +kubebuilder:validation:Optional
	apiManagementName?: null | string @go(APIManagementName,*string)

	// The OAUTH Authorization Endpoint.
	// +kubebuilder:validation:Optional
	authorizationEndpoint?: null | string @go(AuthorizationEndpoint,*string)

	// The HTTP Verbs supported by the Authorization Endpoint. Possible values are DELETE, GET, HEAD, OPTIONS, PATCH, POST, PUT and TRACE.
	// +kubebuilder:validation:Optional
	authorizationMethods?: [...null | string] @go(AuthorizationMethods,[]*string)

	// The mechanism by which Access Tokens are passed to the API. Possible values are authorizationHeader and query.
	// +kubebuilder:validation:Optional
	bearerTokenSendingMethods?: [...null | string] @go(BearerTokenSendingMethods,[]*string)

	// The Authentication Methods supported by the Token endpoint of this Authorization Server.. Possible values are Basic and Body.
	// +kubebuilder:validation:Optional
	clientAuthenticationMethod?: [...null | string] @go(ClientAuthenticationMethod,[]*string)

	// The Client/App ID registered with this Authorization Server.
	// +kubebuilder:validation:Optional
	clientId?: null | string @go(ClientID,*string)

	// The URI of page where Client/App Registration is performed for this Authorization Server.
	// +kubebuilder:validation:Optional
	clientRegistrationEndpoint?: null | string @go(ClientRegistrationEndpoint,*string)

	// The Default Scope used when requesting an Access Token, specified as a string containing space-delimited values.
	// +kubebuilder:validation:Optional
	defaultScope?: null | string @go(DefaultScope,*string)

	// A description of the Authorization Server, which may contain HTML formatting tags.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The user-friendly name of this Authorization Server.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// Form of Authorization Grants required when requesting an Access Token. Possible values are authorizationCode, clientCredentials, implicit and resourceOwnerPassword.
	// +kubebuilder:validation:Optional
	grantTypes?: [...null | string] @go(GrantTypes,[]*string)

	// The name of the Resource Group in which the API Management Service exists. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The username associated with the Resource Owner.
	// +kubebuilder:validation:Optional
	resourceOwnerUsername?: null | string @go(ResourceOwnerUsername,*string)

	// Does this Authorization Server support State? If this is set to true the client may use the state parameter to raise protocol security.
	// +kubebuilder:validation:Optional
	supportState?: null | bool @go(SupportState,*bool)

	// A token_body_parameter block as defined below.
	// +kubebuilder:validation:Optional
	tokenBodyParameter?: [...#TokenBodyParameterParameters] @go(TokenBodyParameter,[]TokenBodyParameterParameters)

	// The OAUTH Token Endpoint.
	// +kubebuilder:validation:Optional
	tokenEndpoint?: null | string @go(TokenEndpoint,*string)
}

#TokenBodyParameterInitParameters: {
	// The Name of the Parameter.
	name?: null | string @go(Name,*string)

	// The Value of the Parameter.
	value?: null | string @go(Value,*string)
}

#TokenBodyParameterObservation: {
	// The Name of the Parameter.
	name?: null | string @go(Name,*string)

	// The Value of the Parameter.
	value?: null | string @go(Value,*string)
}

#TokenBodyParameterParameters: {
	// The Name of the Parameter.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The Value of the Parameter.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

// AuthorizationServerSpec defines the desired state of AuthorizationServer
#AuthorizationServerSpec: {
	forProvider: #AuthorizationServerParameters @go(ForProvider)

	// THIS IS AN ALPHA FIELD. Do not use it in production. It is not honored
	// unless the relevant Crossplane feature flag is enabled, and may be
	// changed or removed without notice.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #AuthorizationServerInitParameters @go(InitProvider)
}

// AuthorizationServerStatus defines the observed state of AuthorizationServer.
#AuthorizationServerStatus: {
	atProvider?: #AuthorizationServerObservation @go(AtProvider)
}

// AuthorizationServer is the Schema for the AuthorizationServers API. Manages an Authorization Server within an API Management Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#AuthorizationServer: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.authorizationEndpoint) || has(self.initProvider.authorizationEndpoint)",message="authorizationEndpoint is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.authorizationMethods) || has(self.initProvider.authorizationMethods)",message="authorizationMethods is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.clientId) || has(self.initProvider.clientId)",message="clientId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.clientRegistrationEndpoint) || has(self.initProvider.clientRegistrationEndpoint)",message="clientRegistrationEndpoint is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.displayName) || has(self.initProvider.displayName)",message="displayName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.grantTypes) || has(self.initProvider.grantTypes)",message="grantTypes is a required parameter"
	spec:    #AuthorizationServerSpec   @go(Spec)
	status?: #AuthorizationServerStatus @go(Status)
}

// AuthorizationServerList contains a list of AuthorizationServers
#AuthorizationServerList: {
	items: [...#AuthorizationServer] @go(Items,[]AuthorizationServer)
}