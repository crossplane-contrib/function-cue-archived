// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/datafactory/v1beta1

package v1beta1

#FactoryInitParameters: {
	// Specifies the Azure Key Vault Key ID to be used as the Customer Managed Key (CMK) for double encryption. Required with user assigned identity.
	customerManagedKeyId?: null | string @go(CustomerManagedKeyID,*string)

	// Specifies the ID of the user assigned identity associated with the Customer Managed Key. Must be supplied if customer_managed_key_id is set.
	customerManagedKeyIdentityId?: null | string @go(CustomerManagedKeyIdentityID,*string)

	// A github_configuration block as defined below.
	githubConfiguration?: [...#GithubConfigurationInitParameters] @go(GithubConfiguration,[]GithubConfigurationInitParameters)

	// A list of global_parameter blocks as defined above.
	globalParameter?: [...#GlobalParameterInitParameters] @go(GlobalParameter,[]GlobalParameterInitParameters)

	// An identity block as defined below.
	identity?: [...#IdentityInitParameters] @go(Identity,[]IdentityInitParameters)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Is Managed Virtual Network enabled?
	managedVirtualNetworkEnabled?: null | bool @go(ManagedVirtualNetworkEnabled,*bool)

	// Is the Data Factory visible to the public network? Defaults to true.
	publicNetworkEnabled?: null | bool @go(PublicNetworkEnabled,*bool)

	// Specifies the ID of the purview account resource associated with the Data Factory.
	purviewId?: null | string @go(PurviewID,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A vsts_configuration block as defined below.
	vstsConfiguration?: [...#VstsConfigurationInitParameters] @go(VstsConfiguration,[]VstsConfigurationInitParameters)
}

#FactoryObservation: {
	// Specifies the Azure Key Vault Key ID to be used as the Customer Managed Key (CMK) for double encryption. Required with user assigned identity.
	customerManagedKeyId?: null | string @go(CustomerManagedKeyID,*string)

	// Specifies the ID of the user assigned identity associated with the Customer Managed Key. Must be supplied if customer_managed_key_id is set.
	customerManagedKeyIdentityId?: null | string @go(CustomerManagedKeyIdentityID,*string)

	// A github_configuration block as defined below.
	githubConfiguration?: [...#GithubConfigurationObservation] @go(GithubConfiguration,[]GithubConfigurationObservation)

	// A list of global_parameter blocks as defined above.
	globalParameter?: [...#GlobalParameterObservation] @go(GlobalParameter,[]GlobalParameterObservation)

	// The ID of the Data Factory.
	id?: null | string @go(ID,*string)

	// An identity block as defined below.
	identity?: [...#IdentityObservation] @go(Identity,[]IdentityObservation)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Is Managed Virtual Network enabled?
	managedVirtualNetworkEnabled?: null | bool @go(ManagedVirtualNetworkEnabled,*bool)

	// Is the Data Factory visible to the public network? Defaults to true.
	publicNetworkEnabled?: null | bool @go(PublicNetworkEnabled,*bool)

	// Specifies the ID of the purview account resource associated with the Data Factory.
	purviewId?: null | string @go(PurviewID,*string)

	// The name of the resource group in which to create the Data Factory. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A vsts_configuration block as defined below.
	vstsConfiguration?: [...#VstsConfigurationObservation] @go(VstsConfiguration,[]VstsConfigurationObservation)
}

#FactoryParameters: {
	// Specifies the Azure Key Vault Key ID to be used as the Customer Managed Key (CMK) for double encryption. Required with user assigned identity.
	// +kubebuilder:validation:Optional
	customerManagedKeyId?: null | string @go(CustomerManagedKeyID,*string)

	// Specifies the ID of the user assigned identity associated with the Customer Managed Key. Must be supplied if customer_managed_key_id is set.
	// +kubebuilder:validation:Optional
	customerManagedKeyIdentityId?: null | string @go(CustomerManagedKeyIdentityID,*string)

	// A github_configuration block as defined below.
	// +kubebuilder:validation:Optional
	githubConfiguration?: [...#GithubConfigurationParameters] @go(GithubConfiguration,[]GithubConfigurationParameters)

	// A list of global_parameter blocks as defined above.
	// +kubebuilder:validation:Optional
	globalParameter?: [...#GlobalParameterParameters] @go(GlobalParameter,[]GlobalParameterParameters)

	// An identity block as defined below.
	// +kubebuilder:validation:Optional
	identity?: [...#IdentityParameters] @go(Identity,[]IdentityParameters)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Is Managed Virtual Network enabled?
	// +kubebuilder:validation:Optional
	managedVirtualNetworkEnabled?: null | bool @go(ManagedVirtualNetworkEnabled,*bool)

	// Is the Data Factory visible to the public network? Defaults to true.
	// +kubebuilder:validation:Optional
	publicNetworkEnabled?: null | bool @go(PublicNetworkEnabled,*bool)

	// Specifies the ID of the purview account resource associated with the Data Factory.
	// +kubebuilder:validation:Optional
	purviewId?: null | string @go(PurviewID,*string)

	// The name of the resource group in which to create the Data Factory. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A vsts_configuration block as defined below.
	// +kubebuilder:validation:Optional
	vstsConfiguration?: [...#VstsConfigurationParameters] @go(VstsConfiguration,[]VstsConfigurationParameters)
}

#GithubConfigurationInitParameters: {
	// Specifies the GitHub account name.
	accountName?: null | string @go(AccountName,*string)

	// Specifies the branch of the repository to get code from.
	branchName?: null | string @go(BranchName,*string)

	// Specifies the GitHub Enterprise host name. For example: https://github.mydomain.com. Use https://github.com for open source repositories.
	gitUrl?: null | string @go(GitURL,*string)

	// Specifies the name of the git repository.
	repositoryName?: null | string @go(RepositoryName,*string)

	// Specifies the root folder within the repository. Set to / for the top level.
	rootFolder?: null | string @go(RootFolder,*string)
}

#GithubConfigurationObservation: {
	// Specifies the GitHub account name.
	accountName?: null | string @go(AccountName,*string)

	// Specifies the branch of the repository to get code from.
	branchName?: null | string @go(BranchName,*string)

	// Specifies the GitHub Enterprise host name. For example: https://github.mydomain.com. Use https://github.com for open source repositories.
	gitUrl?: null | string @go(GitURL,*string)

	// Specifies the name of the git repository.
	repositoryName?: null | string @go(RepositoryName,*string)

	// Specifies the root folder within the repository. Set to / for the top level.
	rootFolder?: null | string @go(RootFolder,*string)
}

#GithubConfigurationParameters: {
	// Specifies the GitHub account name.
	// +kubebuilder:validation:Optional
	accountName?: null | string @go(AccountName,*string)

	// Specifies the branch of the repository to get code from.
	// +kubebuilder:validation:Optional
	branchName?: null | string @go(BranchName,*string)

	// Specifies the GitHub Enterprise host name. For example: https://github.mydomain.com. Use https://github.com for open source repositories.
	// +kubebuilder:validation:Optional
	gitUrl?: null | string @go(GitURL,*string)

	// Specifies the name of the git repository.
	// +kubebuilder:validation:Optional
	repositoryName?: null | string @go(RepositoryName,*string)

	// Specifies the root folder within the repository. Set to / for the top level.
	// +kubebuilder:validation:Optional
	rootFolder?: null | string @go(RootFolder,*string)
}

#GlobalParameterInitParameters: {
	// Specifies the global parameter name.
	name?: null | string @go(Name,*string)

	// Specifies the global parameter type. Possible Values are Array, Bool, Float, Int, Object or String.
	type?: null | string @go(Type,*string)

	// Specifies the global parameter value.
	value?: null | string @go(Value,*string)
}

#GlobalParameterObservation: {
	// Specifies the global parameter name.
	name?: null | string @go(Name,*string)

	// Specifies the global parameter type. Possible Values are Array, Bool, Float, Int, Object or String.
	type?: null | string @go(Type,*string)

	// Specifies the global parameter value.
	value?: null | string @go(Value,*string)
}

#GlobalParameterParameters: {
	// Specifies the global parameter name.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Specifies the global parameter type. Possible Values are Array, Bool, Float, Int, Object or String.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)

	// Specifies the global parameter value.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#IdentityInitParameters: {
	// Specifies a list of User Assigned Managed Identity IDs to be assigned to this Data Factory.
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// Specifies the type of Managed Service Identity that should be configured on this Data Factory. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
	type?: null | string @go(Type,*string)
}

#IdentityObservation: {
	// Specifies a list of User Assigned Managed Identity IDs to be assigned to this Data Factory.
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// The Principal ID associated with this Managed Service Identity.
	principalId?: null | string @go(PrincipalID,*string)

	// The Tenant ID associated with this Managed Service Identity.
	tenantId?: null | string @go(TenantID,*string)

	// Specifies the type of Managed Service Identity that should be configured on this Data Factory. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
	type?: null | string @go(Type,*string)
}

#IdentityParameters: {
	// Specifies a list of User Assigned Managed Identity IDs to be assigned to this Data Factory.
	// +kubebuilder:validation:Optional
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// Specifies the type of Managed Service Identity that should be configured on this Data Factory. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#VstsConfigurationInitParameters: {
	// Specifies the VSTS account name.
	accountName?: null | string @go(AccountName,*string)

	// Specifies the branch of the repository to get code from.
	branchName?: null | string @go(BranchName,*string)

	// Specifies the name of the VSTS project.
	projectName?: null | string @go(ProjectName,*string)

	// Specifies the name of the git repository.
	repositoryName?: null | string @go(RepositoryName,*string)

	// Specifies the root folder within the repository. Set to / for the top level.
	rootFolder?: null | string @go(RootFolder,*string)

	// Specifies the Tenant ID associated with the VSTS account.
	tenantId?: null | string @go(TenantID,*string)
}

#VstsConfigurationObservation: {
	// Specifies the VSTS account name.
	accountName?: null | string @go(AccountName,*string)

	// Specifies the branch of the repository to get code from.
	branchName?: null | string @go(BranchName,*string)

	// Specifies the name of the VSTS project.
	projectName?: null | string @go(ProjectName,*string)

	// Specifies the name of the git repository.
	repositoryName?: null | string @go(RepositoryName,*string)

	// Specifies the root folder within the repository. Set to / for the top level.
	rootFolder?: null | string @go(RootFolder,*string)

	// Specifies the Tenant ID associated with the VSTS account.
	tenantId?: null | string @go(TenantID,*string)
}

#VstsConfigurationParameters: {
	// Specifies the VSTS account name.
	// +kubebuilder:validation:Optional
	accountName?: null | string @go(AccountName,*string)

	// Specifies the branch of the repository to get code from.
	// +kubebuilder:validation:Optional
	branchName?: null | string @go(BranchName,*string)

	// Specifies the name of the VSTS project.
	// +kubebuilder:validation:Optional
	projectName?: null | string @go(ProjectName,*string)

	// Specifies the name of the git repository.
	// +kubebuilder:validation:Optional
	repositoryName?: null | string @go(RepositoryName,*string)

	// Specifies the root folder within the repository. Set to / for the top level.
	// +kubebuilder:validation:Optional
	rootFolder?: null | string @go(RootFolder,*string)

	// Specifies the Tenant ID associated with the VSTS account.
	// +kubebuilder:validation:Optional
	tenantId?: null | string @go(TenantID,*string)
}

// FactorySpec defines the desired state of Factory
#FactorySpec: {
	forProvider: #FactoryParameters @go(ForProvider)

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
	initProvider?: #FactoryInitParameters @go(InitProvider)
}

// FactoryStatus defines the observed state of Factory.
#FactoryStatus: {
	atProvider?: #FactoryObservation @go(AtProvider)
}

// Factory is the Schema for the Factorys API. Manages an Azure Data Factory (Version 2).
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Factory: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || has(self.initProvider.location)",message="location is a required parameter"
	spec:    #FactorySpec   @go(Spec)
	status?: #FactoryStatus @go(Status)
}

// FactoryList contains a list of Factorys
#FactoryList: {
	items: [...#Factory] @go(Items,[]Factory)
}