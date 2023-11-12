// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/sql/v1beta1

package v1beta1

#MSSQLOutboundFirewallRuleObservation: {
	// The SQL Outbound Firewall Rule ID.
	id?: null | string @go(ID,*string)

	// The resource ID of the SQL Server on which to create the Outbound Firewall Rule. Changing this forces a new resource to be created.
	serverId?: null | string @go(ServerID,*string)
}

#MSSQLOutboundFirewallRuleParameters: {
	// The resource ID of the SQL Server on which to create the Outbound Firewall Rule. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=MSSQLServer
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	serverId?: null | string @go(ServerID,*string)
}

// MSSQLOutboundFirewallRuleSpec defines the desired state of MSSQLOutboundFirewallRule
#MSSQLOutboundFirewallRuleSpec: {
	forProvider: #MSSQLOutboundFirewallRuleParameters @go(ForProvider)
}

// MSSQLOutboundFirewallRuleStatus defines the observed state of MSSQLOutboundFirewallRule.
#MSSQLOutboundFirewallRuleStatus: {
	atProvider?: #MSSQLOutboundFirewallRuleObservation @go(AtProvider)
}

// MSSQLOutboundFirewallRule is the Schema for the MSSQLOutboundFirewallRules API. Manages an Azure SQL Outbound Firewall Rule.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#MSSQLOutboundFirewallRule: {
	spec:    #MSSQLOutboundFirewallRuleSpec   @go(Spec)
	status?: #MSSQLOutboundFirewallRuleStatus @go(Status)
}

// MSSQLOutboundFirewallRuleList contains a list of MSSQLOutboundFirewallRules
#MSSQLOutboundFirewallRuleList: {
	items: [...#MSSQLOutboundFirewallRule] @go(Items,[]MSSQLOutboundFirewallRule)
}