// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/network/v1beta1

package v1beta1

#PrivateDNSARecordInitParameters: {
	// List of IPv4 Addresses.
	records?: [...null | string] @go(Records,[]*string)

	// The Time To Live (TTL) of the DNS record in seconds.
	ttl?: null | float64 @go(TTL,*float64)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#PrivateDNSARecordObservation: {
	// The FQDN of the DNS A Record.
	fqdn?: null | string @go(Fqdn,*string)

	// The Private DNS A Record ID.
	id?: null | string @go(ID,*string)

	// List of IPv4 Addresses.
	records?: [...null | string] @go(Records,[]*string)

	// Specifies the resource group where the Private DNS Zone exists. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The Time To Live (TTL) of the DNS record in seconds.
	ttl?: null | float64 @go(TTL,*float64)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the Private DNS Zone where the resource exists. Changing this forces a new resource to be created.
	zoneName?: null | string @go(ZoneName,*string)
}

#PrivateDNSARecordParameters: {
	// List of IPv4 Addresses.
	// +kubebuilder:validation:Optional
	records?: [...null | string] @go(Records,[]*string)

	// Specifies the resource group where the Private DNS Zone exists. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// The Time To Live (TTL) of the DNS record in seconds.
	// +kubebuilder:validation:Optional
	ttl?: null | float64 @go(TTL,*float64)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the Private DNS Zone where the resource exists. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=PrivateDNSZone
	// +kubebuilder:validation:Optional
	zoneName?: null | string @go(ZoneName,*string)
}

// PrivateDNSARecordSpec defines the desired state of PrivateDNSARecord
#PrivateDNSARecordSpec: {
	forProvider: #PrivateDNSARecordParameters @go(ForProvider)

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
	initProvider?: #PrivateDNSARecordInitParameters @go(InitProvider)
}

// PrivateDNSARecordStatus defines the observed state of PrivateDNSARecord.
#PrivateDNSARecordStatus: {
	atProvider?: #PrivateDNSARecordObservation @go(AtProvider)
}

// PrivateDNSARecord is the Schema for the PrivateDNSARecords API. Manages a Private DNS A Record.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#PrivateDNSARecord: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.records) || (has(self.initProvider) && has(self.initProvider.records))",message="spec.forProvider.records is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.ttl) || (has(self.initProvider) && has(self.initProvider.ttl))",message="spec.forProvider.ttl is a required parameter"
	spec:    #PrivateDNSARecordSpec   @go(Spec)
	status?: #PrivateDNSARecordStatus @go(Status)
}

// PrivateDNSARecordList contains a list of PrivateDNSARecords
#PrivateDNSARecordList: {
	items: [...#PrivateDNSARecord] @go(Items,[]PrivateDNSARecord)
}