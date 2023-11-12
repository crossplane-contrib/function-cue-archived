// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/appsync/v1beta1

package v1beta1

#FunctionObservation: {
	// ID of the associated AppSync API.
	apiId?: null | string @go(APIID,*string)

	// ARN of the Function object.
	arn?: null | string @go(Arn,*string)

	// The function code that contains the request and response functions. When code is used, the runtime is required. The runtime value must be APPSYNC_JS.
	code?: null | string @go(Code,*string)

	// Function data source name.
	dataSource?: null | string @go(DataSource,*string)

	// Function description.
	description?: null | string @go(Description,*string)

	// Unique ID representing the Function object.
	functionId?: null | string @go(FunctionID,*string)

	// Version of the request mapping template. Currently the supported value is 2018-05-29. Does not apply when specifying code.
	functionVersion?: null | string @go(FunctionVersion,*string)

	// API Function ID (Formatted as ApiId-FunctionId)
	id?: null | string @go(ID,*string)

	// Maximum batching size for a resolver. Valid values are between 0 and 2000.
	maxBatchSize?: null | float64 @go(MaxBatchSize,*float64)

	// Function name. The function name does not have to be unique.
	name?: null | string @go(Name,*string)

	// Function request mapping template. Functions support only the 2018-05-29 version of the request mapping template.
	requestMappingTemplate?: null | string @go(RequestMappingTemplate,*string)

	// Function response mapping template.
	responseMappingTemplate?: null | string @go(ResponseMappingTemplate,*string)

	// Describes a runtime used by an AWS AppSync pipeline resolver or AWS AppSync function. Specifies the name and version of the runtime to use. Note that if a runtime is specified, code must also be specified. See Runtime.
	runtime?: [...#RuntimeObservation] @go(Runtime,[]RuntimeObservation)

	// Describes a Sync configuration for a resolver. See Sync Config.
	syncConfig?: [...#SyncConfigObservation] @go(SyncConfig,[]SyncConfigObservation)
}

#FunctionParameters: {
	// ID of the associated AppSync API.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/appsync/v1beta1.GraphQLAPI
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	apiId?: null | string @go(APIID,*string)

	// The function code that contains the request and response functions. When code is used, the runtime is required. The runtime value must be APPSYNC_JS.
	// +kubebuilder:validation:Optional
	code?: null | string @go(Code,*string)

	// Function data source name.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/appsync/v1beta1.Datasource
	// +kubebuilder:validation:Optional
	dataSource?: null | string @go(DataSource,*string)

	// Function description.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Version of the request mapping template. Currently the supported value is 2018-05-29. Does not apply when specifying code.
	// +kubebuilder:validation:Optional
	functionVersion?: null | string @go(FunctionVersion,*string)

	// Maximum batching size for a resolver. Valid values are between 0 and 2000.
	// +kubebuilder:validation:Optional
	maxBatchSize?: null | float64 @go(MaxBatchSize,*float64)

	// Function name. The function name does not have to be unique.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Function request mapping template. Functions support only the 2018-05-29 version of the request mapping template.
	// +kubebuilder:validation:Optional
	requestMappingTemplate?: null | string @go(RequestMappingTemplate,*string)

	// Function response mapping template.
	// +kubebuilder:validation:Optional
	responseMappingTemplate?: null | string @go(ResponseMappingTemplate,*string)

	// Describes a runtime used by an AWS AppSync pipeline resolver or AWS AppSync function. Specifies the name and version of the runtime to use. Note that if a runtime is specified, code must also be specified. See Runtime.
	// +kubebuilder:validation:Optional
	runtime?: [...#RuntimeParameters] @go(Runtime,[]RuntimeParameters)

	// Describes a Sync configuration for a resolver. See Sync Config.
	// +kubebuilder:validation:Optional
	syncConfig?: [...#SyncConfigParameters] @go(SyncConfig,[]SyncConfigParameters)
}

#LambdaConflictHandlerConfigObservation: {
	// ARN for the Lambda function to use as the Conflict Handler.
	lambdaConflictHandlerArn?: null | string @go(LambdaConflictHandlerArn,*string)
}

#LambdaConflictHandlerConfigParameters: {
	// ARN for the Lambda function to use as the Conflict Handler.
	// +kubebuilder:validation:Optional
	lambdaConflictHandlerArn?: null | string @go(LambdaConflictHandlerArn,*string)
}

#RuntimeObservation: {
	// Function name. The function name does not have to be unique.
	name?: null | string @go(Name,*string)

	// The version of the runtime to use. Currently, the only allowed version is 1.0.0.
	runtimeVersion?: null | string @go(RuntimeVersion,*string)
}

#RuntimeParameters: {
	// Function name. The function name does not have to be unique.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// The version of the runtime to use. Currently, the only allowed version is 1.0.0.
	// +kubebuilder:validation:Required
	runtimeVersion?: null | string @go(RuntimeVersion,*string)
}

#SyncConfigObservation: {
	// Conflict Detection strategy to use. Valid values are NONE and VERSION.
	conflictDetection?: null | string @go(ConflictDetection,*string)

	// Conflict Resolution strategy to perform in the event of a conflict. Valid values are NONE, OPTIMISTIC_CONCURRENCY, AUTOMERGE, and LAMBDA.
	conflictHandler?: null | string @go(ConflictHandler,*string)

	// Lambda Conflict Handler Config when configuring LAMBDA as the Conflict Handler. See Lambda Conflict Handler Config.
	lambdaConflictHandlerConfig?: [...#LambdaConflictHandlerConfigObservation] @go(LambdaConflictHandlerConfig,[]LambdaConflictHandlerConfigObservation)
}

#SyncConfigParameters: {
	// Conflict Detection strategy to use. Valid values are NONE and VERSION.
	// +kubebuilder:validation:Optional
	conflictDetection?: null | string @go(ConflictDetection,*string)

	// Conflict Resolution strategy to perform in the event of a conflict. Valid values are NONE, OPTIMISTIC_CONCURRENCY, AUTOMERGE, and LAMBDA.
	// +kubebuilder:validation:Optional
	conflictHandler?: null | string @go(ConflictHandler,*string)

	// Lambda Conflict Handler Config when configuring LAMBDA as the Conflict Handler. See Lambda Conflict Handler Config.
	// +kubebuilder:validation:Optional
	lambdaConflictHandlerConfig?: [...#LambdaConflictHandlerConfigParameters] @go(LambdaConflictHandlerConfig,[]LambdaConflictHandlerConfigParameters)
}

// FunctionSpec defines the desired state of Function
#FunctionSpec: {
	forProvider: #FunctionParameters @go(ForProvider)
}

// FunctionStatus defines the observed state of Function.
#FunctionStatus: {
	atProvider?: #FunctionObservation @go(AtProvider)
}

// Function is the Schema for the Functions API. Provides an AppSync Function.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Function: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	spec:    #FunctionSpec   @go(Spec)
	status?: #FunctionStatus @go(Status)
}

// FunctionList contains a list of Functions
#FunctionList: {
	items: [...#Function] @go(Items,[]Function)
}