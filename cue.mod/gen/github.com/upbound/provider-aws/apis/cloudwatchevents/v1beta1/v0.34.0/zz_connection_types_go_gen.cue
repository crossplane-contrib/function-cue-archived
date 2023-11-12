// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudwatchevents/v1beta1

package v1beta1

#APIKeyObservation: {
	// Header Name.
	key?: null | string @go(Key,*string)
}

#APIKeyParameters: {
	// Header Name.
	// +kubebuilder:validation:Required
	key?: null | string @go(Key,*string)
}

#AuthParametersObservation: {
	// Parameters used for API_KEY authorization. An API key to include in the header for each authentication request. A maximum of 1 are allowed. Conflicts with basic and oauth. Documented below.
	apiKey?: [...#APIKeyObservation] @go(APIKey,[]APIKeyObservation)

	// Parameters used for BASIC authorization. A maximum of 1 are allowed. Conflicts with api_key and oauth. Documented below.
	basic?: [...#BasicObservation] @go(Basic,[]BasicObservation)

	// Invocation Http Parameters are additional credentials used to sign each Invocation of the ApiDestination created from this Connection. If the ApiDestination Rule Target has additional HttpParameters, the values will be merged together, with the Connection Invocation Http Parameters taking precedence. Secret values are stored and managed by AWS Secrets Manager. A maximum of 1 are allowed. Documented below.
	invocationHttpParameters?: [...#InvocationHTTPParametersObservation] @go(InvocationHTTPParameters,[]InvocationHTTPParametersObservation)

	// Parameters used for OAUTH_CLIENT_CREDENTIALS authorization. A maximum of 1 are allowed. Conflicts with basic and api_key. Documented below.
	oauth?: [...#OauthObservation] @go(Oauth,[]OauthObservation)
}

#AuthParametersParameters: {
	// Parameters used for API_KEY authorization. An API key to include in the header for each authentication request. A maximum of 1 are allowed. Conflicts with basic and oauth. Documented below.
	// +kubebuilder:validation:Optional
	apiKey?: [...#APIKeyParameters] @go(APIKey,[]APIKeyParameters)

	// Parameters used for BASIC authorization. A maximum of 1 are allowed. Conflicts with api_key and oauth. Documented below.
	// +kubebuilder:validation:Optional
	basic?: [...#BasicParameters] @go(Basic,[]BasicParameters)

	// Invocation Http Parameters are additional credentials used to sign each Invocation of the ApiDestination created from this Connection. If the ApiDestination Rule Target has additional HttpParameters, the values will be merged together, with the Connection Invocation Http Parameters taking precedence. Secret values are stored and managed by AWS Secrets Manager. A maximum of 1 are allowed. Documented below.
	// +kubebuilder:validation:Optional
	invocationHttpParameters?: [...#InvocationHTTPParametersParameters] @go(InvocationHTTPParameters,[]InvocationHTTPParametersParameters)

	// Parameters used for OAUTH_CLIENT_CREDENTIALS authorization. A maximum of 1 are allowed. Conflicts with basic and api_key. Documented below.
	// +kubebuilder:validation:Optional
	oauth?: [...#OauthParameters] @go(Oauth,[]OauthParameters)
}

#BasicObservation: {
	// A username for the authorization.
	username?: null | string @go(Username,*string)
}

#BasicParameters: {
	// A username for the authorization.
	// +kubebuilder:validation:Required
	username?: null | string @go(Username,*string)
}

#BodyObservation: {
	// Specified whether the value is secret.
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	key?: null | string @go(Key,*string)
}

#BodyParameters: {
	// Specified whether the value is secret.
	// +kubebuilder:validation:Optional
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)
}

#ClientParametersObservation: {
	// The client ID for the credentials to use for authorization. Created and stored in AWS Secrets Manager.
	clientId?: null | string @go(ClientID,*string)
}

#ClientParametersParameters: {
	// The client ID for the credentials to use for authorization. Created and stored in AWS Secrets Manager.
	// +kubebuilder:validation:Required
	clientId?: null | string @go(ClientID,*string)
}

#ConnectionObservation: {
	// The Amazon Resource Name (ARN) of the connection.
	arn?: null | string @go(Arn,*string)

	// Parameters used for authorization. A maximum of 1 are allowed. Documented below.
	authParameters?: [...#AuthParametersObservation] @go(AuthParameters,[]AuthParametersObservation)

	// Choose the type of authorization to use for the connection. One of API_KEY,BASIC,OAUTH_CLIENT_CREDENTIALS.
	authorizationType?: null | string @go(AuthorizationType,*string)

	// Enter a description for the connection. Maximum of 512 characters.
	description?: null | string @go(Description,*string)
	id?:          null | string @go(ID,*string)

	// The Amazon Resource Name (ARN) of the secret created from the authorization parameters specified for the connection.
	secretArn?: null | string @go(SecretArn,*string)
}

#ConnectionParameters: {
	// Parameters used for authorization. A maximum of 1 are allowed. Documented below.
	// +kubebuilder:validation:Optional
	authParameters?: [...#AuthParametersParameters] @go(AuthParameters,[]AuthParametersParameters)

	// Choose the type of authorization to use for the connection. One of API_KEY,BASIC,OAUTH_CLIENT_CREDENTIALS.
	// +kubebuilder:validation:Optional
	authorizationType?: null | string @go(AuthorizationType,*string)

	// Enter a description for the connection. Maximum of 512 characters.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

#HeaderObservation: {
	// Specified whether the value is secret.
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	key?: null | string @go(Key,*string)
}

#HeaderParameters: {
	// Specified whether the value is secret.
	// +kubebuilder:validation:Optional
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)
}

#InvocationHTTPParametersObservation: {
	// Contains additional body string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	body?: [...#BodyObservation] @go(Body,[]BodyObservation)

	// Contains additional header parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	header?: [...#HeaderObservation] @go(Header,[]HeaderObservation)

	// Contains additional query string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	queryString?: [...#QueryStringObservation] @go(QueryString,[]QueryStringObservation)
}

#InvocationHTTPParametersParameters: {
	// Contains additional body string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	// +kubebuilder:validation:Optional
	body?: [...#BodyParameters] @go(Body,[]BodyParameters)

	// Contains additional header parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	// +kubebuilder:validation:Optional
	header?: [...#HeaderParameters] @go(Header,[]HeaderParameters)

	// Contains additional query string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	// +kubebuilder:validation:Optional
	queryString?: [...#QueryStringParameters] @go(QueryString,[]QueryStringParameters)
}

#OauthHTTPParametersBodyObservation: {
	// Specified whether the value is secret.
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	key?: null | string @go(Key,*string)
}

#OauthHTTPParametersBodyParameters: {
	// Specified whether the value is secret.
	// +kubebuilder:validation:Optional
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)
}

#OauthHTTPParametersHeaderObservation: {
	// Specified whether the value is secret.
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	key?: null | string @go(Key,*string)
}

#OauthHTTPParametersHeaderParameters: {
	// Specified whether the value is secret.
	// +kubebuilder:validation:Optional
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)
}

#OauthHTTPParametersObservation: {
	// Contains additional body string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	body?: [...#OauthHTTPParametersBodyObservation] @go(Body,[]OauthHTTPParametersBodyObservation)

	// Contains additional header parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	header?: [...#OauthHTTPParametersHeaderObservation] @go(Header,[]OauthHTTPParametersHeaderObservation)

	// Contains additional query string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	queryString?: [...#OauthHTTPParametersQueryStringObservation] @go(QueryString,[]OauthHTTPParametersQueryStringObservation)
}

#OauthHTTPParametersParameters: {
	// Contains additional body string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	// +kubebuilder:validation:Optional
	body?: [...#OauthHTTPParametersBodyParameters] @go(Body,[]OauthHTTPParametersBodyParameters)

	// Contains additional header parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	// +kubebuilder:validation:Optional
	header?: [...#OauthHTTPParametersHeaderParameters] @go(Header,[]OauthHTTPParametersHeaderParameters)

	// Contains additional query string parameters for the connection. You can include up to 100 additional body string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB. Each parameter can contain the following:
	// +kubebuilder:validation:Optional
	queryString?: [...#OauthHTTPParametersQueryStringParameters] @go(QueryString,[]OauthHTTPParametersQueryStringParameters)
}

#OauthHTTPParametersQueryStringObservation: {
	// Specified whether the value is secret.
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	key?: null | string @go(Key,*string)
}

#OauthHTTPParametersQueryStringParameters: {
	// Specified whether the value is secret.
	// +kubebuilder:validation:Optional
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)
}

#OauthObservation: {
	// The URL to the authorization endpoint.
	authorizationEndpoint?: null | string @go(AuthorizationEndpoint,*string)

	// Contains the client parameters for OAuth authorization. Contains the following two parameters.
	clientParameters?: [...#ClientParametersObservation] @go(ClientParameters,[]ClientParametersObservation)

	// A password for the authorization. Created and stored in AWS Secrets Manager.
	httpMethod?: null | string @go(HTTPMethod,*string)

	// OAuth Http Parameters are additional credentials used to sign the request to the authorization endpoint to exchange the OAuth Client information for an access token. Secret values are stored and managed by AWS Secrets Manager. A maximum of 1 are allowed. Documented below.
	oauthHttpParameters?: [...#OauthHTTPParametersObservation] @go(OauthHTTPParameters,[]OauthHTTPParametersObservation)
}

#OauthParameters: {
	// The URL to the authorization endpoint.
	// +kubebuilder:validation:Required
	authorizationEndpoint?: null | string @go(AuthorizationEndpoint,*string)

	// Contains the client parameters for OAuth authorization. Contains the following two parameters.
	// +kubebuilder:validation:Optional
	clientParameters?: [...#ClientParametersParameters] @go(ClientParameters,[]ClientParametersParameters)

	// A password for the authorization. Created and stored in AWS Secrets Manager.
	// +kubebuilder:validation:Required
	httpMethod?: null | string @go(HTTPMethod,*string)

	// OAuth Http Parameters are additional credentials used to sign the request to the authorization endpoint to exchange the OAuth Client information for an access token. Secret values are stored and managed by AWS Secrets Manager. A maximum of 1 are allowed. Documented below.
	// +kubebuilder:validation:Required
	oauthHttpParameters: [...#OauthHTTPParametersParameters] @go(OauthHTTPParameters,[]OauthHTTPParametersParameters)
}

#QueryStringObservation: {
	// Specified whether the value is secret.
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	key?: null | string @go(Key,*string)
}

#QueryStringParameters: {
	// Specified whether the value is secret.
	// +kubebuilder:validation:Optional
	isValueSecret?: null | bool @go(IsValueSecret,*bool)

	// Header Name.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)
}

// ConnectionSpec defines the desired state of Connection
#ConnectionSpec: {
	forProvider: #ConnectionParameters @go(ForProvider)
}

// ConnectionStatus defines the observed state of Connection.
#ConnectionStatus: {
	atProvider?: #ConnectionObservation @go(AtProvider)
}

// Connection is the Schema for the Connections API. Provides an EventBridge connection resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Connection: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.authParameters)",message="authParameters is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.authorizationType)",message="authorizationType is a required parameter"
	spec:    #ConnectionSpec   @go(Spec)
	status?: #ConnectionStatus @go(Status)
}

// ConnectionList contains a list of Connections
#ConnectionList: {
	items: [...#Connection] @go(Items,[]Connection)
}