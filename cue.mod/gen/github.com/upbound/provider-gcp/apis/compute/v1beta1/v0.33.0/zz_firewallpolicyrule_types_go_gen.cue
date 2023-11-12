// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

#FirewallPolicyRuleObservation: {
	// The Action to perform when the client connection triggers the rule. Can currently be either "allow" or "deny()" where valid values for status are 403, 404, and 502.
	action?: null | string @go(Action,*string)

	// An optional description for this resource.
	description?: null | string @go(Description,*string)

	// The direction in which this rule applies. Possible values: INGRESS, EGRESS
	direction?: null | string @go(Direction,*string)

	// Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled.
	disabled?: null | bool @go(Disabled,*bool)

	// Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. Logs may be exported to BigQuery or Pub/Sub. Note: you cannot enable logging on "goto_next" rules.
	enableLogging?: null | bool @go(EnableLogging,*bool)

	// The firewall policy of the resource.
	firewallPolicy?: null | string @go(FirewallPolicy,*string)

	// an identifier for the resource with format locations/global/firewallPolicies/{{firewall_policy}}/rules/{{priority}}
	id?: null | string @go(ID,*string)

	// Type of the resource. Always compute#firewallPolicyRule for firewall policy rules
	kind?: null | string @go(Kind,*string)

	// A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. Structure is documented below.
	match?: [...#MatchObservation] @go(Match,[]MatchObservation)

	// An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority.
	priority?: null | float64 @go(Priority,*float64)

	// Calculation of the complexity of a single firewall policy rule.
	ruleTupleCount?: null | float64 @go(RuleTupleCount,*float64)

	// A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule.
	targetResources?: [...null | string] @go(TargetResources,[]*string)

	// A list of service accounts indicating the sets of instances that are applied with this rule.
	targetServiceAccounts?: [...null | string] @go(TargetServiceAccounts,[]*string)
}

#FirewallPolicyRuleParameters: {
	// The Action to perform when the client connection triggers the rule. Can currently be either "allow" or "deny()" where valid values for status are 403, 404, and 502.
	// +kubebuilder:validation:Optional
	action?: null | string @go(Action,*string)

	// An optional description for this resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The direction in which this rule applies. Possible values: INGRESS, EGRESS
	// +kubebuilder:validation:Optional
	direction?: null | string @go(Direction,*string)

	// Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled.
	// +kubebuilder:validation:Optional
	disabled?: null | bool @go(Disabled,*bool)

	// Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. Logs may be exported to BigQuery or Pub/Sub. Note: you cannot enable logging on "goto_next" rules.
	// +kubebuilder:validation:Optional
	enableLogging?: null | bool @go(EnableLogging,*bool)

	// The firewall policy of the resource.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.FirewallPolicy
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	firewallPolicy?: null | string @go(FirewallPolicy,*string)

	// A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. Structure is documented below.
	// +kubebuilder:validation:Optional
	match?: [...#MatchParameters] @go(Match,[]MatchParameters)

	// An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority.
	// +kubebuilder:validation:Optional
	priority?: null | float64 @go(Priority,*float64)

	// A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule.
	// +kubebuilder:validation:Optional
	targetResources?: [...null | string] @go(TargetResources,[]*string)

	// A list of service accounts indicating the sets of instances that are applied with this rule.
	// +kubebuilder:validation:Optional
	targetServiceAccounts?: [...null | string] @go(TargetServiceAccounts,[]*string)
}

#Layer4ConfigsObservation: {
	// The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.
	ipProtocol?: null | string @go(IPProtocol,*string)

	// An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port.
	ports?: [...null | string] @go(Ports,[]*string)
}

#Layer4ConfigsParameters: {
	// The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.
	// +kubebuilder:validation:Required
	ipProtocol?: null | string @go(IPProtocol,*string)

	// An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port.
	// +kubebuilder:validation:Optional
	ports?: [...null | string] @go(Ports,[]*string)
}

#MatchObservation: {
	destAddressGroups?: [...null | string] @go(DestAddressGroups,[]*string)
	destFqdns?: [...null | string] @go(DestFqdns,[]*string)

	// CIDR IP address range. Maximum number of destination CIDR IP ranges allowed is 256.
	destIpRanges?: [...null | string] @go(DestIPRanges,[]*string)
	destRegionCodes?: [...null | string] @go(DestRegionCodes,[]*string)
	destThreatIntelligences?: [...null | string] @go(DestThreatIntelligences,[]*string)

	// Pairs of IP protocols and ports that the rule should match. Structure is documented below.
	layer4Configs?: [...#Layer4ConfigsObservation] @go(Layer4Configs,[]Layer4ConfigsObservation)
	srcAddressGroups?: [...null | string] @go(SrcAddressGroups,[]*string)
	srcFqdns?: [...null | string] @go(SrcFqdns,[]*string)

	// CIDR IP address range. Maximum number of source CIDR IP ranges allowed is 256.
	srcIpRanges?: [...null | string] @go(SrcIPRanges,[]*string)
	srcRegionCodes?: [...null | string] @go(SrcRegionCodes,[]*string)
	srcThreatIntelligences?: [...null | string] @go(SrcThreatIntelligences,[]*string)
}

#MatchParameters: {
	// +kubebuilder:validation:Optional
	destAddressGroups?: [...null | string] @go(DestAddressGroups,[]*string)

	// +kubebuilder:validation:Optional
	destFqdns?: [...null | string] @go(DestFqdns,[]*string)

	// CIDR IP address range. Maximum number of destination CIDR IP ranges allowed is 256.
	// +kubebuilder:validation:Optional
	destIpRanges?: [...null | string] @go(DestIPRanges,[]*string)

	// +kubebuilder:validation:Optional
	destRegionCodes?: [...null | string] @go(DestRegionCodes,[]*string)

	// +kubebuilder:validation:Optional
	destThreatIntelligences?: [...null | string] @go(DestThreatIntelligences,[]*string)

	// Pairs of IP protocols and ports that the rule should match. Structure is documented below.
	// +kubebuilder:validation:Required
	layer4Configs: [...#Layer4ConfigsParameters] @go(Layer4Configs,[]Layer4ConfigsParameters)

	// +kubebuilder:validation:Optional
	srcAddressGroups?: [...null | string] @go(SrcAddressGroups,[]*string)

	// +kubebuilder:validation:Optional
	srcFqdns?: [...null | string] @go(SrcFqdns,[]*string)

	// CIDR IP address range. Maximum number of source CIDR IP ranges allowed is 256.
	// +kubebuilder:validation:Optional
	srcIpRanges?: [...null | string] @go(SrcIPRanges,[]*string)

	// +kubebuilder:validation:Optional
	srcRegionCodes?: [...null | string] @go(SrcRegionCodes,[]*string)

	// +kubebuilder:validation:Optional
	srcThreatIntelligences?: [...null | string] @go(SrcThreatIntelligences,[]*string)
}

// FirewallPolicyRuleSpec defines the desired state of FirewallPolicyRule
#FirewallPolicyRuleSpec: {
	forProvider: #FirewallPolicyRuleParameters @go(ForProvider)
}

// FirewallPolicyRuleStatus defines the observed state of FirewallPolicyRule.
#FirewallPolicyRuleStatus: {
	atProvider?: #FirewallPolicyRuleObservation @go(AtProvider)
}

// FirewallPolicyRule is the Schema for the FirewallPolicyRules API. Specific rules to add to a hierarchical firewall policy
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#FirewallPolicyRule: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.action)",message="action is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.direction)",message="direction is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.match)",message="match is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.priority)",message="priority is a required parameter"
	spec:    #FirewallPolicyRuleSpec   @go(Spec)
	status?: #FirewallPolicyRuleStatus @go(Status)
}

// FirewallPolicyRuleList contains a list of FirewallPolicyRules
#FirewallPolicyRuleList: {
	items: [...#FirewallPolicyRule] @go(Items,[]FirewallPolicyRule)
}