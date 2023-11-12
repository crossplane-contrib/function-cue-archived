// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1

package v1beta1

#ProjectIAMAuditConfigAuditLogConfigObservation: {
	exemptedMembers?: [...null | string] @go(ExemptedMembers,[]*string)
	logType?: null | string @go(LogType,*string)
}

#ProjectIAMAuditConfigAuditLogConfigParameters: {
	// +kubebuilder:validation:Optional
	exemptedMembers?: [...null | string] @go(ExemptedMembers,[]*string)

	// +kubebuilder:validation:Required
	logType?: null | string @go(LogType,*string)
}

#ProjectIAMAuditConfigObservation: {
	auditLogConfig?: [...#ProjectIAMAuditConfigAuditLogConfigObservation] @go(AuditLogConfig,[]ProjectIAMAuditConfigAuditLogConfigObservation)
	etag?:    null | string @go(Etag,*string)
	id?:      null | string @go(ID,*string)
	project?: null | string @go(Project,*string)
	service?: null | string @go(Service,*string)
}

#ProjectIAMAuditConfigParameters: {
	// +kubebuilder:validation:Optional
	auditLogConfig?: [...#ProjectIAMAuditConfigAuditLogConfigParameters] @go(AuditLogConfig,[]ProjectIAMAuditConfigAuditLogConfigParameters)

	// +crossplane:generate:reference:type=Project
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// +kubebuilder:validation:Optional
	service?: null | string @go(Service,*string)
}

// ProjectIAMAuditConfigSpec defines the desired state of ProjectIAMAuditConfig
#ProjectIAMAuditConfigSpec: {
	forProvider: #ProjectIAMAuditConfigParameters @go(ForProvider)
}

// ProjectIAMAuditConfigStatus defines the observed state of ProjectIAMAuditConfig.
#ProjectIAMAuditConfigStatus: {
	atProvider?: #ProjectIAMAuditConfigObservation @go(AtProvider)
}

// ProjectIAMAuditConfig is the Schema for the ProjectIAMAuditConfigs API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ProjectIAMAuditConfig: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.auditLogConfig)",message="auditLogConfig is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.service)",message="service is a required parameter"
	spec:    #ProjectIAMAuditConfigSpec   @go(Spec)
	status?: #ProjectIAMAuditConfigStatus @go(Status)
}

// ProjectIAMAuditConfigList contains a list of ProjectIAMAuditConfigs
#ProjectIAMAuditConfigList: {
	items: [...#ProjectIAMAuditConfig] @go(Items,[]ProjectIAMAuditConfig)
}