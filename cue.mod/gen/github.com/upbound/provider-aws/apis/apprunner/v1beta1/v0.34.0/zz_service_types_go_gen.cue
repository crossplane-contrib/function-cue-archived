// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/apprunner/v1beta1

package v1beta1

#AuthenticationConfigurationObservation: {
	// ARN of the IAM role that grants the App Runner service access to a source repository. Required for ECR image repositories (but not for ECR Public)
	accessRoleArn?: null | string @go(AccessRoleArn,*string)

	// ARN of the App Runner connection that enables the App Runner service to connect to a source repository. Required for GitHub code repositories.
	connectionArn?: null | string @go(ConnectionArn,*string)
}

#AuthenticationConfigurationParameters: {
	// ARN of the IAM role that grants the App Runner service access to a source repository. Required for ECR image repositories (but not for ECR Public)
	// +kubebuilder:validation:Optional
	accessRoleArn?: null | string @go(AccessRoleArn,*string)

	// ARN of the App Runner connection that enables the App Runner service to connect to a source repository. Required for GitHub code repositories.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/apprunner/v1beta1.Connection
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	connectionArn?: null | string @go(ConnectionArn,*string)
}

#CodeConfigurationObservation: {
	// Basic configuration for building and running the App Runner service. Use this parameter to quickly launch an App Runner service without providing an apprunner.yaml file in the source code repository (or ignoring the file if it exists). See Code Configuration Values below for more details.
	codeConfigurationValues?: [...#CodeConfigurationValuesObservation] @go(CodeConfigurationValues,[]CodeConfigurationValuesObservation)

	// Source of the App Runner configuration. Valid values: REPOSITORY, API. Values are interpreted as follows:
	configurationSource?: null | string @go(ConfigurationSource,*string)
}

#CodeConfigurationParameters: {
	// Basic configuration for building and running the App Runner service. Use this parameter to quickly launch an App Runner service without providing an apprunner.yaml file in the source code repository (or ignoring the file if it exists). See Code Configuration Values below for more details.
	// +kubebuilder:validation:Optional
	codeConfigurationValues?: [...#CodeConfigurationValuesParameters] @go(CodeConfigurationValues,[]CodeConfigurationValuesParameters)

	// Source of the App Runner configuration. Valid values: REPOSITORY, API. Values are interpreted as follows:
	// +kubebuilder:validation:Required
	configurationSource?: null | string @go(ConfigurationSource,*string)
}

#CodeConfigurationValuesObservation: {
	// Command App Runner runs to build your application.
	buildCommand?: null | string @go(BuildCommand,*string)

	// Port that your application listens to in the container. Defaults to "8080".
	port?: null | string @go(Port,*string)

	// Runtime environment type for building and running an App Runner service. Represents a programming language runtime. Valid values: PYTHON_3, NODEJS_12, NODEJS_14, NODEJS_16, CORRETTO_8, CORRETTO_11, GO_1, DOTNET_6, PHP_81, RUBY_31.
	runtime?: null | string @go(Runtime,*string)

	// Secrets and parameters available to your service as environment variables. A map of key/value pairs.
	runtimeEnvironmentSecrets?: {[string]: null | string} @go(RuntimeEnvironmentSecrets,map[string]*string)

	// Environment variables available to your running App Runner service. A map of key/value pairs. Keys with a prefix of AWSAPPRUNNER are reserved for system use and aren't valid.
	runtimeEnvironmentVariables?: {[string]: null | string} @go(RuntimeEnvironmentVariables,map[string]*string)

	// Command App Runner runs to start the application in the source image. If specified, this command overrides the Docker image’s default start command.
	startCommand?: null | string @go(StartCommand,*string)
}

#CodeConfigurationValuesParameters: {
	// Command App Runner runs to build your application.
	// +kubebuilder:validation:Optional
	buildCommand?: null | string @go(BuildCommand,*string)

	// Port that your application listens to in the container. Defaults to "8080".
	// +kubebuilder:validation:Optional
	port?: null | string @go(Port,*string)

	// Runtime environment type for building and running an App Runner service. Represents a programming language runtime. Valid values: PYTHON_3, NODEJS_12, NODEJS_14, NODEJS_16, CORRETTO_8, CORRETTO_11, GO_1, DOTNET_6, PHP_81, RUBY_31.
	// +kubebuilder:validation:Required
	runtime?: null | string @go(Runtime,*string)

	// Secrets and parameters available to your service as environment variables. A map of key/value pairs.
	// +kubebuilder:validation:Optional
	runtimeEnvironmentSecrets?: {[string]: null | string} @go(RuntimeEnvironmentSecrets,map[string]*string)

	// Environment variables available to your running App Runner service. A map of key/value pairs. Keys with a prefix of AWSAPPRUNNER are reserved for system use and aren't valid.
	// +kubebuilder:validation:Optional
	runtimeEnvironmentVariables?: {[string]: null | string} @go(RuntimeEnvironmentVariables,map[string]*string)

	// Command App Runner runs to start the application in the source image. If specified, this command overrides the Docker image’s default start command.
	// +kubebuilder:validation:Optional
	startCommand?: null | string @go(StartCommand,*string)
}

#CodeRepositoryObservation: {
	// Configuration for building and running the service from a source code repository. See Code Configuration below for more details.
	codeConfiguration?: [...#CodeConfigurationObservation] @go(CodeConfiguration,[]CodeConfigurationObservation)

	// Location of the repository that contains the source code.
	repositoryUrl?: null | string @go(RepositoryURL,*string)

	// Version that should be used within the source code repository. See Source Code Version below for more details.
	sourceCodeVersion?: [...#SourceCodeVersionObservation] @go(SourceCodeVersion,[]SourceCodeVersionObservation)
}

#CodeRepositoryParameters: {
	// Configuration for building and running the service from a source code repository. See Code Configuration below for more details.
	// +kubebuilder:validation:Optional
	codeConfiguration?: [...#CodeConfigurationParameters] @go(CodeConfiguration,[]CodeConfigurationParameters)

	// Location of the repository that contains the source code.
	// +kubebuilder:validation:Required
	repositoryUrl?: null | string @go(RepositoryURL,*string)

	// Version that should be used within the source code repository. See Source Code Version below for more details.
	// +kubebuilder:validation:Required
	sourceCodeVersion: [...#SourceCodeVersionParameters] @go(SourceCodeVersion,[]SourceCodeVersionParameters)
}

#EgressConfigurationObservation: {
	// Type of egress configuration.Set to DEFAULT for access to resources hosted on public networks.Set to VPC to associate your service to a custom VPC specified by VpcConnectorArn.
	egressType?: null | string @go(EgressType,*string)

	// ARN of the App Runner VPC connector that you want to associate with your App Runner service. Only valid when EgressType = VPC.
	vpcConnectorArn?: null | string @go(VPCConnectorArn,*string)
}

#EgressConfigurationParameters: {
	// Type of egress configuration.Set to DEFAULT for access to resources hosted on public networks.Set to VPC to associate your service to a custom VPC specified by VpcConnectorArn.
	// +kubebuilder:validation:Optional
	egressType?: null | string @go(EgressType,*string)

	// ARN of the App Runner VPC connector that you want to associate with your App Runner service. Only valid when EgressType = VPC.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/apprunner/v1beta1.VPCConnector
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	vpcConnectorArn?: null | string @go(VPCConnectorArn,*string)
}

#EncryptionConfigurationObservation: {
	// ARN of the KMS key used for encryption.
	kmsKey?: null | string @go(KMSKey,*string)
}

#EncryptionConfigurationParameters: {
	// ARN of the KMS key used for encryption.
	// +kubebuilder:validation:Required
	kmsKey?: null | string @go(KMSKey,*string)
}

#HealthCheckConfigurationObservation: {
	// Number of consecutive checks that must succeed before App Runner decides that the service is healthy. Defaults to 1. Minimum value of 1. Maximum value of 20.
	healthyThreshold?: null | float64 @go(HealthyThreshold,*float64)

	// Time interval, in seconds, between health checks. Defaults to 5. Minimum value of 1. Maximum value of 20.
	interval?: null | float64 @go(Interval,*float64)

	// URL to send requests to for health checks. Defaults to /. Minimum length of 0. Maximum length of 51200.
	path?: null | string @go(Path,*string)

	// IP protocol that App Runner uses to perform health checks for your service. Valid values: TCP, HTTP. Defaults to TCP. If you set protocol to HTTP, App Runner sends health check requests to the HTTP path specified by path.
	protocol?: null | string @go(Protocol,*string)

	// Time, in seconds, to wait for a health check response before deciding it failed. Defaults to 2. Minimum value of  1. Maximum value of 20.
	timeout?: null | float64 @go(Timeout,*float64)

	// Number of consecutive checks that must fail before App Runner decides that the service is unhealthy. Defaults to 5. Minimum value of  1. Maximum value of 20.
	unhealthyThreshold?: null | float64 @go(UnhealthyThreshold,*float64)
}

#HealthCheckConfigurationParameters: {
	// Number of consecutive checks that must succeed before App Runner decides that the service is healthy. Defaults to 1. Minimum value of 1. Maximum value of 20.
	// +kubebuilder:validation:Optional
	healthyThreshold?: null | float64 @go(HealthyThreshold,*float64)

	// Time interval, in seconds, between health checks. Defaults to 5. Minimum value of 1. Maximum value of 20.
	// +kubebuilder:validation:Optional
	interval?: null | float64 @go(Interval,*float64)

	// URL to send requests to for health checks. Defaults to /. Minimum length of 0. Maximum length of 51200.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)

	// IP protocol that App Runner uses to perform health checks for your service. Valid values: TCP, HTTP. Defaults to TCP. If you set protocol to HTTP, App Runner sends health check requests to the HTTP path specified by path.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// Time, in seconds, to wait for a health check response before deciding it failed. Defaults to 2. Minimum value of  1. Maximum value of 20.
	// +kubebuilder:validation:Optional
	timeout?: null | float64 @go(Timeout,*float64)

	// Number of consecutive checks that must fail before App Runner decides that the service is unhealthy. Defaults to 5. Minimum value of  1. Maximum value of 20.
	// +kubebuilder:validation:Optional
	unhealthyThreshold?: null | float64 @go(UnhealthyThreshold,*float64)
}

#ImageConfigurationObservation: {
	// Port that your application listens to in the container. Defaults to "8080".
	port?: null | string @go(Port,*string)

	// Secrets and parameters available to your service as environment variables. A map of key/value pairs.
	runtimeEnvironmentSecrets?: {[string]: null | string} @go(RuntimeEnvironmentSecrets,map[string]*string)

	// Environment variables available to your running App Runner service. A map of key/value pairs. Keys with a prefix of AWSAPPRUNNER are reserved for system use and aren't valid.
	runtimeEnvironmentVariables?: {[string]: null | string} @go(RuntimeEnvironmentVariables,map[string]*string)

	// Command App Runner runs to start the application in the source image. If specified, this command overrides the Docker image’s default start command.
	startCommand?: null | string @go(StartCommand,*string)
}

#ImageConfigurationParameters: {
	// Port that your application listens to in the container. Defaults to "8080".
	// +kubebuilder:validation:Optional
	port?: null | string @go(Port,*string)

	// Secrets and parameters available to your service as environment variables. A map of key/value pairs.
	// +kubebuilder:validation:Optional
	runtimeEnvironmentSecrets?: {[string]: null | string} @go(RuntimeEnvironmentSecrets,map[string]*string)

	// Environment variables available to your running App Runner service. A map of key/value pairs. Keys with a prefix of AWSAPPRUNNER are reserved for system use and aren't valid.
	// +kubebuilder:validation:Optional
	runtimeEnvironmentVariables?: {[string]: null | string} @go(RuntimeEnvironmentVariables,map[string]*string)

	// Command App Runner runs to start the application in the source image. If specified, this command overrides the Docker image’s default start command.
	// +kubebuilder:validation:Optional
	startCommand?: null | string @go(StartCommand,*string)
}

#ImageRepositoryObservation: {
	// Configuration for running the identified image. See Image Configuration below for more details.
	imageConfiguration?: [...#ImageConfigurationObservation] @go(ImageConfiguration,[]ImageConfigurationObservation)

	// Identifier of an image. For an image in Amazon Elastic Container Registry (Amazon ECR), this is an image name. For the
	// image name format, see Pulling an image in the Amazon ECR User Guide.
	imageIdentifier?: null | string @go(ImageIdentifier,*string)

	// Type of the image repository. This reflects the repository provider and whether the repository is private or public. Valid values: ECR , ECR_PUBLIC.
	imageRepositoryType?: null | string @go(ImageRepositoryType,*string)
}

#ImageRepositoryParameters: {
	// Configuration for running the identified image. See Image Configuration below for more details.
	// +kubebuilder:validation:Optional
	imageConfiguration?: [...#ImageConfigurationParameters] @go(ImageConfiguration,[]ImageConfigurationParameters)

	// Identifier of an image. For an image in Amazon Elastic Container Registry (Amazon ECR), this is an image name. For the
	// image name format, see Pulling an image in the Amazon ECR User Guide.
	// +kubebuilder:validation:Required
	imageIdentifier?: null | string @go(ImageIdentifier,*string)

	// Type of the image repository. This reflects the repository provider and whether the repository is private or public. Valid values: ECR , ECR_PUBLIC.
	// +kubebuilder:validation:Required
	imageRepositoryType?: null | string @go(ImageRepositoryType,*string)
}

#IngressConfigurationObservation: {
	// Specifies whether your App Runner service is publicly accessible. To make the service publicly accessible set it to True. To make the service privately accessible, from only within an Amazon VPC set it to False.
	isPubliclyAccessible?: null | bool @go(IsPubliclyAccessible,*bool)
}

#IngressConfigurationParameters: {
	// Specifies whether your App Runner service is publicly accessible. To make the service publicly accessible set it to True. To make the service privately accessible, from only within an Amazon VPC set it to False.
	// +kubebuilder:validation:Optional
	isPubliclyAccessible?: null | bool @go(IsPubliclyAccessible,*bool)
}

#InstanceConfigurationObservation: {
	// Number of CPU units reserved for each instance of your App Runner service represented as a String. Defaults to 1024. Valid values: 1024|2048|(1|2) vCPU.
	cpu?: null | string @go(CPU,*string)

	// ARN of an IAM role that provides permissions to your App Runner service. These are permissions that your code needs when it calls any AWS APIs.
	instanceRoleArn?: null | string @go(InstanceRoleArn,*string)

	// Amount of memory, in MB or GB, reserved for each instance of your App Runner service. Defaults to 2048. Valid values: 2048|3072|4096|(2|3|4) GB.
	memory?: null | string @go(Memory,*string)
}

#InstanceConfigurationParameters: {
	// Number of CPU units reserved for each instance of your App Runner service represented as a String. Defaults to 1024. Valid values: 1024|2048|(1|2) vCPU.
	// +kubebuilder:validation:Optional
	cpu?: null | string @go(CPU,*string)

	// ARN of an IAM role that provides permissions to your App Runner service. These are permissions that your code needs when it calls any AWS APIs.
	// +kubebuilder:validation:Optional
	instanceRoleArn?: null | string @go(InstanceRoleArn,*string)

	// Amount of memory, in MB or GB, reserved for each instance of your App Runner service. Defaults to 2048. Valid values: 2048|3072|4096|(2|3|4) GB.
	// +kubebuilder:validation:Optional
	memory?: null | string @go(Memory,*string)
}

#NetworkConfigurationObservation: {
	// Network configuration settings for outbound message traffic. See Egress Configuration below for more details.
	egressConfiguration?: [...#EgressConfigurationObservation] @go(EgressConfiguration,[]EgressConfigurationObservation)

	// Network configuration settings for inbound network traffic. See Ingress Configuration below for more details.
	ingressConfiguration?: [...#IngressConfigurationObservation] @go(IngressConfiguration,[]IngressConfigurationObservation)
}

#NetworkConfigurationParameters: {
	// Network configuration settings for outbound message traffic. See Egress Configuration below for more details.
	// +kubebuilder:validation:Optional
	egressConfiguration?: [...#EgressConfigurationParameters] @go(EgressConfiguration,[]EgressConfigurationParameters)

	// Network configuration settings for inbound network traffic. See Ingress Configuration below for more details.
	// +kubebuilder:validation:Optional
	ingressConfiguration?: [...#IngressConfigurationParameters] @go(IngressConfiguration,[]IngressConfigurationParameters)
}

#ServiceObservabilityConfigurationObservation: {
	// ARN of the observability configuration that is associated with the service. Specified only when observability_enabled is true.
	observabilityConfigurationArn?: null | string @go(ObservabilityConfigurationArn,*string)

	// When true, an observability configuration resource is associated with the service.
	observabilityEnabled?: null | bool @go(ObservabilityEnabled,*bool)
}

#ServiceObservabilityConfigurationParameters: {
	// ARN of the observability configuration that is associated with the service. Specified only when observability_enabled is true.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/apprunner/v1beta1.ObservabilityConfiguration
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	observabilityConfigurationArn?: null | string @go(ObservabilityConfigurationArn,*string)

	// When true, an observability configuration resource is associated with the service.
	// +kubebuilder:validation:Required
	observabilityEnabled?: null | bool @go(ObservabilityEnabled,*bool)
}

#ServiceObservation: {
	// ARN of the App Runner service.
	arn?: null | string @go(Arn,*string)

	// ARN of an App Runner automatic scaling configuration resource that you want to associate with your service. If not provided, App Runner associates the latest revision of a default auto scaling configuration.
	autoScalingConfigurationArn?: null | string @go(AutoScalingConfigurationArn,*string)

	// (Forces new resource) An optional custom encryption key that App Runner uses to encrypt the copy of your source repository that it maintains and your service logs. By default, App Runner uses an AWS managed CMK. See Encryption Configuration below for more details.
	encryptionConfiguration?: [...#EncryptionConfigurationObservation] @go(EncryptionConfiguration,[]EncryptionConfigurationObservation)

	// (Forces new resource) Settings of the health check that AWS App Runner performs to monitor the health of your service. See Health Check Configuration below for more details.
	healthCheckConfiguration?: [...#HealthCheckConfigurationObservation] @go(HealthCheckConfiguration,[]HealthCheckConfigurationObservation)
	id?: null | string @go(ID,*string)

	// The runtime configuration of instances (scaling units) of the App Runner service. See Instance Configuration below for more details.
	instanceConfiguration?: [...#InstanceConfigurationObservation] @go(InstanceConfiguration,[]InstanceConfigurationObservation)

	// Configuration settings related to network traffic of the web application that the App Runner service runs. See Network Configuration below for more details.
	networkConfiguration?: [...#NetworkConfigurationObservation] @go(NetworkConfiguration,[]NetworkConfigurationObservation)

	// The observability configuration of your service. See Observability Configuration below for more details.
	observabilityConfiguration?: [...#ServiceObservabilityConfigurationObservation] @go(ObservabilityConfiguration,[]ServiceObservabilityConfigurationObservation)

	// An alphanumeric ID that App Runner generated for this service. Unique within the AWS Region.
	serviceId?: null | string @go(ServiceID,*string)

	// (Forces new resource) Name of the service.
	serviceName?: null | string @go(ServiceName,*string)

	// Subdomain URL that App Runner generated for this service. You can use this URL to access your service web application.
	serviceUrl?: null | string @go(ServiceURL,*string)

	// The source to deploy to the App Runner service. Can be a code or an image repository. See Source Configuration below for more details.
	sourceConfiguration?: [...#SourceConfigurationObservation] @go(SourceConfiguration,[]SourceConfigurationObservation)

	// Current state of the App Runner service.
	status?: null | string @go(Status,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#ServiceParameters: {
	// ARN of an App Runner automatic scaling configuration resource that you want to associate with your service. If not provided, App Runner associates the latest revision of a default auto scaling configuration.
	// +kubebuilder:validation:Optional
	autoScalingConfigurationArn?: null | string @go(AutoScalingConfigurationArn,*string)

	// (Forces new resource) An optional custom encryption key that App Runner uses to encrypt the copy of your source repository that it maintains and your service logs. By default, App Runner uses an AWS managed CMK. See Encryption Configuration below for more details.
	// +kubebuilder:validation:Optional
	encryptionConfiguration?: [...#EncryptionConfigurationParameters] @go(EncryptionConfiguration,[]EncryptionConfigurationParameters)

	// (Forces new resource) Settings of the health check that AWS App Runner performs to monitor the health of your service. See Health Check Configuration below for more details.
	// +kubebuilder:validation:Optional
	healthCheckConfiguration?: [...#HealthCheckConfigurationParameters] @go(HealthCheckConfiguration,[]HealthCheckConfigurationParameters)

	// The runtime configuration of instances (scaling units) of the App Runner service. See Instance Configuration below for more details.
	// +kubebuilder:validation:Optional
	instanceConfiguration?: [...#InstanceConfigurationParameters] @go(InstanceConfiguration,[]InstanceConfigurationParameters)

	// Configuration settings related to network traffic of the web application that the App Runner service runs. See Network Configuration below for more details.
	// +kubebuilder:validation:Optional
	networkConfiguration?: [...#NetworkConfigurationParameters] @go(NetworkConfiguration,[]NetworkConfigurationParameters)

	// The observability configuration of your service. See Observability Configuration below for more details.
	// +kubebuilder:validation:Optional
	observabilityConfiguration?: [...#ServiceObservabilityConfigurationParameters] @go(ObservabilityConfiguration,[]ServiceObservabilityConfigurationParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// (Forces new resource) Name of the service.
	// +kubebuilder:validation:Optional
	serviceName?: null | string @go(ServiceName,*string)

	// The source to deploy to the App Runner service. Can be a code or an image repository. See Source Configuration below for more details.
	// +kubebuilder:validation:Optional
	sourceConfiguration?: [...#SourceConfigurationParameters] @go(SourceConfiguration,[]SourceConfigurationParameters)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#SourceCodeVersionObservation: {
	// Type of version identifier. For a git-based repository, branches represent versions. Valid values: BRANCH.
	type?: null | string @go(Type,*string)

	// Source code version. For a git-based repository, a branch name maps to a specific version. App Runner uses the most recent commit to the branch.
	value?: null | string @go(Value,*string)
}

#SourceCodeVersionParameters: {
	// Type of version identifier. For a git-based repository, branches represent versions. Valid values: BRANCH.
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)

	// Source code version. For a git-based repository, a branch name maps to a specific version. App Runner uses the most recent commit to the branch.
	// +kubebuilder:validation:Required
	value?: null | string @go(Value,*string)
}

#SourceConfigurationObservation: {
	// Describes resources needed to authenticate access to some source repositories. See Authentication Configuration below for more details.
	authenticationConfiguration?: [...#AuthenticationConfigurationObservation] @go(AuthenticationConfiguration,[]AuthenticationConfigurationObservation)

	// Whether continuous integration from the source repository is enabled for the App Runner service. If set to true, each repository change (source code commit or new image version) starts a deployment. Defaults to true.
	autoDeploymentsEnabled?: null | bool @go(AutoDeploymentsEnabled,*bool)

	// Description of a source code repository. See Code Repository below for more details.
	codeRepository?: [...#CodeRepositoryObservation] @go(CodeRepository,[]CodeRepositoryObservation)

	// Description of a source image repository. See Image Repository below for more details.
	imageRepository?: [...#ImageRepositoryObservation] @go(ImageRepository,[]ImageRepositoryObservation)
}

#SourceConfigurationParameters: {
	// Describes resources needed to authenticate access to some source repositories. See Authentication Configuration below for more details.
	// +kubebuilder:validation:Optional
	authenticationConfiguration?: [...#AuthenticationConfigurationParameters] @go(AuthenticationConfiguration,[]AuthenticationConfigurationParameters)

	// Whether continuous integration from the source repository is enabled for the App Runner service. If set to true, each repository change (source code commit or new image version) starts a deployment. Defaults to true.
	// +kubebuilder:validation:Optional
	autoDeploymentsEnabled?: null | bool @go(AutoDeploymentsEnabled,*bool)

	// Description of a source code repository. See Code Repository below for more details.
	// +kubebuilder:validation:Optional
	codeRepository?: [...#CodeRepositoryParameters] @go(CodeRepository,[]CodeRepositoryParameters)

	// Description of a source image repository. See Image Repository below for more details.
	// +kubebuilder:validation:Optional
	imageRepository?: [...#ImageRepositoryParameters] @go(ImageRepository,[]ImageRepositoryParameters)
}

// ServiceSpec defines the desired state of Service
#ServiceSpec: {
	forProvider: #ServiceParameters @go(ForProvider)
}

// ServiceStatus defines the observed state of Service.
#ServiceStatus: {
	atProvider?: #ServiceObservation @go(AtProvider)
}

// Service is the Schema for the Services API. Manages an App Runner Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Service: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.serviceName)",message="serviceName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.sourceConfiguration)",message="sourceConfiguration is a required parameter"
	spec:    #ServiceSpec   @go(Spec)
	status?: #ServiceStatus @go(Status)
}

// ServiceList contains a list of Services
#ServiceList: {
	items: [...#Service] @go(Items,[]Service)
}