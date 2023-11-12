// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/route53resolver/v1alpha1

package v1alpha1

// ResolverRuleParameters defines the desired state of ResolverRule
#ResolverRuleParameters: {
	// Region is which region the ResolverRule will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// DNS queries for this domain name are forwarded to the IP addresses that you
	// specify in TargetIps. If a query matches multiple Resolver rules (example.com
	// and www.example.com), outbound DNS queries are routed using the Resolver
	// rule that contains the most specific domain name (www.example.com).
	// +kubebuilder:validation:Required
	domainName?: null | string @go(DomainName,*string)

	// A friendly name that lets you easily find a rule in the Resolver dashboard
	// in the Route 53 console.
	name?: null | string @go(Name,*string)

	// The ID of the outbound Resolver endpoint that you want to use to route DNS
	// queries to the IP addresses that you specify in TargetIps.
	resolverEndpointID?: null | string @go(ResolverEndpointID,*string)

	// When you want to forward DNS queries for specified domain name to resolvers
	// on your network, specify FORWARD.
	//
	// When you have a forwarding rule to forward DNS queries for a domain to your
	// network and you want Resolver to process queries for a subdomain of that
	// domain, specify SYSTEM.
	//
	// For example, to forward DNS queries for example.com to resolvers on your
	// network, you create a rule and specify FORWARD for RuleType. To then have
	// Resolver process queries for apex.example.com, you create a rule and specify
	// SYSTEM for RuleType.
	//
	// Currently, only Resolver can create rules that have a value of RECURSIVE
	// for RuleType.
	// +kubebuilder:validation:Required
	ruleType?: null | string @go(RuleType,*string)

	// A list of the tag keys and values that you want to associate with the endpoint.
	tags?: [...null | #Tag] @go(Tags,[]*Tag)

	// The IPs that you want Resolver to forward DNS queries to. You can specify
	// only IPv4 addresses. Separate IP addresses with a space.
	//
	// TargetIps is available only when the value of Rule type is FORWARD.
	targetIPs?: [...null | #TargetAddress] @go(TargetIPs,[]*TargetAddress)
}

// ResolverRuleSpec defines the desired state of ResolverRule
#ResolverRuleSpec: {
	forProvider: #ResolverRuleParameters @go(ForProvider)
}

// ResolverRuleObservation defines the observed state of ResolverRule
#ResolverRuleObservation: {
	// The ARN (Amazon Resource Name) for the Resolver rule specified by Id.
	arn?: null | string @go(ARN,*string)

	// The date and time that the Resolver rule was created, in Unix time format
	// and Coordinated Universal Time (UTC).
	creationTime?: null | string @go(CreationTime,*string)

	// A unique string that you specified when you created the Resolver rule. CreatorRequestId
	// identifies the request and allows failed requests to be retried without the
	// risk of running the operation twice.
	creatorRequestID?: null | string @go(CreatorRequestID,*string)

	// The ID that Resolver assigned to the Resolver rule when you created it.
	id?: null | string @go(ID,*string)

	// The date and time that the Resolver rule was last updated, in Unix time format
	// and Coordinated Universal Time (UTC).
	modificationTime?: null | string @go(ModificationTime,*string)

	// When a rule is shared with another Amazon Web Services account, the account
	// ID of the account that the rule is shared with.
	ownerID?: null | string @go(OwnerID,*string)

	// Whether the rule is shared and, if so, whether the current account is sharing
	// the rule with another account, or another account is sharing the rule with
	// the current account.
	shareStatus?: null | string @go(ShareStatus,*string)

	// A code that specifies the current status of the Resolver rule.
	status?: null | string @go(Status,*string)

	// A detailed description of the status of a Resolver rule.
	statusMessage?: null | string @go(StatusMessage,*string)
}

// ResolverRuleStatus defines the observed state of ResolverRule.
#ResolverRuleStatus: {
	atProvider?: #ResolverRuleObservation @go(AtProvider)
}

// ResolverRule is the Schema for the ResolverRules API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ResolverRule: {
	spec:    #ResolverRuleSpec   @go(Spec)
	status?: #ResolverRuleStatus @go(Status)
}

// ResolverRuleList contains a list of ResolverRules
#ResolverRuleList: {
	items: [...#ResolverRule] @go(Items,[]ResolverRule)
}