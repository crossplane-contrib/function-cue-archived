// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/amplify/v1beta1

package v1beta1

#AppObservation: {
	// ARN of the Amplify app.
	arn?: null | string @go(Arn,*string)

	// Default domain for the Amplify app.
	defaultDomain?: null | string @go(DefaultDomain,*string)

	// Unique ID of the Amplify app.
	id?: null | string @go(ID,*string)

	// Describes the information about a production branch for an Amplify app. A production_branch block is documented below.
	productionBranch?: [...#ProductionBranchObservation] @go(ProductionBranch,[]ProductionBranchObservation)

	// Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#AppParameters: {
	// Automated branch creation configuration for an Amplify app. An auto_branch_creation_config block is documented below.
	// +kubebuilder:validation:Optional
	autoBranchCreationConfig?: [...#AutoBranchCreationConfigParameters] @go(AutoBranchCreationConfig,[]AutoBranchCreationConfigParameters)

	// Automated branch creation glob patterns for an Amplify app.
	// +kubebuilder:validation:Optional
	autoBranchCreationPatterns?: [...null | string] @go(AutoBranchCreationPatterns,[]*string)

	// The build specification (build spec) for an Amplify app.
	// +kubebuilder:validation:Optional
	buildSpec?: null | string @go(BuildSpec,*string)

	// Custom rewrite and redirect rules for an Amplify app. A custom_rule block is documented below.
	// +kubebuilder:validation:Optional
	customRule?: [...#CustomRuleParameters] @go(CustomRule,[]CustomRuleParameters)

	// Description for an Amplify app.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Enables automated branch creation for an Amplify app.
	// +kubebuilder:validation:Optional
	enableAutoBranchCreation?: null | bool @go(EnableAutoBranchCreation,*bool)

	// Enables basic authorization for an Amplify app. This will apply to all branches that are part of this app.
	// +kubebuilder:validation:Optional
	enableBasicAuth?: null | bool @go(EnableBasicAuth,*bool)

	// Enables auto-building of branches for the Amplify App.
	// +kubebuilder:validation:Optional
	enableBranchAutoBuild?: null | bool @go(EnableBranchAutoBuild,*bool)

	// Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository.
	// +kubebuilder:validation:Optional
	enableBranchAutoDeletion?: null | bool @go(EnableBranchAutoDeletion,*bool)

	// Environment variables map for an Amplify app.
	// +kubebuilder:validation:Optional
	environmentVariables?: {[string]: null | string} @go(EnvironmentVariables,map[string]*string)

	// AWS Identity and Access Management (IAM) service role for an Amplify app.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	iamServiceRoleArn?: null | string @go(IAMServiceRoleArn,*string)

	// Name for an Amplify app.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)

	// Platform or framework for an Amplify app. Valid values: WEB, WEB_COMPUTE. Default value: WEB.
	// +kubebuilder:validation:Optional
	platform?: null | string @go(Platform,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Repository for an Amplify app.
	// +kubebuilder:validation:Optional
	repository?: null | string @go(Repository,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#AutoBranchCreationConfigObservation: {
}

#AutoBranchCreationConfigParameters: {
	// Build specification (build spec) for the autocreated branch.
	// +kubebuilder:validation:Optional
	buildSpec?: null | string @go(BuildSpec,*string)

	// Enables auto building for the autocreated branch.
	// +kubebuilder:validation:Optional
	enableAutoBuild?: null | bool @go(EnableAutoBuild,*bool)

	// Enables basic authorization for the autocreated branch.
	// +kubebuilder:validation:Optional
	enableBasicAuth?: null | bool @go(EnableBasicAuth,*bool)

	// Enables performance mode for the branch.
	// +kubebuilder:validation:Optional
	enablePerformanceMode?: null | bool @go(EnablePerformanceMode,*bool)

	// Enables pull request previews for the autocreated branch.
	// +kubebuilder:validation:Optional
	enablePullRequestPreview?: null | bool @go(EnablePullRequestPreview,*bool)

	// Environment variables for the autocreated branch.
	// +kubebuilder:validation:Optional
	environmentVariables?: {[string]: null | string} @go(EnvironmentVariables,map[string]*string)

	// Framework for the autocreated branch.
	// +kubebuilder:validation:Optional
	framework?: null | string @go(Framework,*string)

	// Amplify environment name for the pull request.
	// +kubebuilder:validation:Optional
	pullRequestEnvironmentName?: null | string @go(PullRequestEnvironmentName,*string)

	// Describes the current stage for the autocreated branch. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL_REQUEST.
	// +kubebuilder:validation:Optional
	stage?: null | string @go(Stage,*string)
}

#CustomRuleObservation: {
}

#CustomRuleParameters: {
	// Condition for a URL rewrite or redirect rule, such as a country code.
	// +kubebuilder:validation:Optional
	condition?: null | string @go(Condition,*string)

	// Source pattern for a URL rewrite or redirect rule.
	// +kubebuilder:validation:Required
	source?: null | string @go(Source,*string)

	// Status code for a URL rewrite or redirect rule. Valid values: 200, 301, 302, 404, 404-200.
	// +kubebuilder:validation:Optional
	status?: null | string @go(Status,*string)

	// Target pattern for a URL rewrite or redirect rule.
	// +kubebuilder:validation:Required
	target?: null | string @go(Target,*string)
}

#ProductionBranchObservation: {
	// Branch name for the production branch.
	branchName?: null | string @go(BranchName,*string)

	// Last deploy time of the production branch.
	lastDeployTime?: null | string @go(LastDeployTime,*string)

	// Status of the production branch.
	status?: null | string @go(Status,*string)

	// Thumbnail URL for the production branch.
	thumbnailUrl?: null | string @go(ThumbnailURL,*string)
}

#ProductionBranchParameters: {
}

// AppSpec defines the desired state of App
#AppSpec: {
	forProvider: #AppParameters @go(ForProvider)
}

// AppStatus defines the observed state of App.
#AppStatus: {
	atProvider?: #AppObservation @go(AtProvider)
}

// App is the Schema for the Apps API. Provides an Amplify App resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#App: {
	spec:    #AppSpec   @go(Spec)
	status?: #AppStatus @go(Status)
}

// AppList contains a list of Apps
#AppList: {
	items: [...#App] @go(Items,[]App)
}