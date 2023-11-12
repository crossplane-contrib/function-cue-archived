// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/security/v1beta1

package v1beta1

#AdditionalWorkspaceInitParameters: {
	// A list of data types which sent to workspace. Possible values are Alerts and RawEvents.
	dataTypes?: [...null | string] @go(DataTypes,[]*string)

	// The resource ID of the Log Analytics Workspace.
	workspaceId?: null | string @go(WorkspaceID,*string)
}

#AdditionalWorkspaceObservation: {
	// A list of data types which sent to workspace. Possible values are Alerts and RawEvents.
	dataTypes?: [...null | string] @go(DataTypes,[]*string)

	// The resource ID of the Log Analytics Workspace.
	workspaceId?: null | string @go(WorkspaceID,*string)
}

#AdditionalWorkspaceParameters: {
	// A list of data types which sent to workspace. Possible values are Alerts and RawEvents.
	// +kubebuilder:validation:Optional
	dataTypes: [...null | string] @go(DataTypes,[]*string)

	// The resource ID of the Log Analytics Workspace.
	// +kubebuilder:validation:Optional
	workspaceId?: null | string @go(WorkspaceID,*string)
}

#IOTSecuritySolutionInitParameters: {
	// A additional_workspace block as defined below.
	additionalWorkspace?: [...#AdditionalWorkspaceInitParameters] @go(AdditionalWorkspace,[]AdditionalWorkspaceInitParameters)

	// A list of disabled data sources for the Iot Security Solution. Possible value is TwinData.
	disabledDataSources?: [...null | string] @go(DisabledDataSources,[]*string)

	// Specifies the Display Name for this Iot Security Solution.
	displayName?: null | string @go(DisplayName,*string)

	// Is the Iot Security Solution enabled? Defaults to true.
	enabled?: null | bool @go(Enabled,*bool)

	// A list of data which is to exported to analytic workspace. Valid values include RawEvents.
	eventsToExport?: [...null | string] @go(EventsToExport,[]*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Specifies the Log Analytics Workspace ID to which the security data will be sent.
	logAnalyticsWorkspaceId?: null | string @go(LogAnalyticsWorkspaceID,*string)

	// Should IP addressed be unmasked in the log? Defaults to false.
	logUnmaskedIpsEnabled?: null | bool @go(LogUnmaskedIpsEnabled,*bool)

	// Specifies the name of the Iot Security Solution. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// An Azure Resource Graph query used to set the resources monitored.
	queryForResources?: null | string @go(QueryForResources,*string)

	// A list of subscription Ids on which the user defined resources query should be executed.
	querySubscriptionIds?: [...null | string] @go(QuerySubscriptionIds,[]*string)

	// A recommendations_enabled block of options to enable or disable as defined below.
	recommendationsEnabled?: [...#RecommendationsEnabledInitParameters] @go(RecommendationsEnabled,[]RecommendationsEnabledInitParameters)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#IOTSecuritySolutionObservation: {
	// A additional_workspace block as defined below.
	additionalWorkspace?: [...#AdditionalWorkspaceObservation] @go(AdditionalWorkspace,[]AdditionalWorkspaceObservation)

	// A list of disabled data sources for the Iot Security Solution. Possible value is TwinData.
	disabledDataSources?: [...null | string] @go(DisabledDataSources,[]*string)

	// Specifies the Display Name for this Iot Security Solution.
	displayName?: null | string @go(DisplayName,*string)

	// Is the Iot Security Solution enabled? Defaults to true.
	enabled?: null | bool @go(Enabled,*bool)

	// A list of data which is to exported to analytic workspace. Valid values include RawEvents.
	eventsToExport?: [...null | string] @go(EventsToExport,[]*string)

	// The ID of the Iot Security Solution resource.
	id?: null | string @go(ID,*string)

	// Specifies the IoT Hub resource IDs to which this Iot Security Solution is applied.
	iothubIds?: [...null | string] @go(IOTHubIds,[]*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Specifies the Log Analytics Workspace ID to which the security data will be sent.
	logAnalyticsWorkspaceId?: null | string @go(LogAnalyticsWorkspaceID,*string)

	// Should IP addressed be unmasked in the log? Defaults to false.
	logUnmaskedIpsEnabled?: null | bool @go(LogUnmaskedIpsEnabled,*bool)

	// Specifies the name of the Iot Security Solution. Changing this forces a new resource to be created.
	name?: null | string @go(Name,*string)

	// An Azure Resource Graph query used to set the resources monitored.
	queryForResources?: null | string @go(QueryForResources,*string)

	// A list of subscription Ids on which the user defined resources query should be executed.
	querySubscriptionIds?: [...null | string] @go(QuerySubscriptionIds,[]*string)

	// A recommendations_enabled block of options to enable or disable as defined below.
	recommendationsEnabled?: [...#RecommendationsEnabledObservation] @go(RecommendationsEnabled,[]RecommendationsEnabledObservation)

	// Specifies the name of the resource group in which to create the Iot Security Solution. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#IOTSecuritySolutionParameters: {
	// A additional_workspace block as defined below.
	// +kubebuilder:validation:Optional
	additionalWorkspace?: [...#AdditionalWorkspaceParameters] @go(AdditionalWorkspace,[]AdditionalWorkspaceParameters)

	// A list of disabled data sources for the Iot Security Solution. Possible value is TwinData.
	// +kubebuilder:validation:Optional
	disabledDataSources?: [...null | string] @go(DisabledDataSources,[]*string)

	// Specifies the Display Name for this Iot Security Solution.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// Is the Iot Security Solution enabled? Defaults to true.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// A list of data which is to exported to analytic workspace. Valid values include RawEvents.
	// +kubebuilder:validation:Optional
	eventsToExport?: [...null | string] @go(EventsToExport,[]*string)

	// Specifies the IoT Hub resource IDs to which this Iot Security Solution is applied.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/devices/v1beta1.IOTHub
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("id",true)
	// +kubebuilder:validation:Optional
	iothubIds?: [...null | string] @go(IOTHubIds,[]*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Specifies the Log Analytics Workspace ID to which the security data will be sent.
	// +kubebuilder:validation:Optional
	logAnalyticsWorkspaceId?: null | string @go(LogAnalyticsWorkspaceID,*string)

	// Should IP addressed be unmasked in the log? Defaults to false.
	// +kubebuilder:validation:Optional
	logUnmaskedIpsEnabled?: null | bool @go(LogUnmaskedIpsEnabled,*bool)

	// Specifies the name of the Iot Security Solution. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// An Azure Resource Graph query used to set the resources monitored.
	// +kubebuilder:validation:Optional
	queryForResources?: null | string @go(QueryForResources,*string)

	// A list of subscription Ids on which the user defined resources query should be executed.
	// +kubebuilder:validation:Optional
	querySubscriptionIds?: [...null | string] @go(QuerySubscriptionIds,[]*string)

	// A recommendations_enabled block of options to enable or disable as defined below.
	// +kubebuilder:validation:Optional
	recommendationsEnabled?: [...#RecommendationsEnabledParameters] @go(RecommendationsEnabled,[]RecommendationsEnabledParameters)

	// Specifies the name of the resource group in which to create the Iot Security Solution. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#RecommendationsEnabledInitParameters: {
	// Is Principal Authentication enabled for the ACR repository? Defaults to true.
	acrAuthentication?: null | bool @go(AcrAuthentication,*bool)

	// Is Agent send underutilized messages enabled? Defaults to true.
	agentSendUnutilizedMsg?: null | bool @go(AgentSendUnutilizedMsg,*bool)

	// Is Security related system configuration issues identified? Defaults to true.
	baseline?: null | bool @go(Baseline,*bool)

	// Is IoT Edge Hub memory optimized? Defaults to true.
	edgeHubMemOptimize?: null | bool @go(EdgeHubMemOptimize,*bool)

	// Is logging configured for IoT Edge module? Defaults to true.
	edgeLoggingOption?: null | bool @go(EdgeLoggingOption,*bool)

	// Is Default IP filter policy denied? Defaults to true.
	ipFilterDenyAll?: null | bool @go(IPFilterDenyAll,*bool)

	// Is IP filter rule source allowable IP range too large? Defaults to true.
	ipFilterPermissiveRule?: null | bool @go(IPFilterPermissiveRule,*bool)

	// Is inconsistent module settings enabled for SecurityGroup? Defaults to true.
	inconsistentModuleSettings?: null | bool @go(InconsistentModuleSettings,*bool)

	// is Azure IoT Security agent installed? Defaults to true.
	installAgent?: null | bool @go(InstallAgent,*bool)

	// Is any ports open on the device? Defaults to true.
	openPorts?: null | bool @go(OpenPorts,*bool)

	// Does firewall policy exist which allow necessary communication to/from the device? Defaults to true.
	permissiveFirewallPolicy?: null | bool @go(PermissiveFirewallPolicy,*bool)

	// Is only necessary addresses or ports are permitted in? Defaults to true.
	permissiveInputFirewallRules?: null | bool @go(PermissiveInputFirewallRules,*bool)

	// Is only necessary addresses or ports are permitted out? Defaults to true.
	permissiveOutputFirewallRules?: null | bool @go(PermissiveOutputFirewallRules,*bool)

	// Is high level permissions are needed for the module? Defaults to true.
	privilegedDockerOptions?: null | bool @go(PrivilegedDockerOptions,*bool)

	// Is any credentials shared among devices? Defaults to true.
	sharedCredentials?: null | bool @go(SharedCredentials,*bool)

	// Does TLS cipher suite need to be updated? Defaults to true.
	vulnerableTlsCipherSuite?: null | bool @go(VulnerableTLSCipherSuite,*bool)
}

#RecommendationsEnabledObservation: {
	// Is Principal Authentication enabled for the ACR repository? Defaults to true.
	acrAuthentication?: null | bool @go(AcrAuthentication,*bool)

	// Is Agent send underutilized messages enabled? Defaults to true.
	agentSendUnutilizedMsg?: null | bool @go(AgentSendUnutilizedMsg,*bool)

	// Is Security related system configuration issues identified? Defaults to true.
	baseline?: null | bool @go(Baseline,*bool)

	// Is IoT Edge Hub memory optimized? Defaults to true.
	edgeHubMemOptimize?: null | bool @go(EdgeHubMemOptimize,*bool)

	// Is logging configured for IoT Edge module? Defaults to true.
	edgeLoggingOption?: null | bool @go(EdgeLoggingOption,*bool)

	// Is Default IP filter policy denied? Defaults to true.
	ipFilterDenyAll?: null | bool @go(IPFilterDenyAll,*bool)

	// Is IP filter rule source allowable IP range too large? Defaults to true.
	ipFilterPermissiveRule?: null | bool @go(IPFilterPermissiveRule,*bool)

	// Is inconsistent module settings enabled for SecurityGroup? Defaults to true.
	inconsistentModuleSettings?: null | bool @go(InconsistentModuleSettings,*bool)

	// is Azure IoT Security agent installed? Defaults to true.
	installAgent?: null | bool @go(InstallAgent,*bool)

	// Is any ports open on the device? Defaults to true.
	openPorts?: null | bool @go(OpenPorts,*bool)

	// Does firewall policy exist which allow necessary communication to/from the device? Defaults to true.
	permissiveFirewallPolicy?: null | bool @go(PermissiveFirewallPolicy,*bool)

	// Is only necessary addresses or ports are permitted in? Defaults to true.
	permissiveInputFirewallRules?: null | bool @go(PermissiveInputFirewallRules,*bool)

	// Is only necessary addresses or ports are permitted out? Defaults to true.
	permissiveOutputFirewallRules?: null | bool @go(PermissiveOutputFirewallRules,*bool)

	// Is high level permissions are needed for the module? Defaults to true.
	privilegedDockerOptions?: null | bool @go(PrivilegedDockerOptions,*bool)

	// Is any credentials shared among devices? Defaults to true.
	sharedCredentials?: null | bool @go(SharedCredentials,*bool)

	// Does TLS cipher suite need to be updated? Defaults to true.
	vulnerableTlsCipherSuite?: null | bool @go(VulnerableTLSCipherSuite,*bool)
}

#RecommendationsEnabledParameters: {
	// Is Principal Authentication enabled for the ACR repository? Defaults to true.
	// +kubebuilder:validation:Optional
	acrAuthentication?: null | bool @go(AcrAuthentication,*bool)

	// Is Agent send underutilized messages enabled? Defaults to true.
	// +kubebuilder:validation:Optional
	agentSendUnutilizedMsg?: null | bool @go(AgentSendUnutilizedMsg,*bool)

	// Is Security related system configuration issues identified? Defaults to true.
	// +kubebuilder:validation:Optional
	baseline?: null | bool @go(Baseline,*bool)

	// Is IoT Edge Hub memory optimized? Defaults to true.
	// +kubebuilder:validation:Optional
	edgeHubMemOptimize?: null | bool @go(EdgeHubMemOptimize,*bool)

	// Is logging configured for IoT Edge module? Defaults to true.
	// +kubebuilder:validation:Optional
	edgeLoggingOption?: null | bool @go(EdgeLoggingOption,*bool)

	// Is Default IP filter policy denied? Defaults to true.
	// +kubebuilder:validation:Optional
	ipFilterDenyAll?: null | bool @go(IPFilterDenyAll,*bool)

	// Is IP filter rule source allowable IP range too large? Defaults to true.
	// +kubebuilder:validation:Optional
	ipFilterPermissiveRule?: null | bool @go(IPFilterPermissiveRule,*bool)

	// Is inconsistent module settings enabled for SecurityGroup? Defaults to true.
	// +kubebuilder:validation:Optional
	inconsistentModuleSettings?: null | bool @go(InconsistentModuleSettings,*bool)

	// is Azure IoT Security agent installed? Defaults to true.
	// +kubebuilder:validation:Optional
	installAgent?: null | bool @go(InstallAgent,*bool)

	// Is any ports open on the device? Defaults to true.
	// +kubebuilder:validation:Optional
	openPorts?: null | bool @go(OpenPorts,*bool)

	// Does firewall policy exist which allow necessary communication to/from the device? Defaults to true.
	// +kubebuilder:validation:Optional
	permissiveFirewallPolicy?: null | bool @go(PermissiveFirewallPolicy,*bool)

	// Is only necessary addresses or ports are permitted in? Defaults to true.
	// +kubebuilder:validation:Optional
	permissiveInputFirewallRules?: null | bool @go(PermissiveInputFirewallRules,*bool)

	// Is only necessary addresses or ports are permitted out? Defaults to true.
	// +kubebuilder:validation:Optional
	permissiveOutputFirewallRules?: null | bool @go(PermissiveOutputFirewallRules,*bool)

	// Is high level permissions are needed for the module? Defaults to true.
	// +kubebuilder:validation:Optional
	privilegedDockerOptions?: null | bool @go(PrivilegedDockerOptions,*bool)

	// Is any credentials shared among devices? Defaults to true.
	// +kubebuilder:validation:Optional
	sharedCredentials?: null | bool @go(SharedCredentials,*bool)

	// Does TLS cipher suite need to be updated? Defaults to true.
	// +kubebuilder:validation:Optional
	vulnerableTlsCipherSuite?: null | bool @go(VulnerableTLSCipherSuite,*bool)
}

// IOTSecuritySolutionSpec defines the desired state of IOTSecuritySolution
#IOTSecuritySolutionSpec: {
	forProvider: #IOTSecuritySolutionParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #IOTSecuritySolutionInitParameters @go(InitProvider)
}

// IOTSecuritySolutionStatus defines the observed state of IOTSecuritySolution.
#IOTSecuritySolutionStatus: {
	atProvider?: #IOTSecuritySolutionObservation @go(AtProvider)
}

// IOTSecuritySolution is the Schema for the IOTSecuritySolutions API. Manages an iot security solution.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#IOTSecuritySolution: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.displayName) || (has(self.initProvider) && has(self.initProvider.displayName))",message="spec.forProvider.displayName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || (has(self.initProvider) && has(self.initProvider.location))",message="spec.forProvider.location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #IOTSecuritySolutionSpec   @go(Spec)
	status?: #IOTSecuritySolutionStatus @go(Status)
}

// IOTSecuritySolutionList contains a list of IOTSecuritySolutions
#IOTSecuritySolutionList: {
	items: [...#IOTSecuritySolution] @go(Items,[]IOTSecuritySolution)
}