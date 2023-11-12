// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/dns/v1beta1

package v1beta1

#CloudLoggingConfigInitParameters: {
	// If set, enable query logging for this ManagedZone. False by default, making logging opt-in.
	enableLogging?: null | bool @go(EnableLogging,*bool)
}

#CloudLoggingConfigObservation: {
	// If set, enable query logging for this ManagedZone. False by default, making logging opt-in.
	enableLogging?: null | bool @go(EnableLogging,*bool)
}

#CloudLoggingConfigParameters: {
	// If set, enable query logging for this ManagedZone. False by default, making logging opt-in.
	// +kubebuilder:validation:Optional
	enableLogging?: null | bool @go(EnableLogging,*bool)
}

#DNSSECConfigInitParameters: {
	// Specifies parameters that will be used for generating initial DnsKeys
	// for this ManagedZone. If you provide a spec for keySigning or zoneSigning,
	// you must also provide one for the other.
	// default_key_specs can only be updated when the state is off.
	// Structure is documented below.
	defaultKeySpecs?: [...#DefaultKeySpecsInitParameters] @go(DefaultKeySpecs,[]DefaultKeySpecsInitParameters)

	// Identifies what kind of resource this is
	kind?: null | string @go(Kind,*string)

	// Specifies the mechanism used to provide authenticated denial-of-existence responses.
	// non_existence can only be updated when the state is off.
	// Possible values are: nsec, nsec3.
	nonExistence?: null | string @go(NonExistence,*string)

	// Specifies whether DNSSEC is enabled, and what mode it is in
	// Possible values are: off, on, transfer.
	state?: null | string @go(State,*string)
}

#DNSSECConfigObservation: {
	// Specifies parameters that will be used for generating initial DnsKeys
	// for this ManagedZone. If you provide a spec for keySigning or zoneSigning,
	// you must also provide one for the other.
	// default_key_specs can only be updated when the state is off.
	// Structure is documented below.
	defaultKeySpecs?: [...#DefaultKeySpecsObservation] @go(DefaultKeySpecs,[]DefaultKeySpecsObservation)

	// Identifies what kind of resource this is
	kind?: null | string @go(Kind,*string)

	// Specifies the mechanism used to provide authenticated denial-of-existence responses.
	// non_existence can only be updated when the state is off.
	// Possible values are: nsec, nsec3.
	nonExistence?: null | string @go(NonExistence,*string)

	// Specifies whether DNSSEC is enabled, and what mode it is in
	// Possible values are: off, on, transfer.
	state?: null | string @go(State,*string)
}

#DNSSECConfigParameters: {
	// Specifies parameters that will be used for generating initial DnsKeys
	// for this ManagedZone. If you provide a spec for keySigning or zoneSigning,
	// you must also provide one for the other.
	// default_key_specs can only be updated when the state is off.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	defaultKeySpecs?: [...#DefaultKeySpecsParameters] @go(DefaultKeySpecs,[]DefaultKeySpecsParameters)

	// Identifies what kind of resource this is
	// +kubebuilder:validation:Optional
	kind?: null | string @go(Kind,*string)

	// Specifies the mechanism used to provide authenticated denial-of-existence responses.
	// non_existence can only be updated when the state is off.
	// Possible values are: nsec, nsec3.
	// +kubebuilder:validation:Optional
	nonExistence?: null | string @go(NonExistence,*string)

	// Specifies whether DNSSEC is enabled, and what mode it is in
	// Possible values are: off, on, transfer.
	// +kubebuilder:validation:Optional
	state?: null | string @go(State,*string)
}

#DefaultKeySpecsInitParameters: {
	// String mnemonic specifying the DNSSEC algorithm of this key
	// Possible values are: ecdsap256sha256, ecdsap384sha384, rsasha1, rsasha256, rsasha512.
	algorithm?: null | string @go(Algorithm,*string)

	// Length of the keys in bits
	keyLength?: null | float64 @go(KeyLength,*float64)

	// Specifies whether this is a key signing key (KSK) or a zone
	// signing key (ZSK). Key signing keys have the Secure Entry
	// Point flag set and, when active, will only be used to sign
	// resource record sets of type DNSKEY. Zone signing keys do
	// not have the Secure Entry Point flag set and will be used
	// to sign all other types of resource record sets.
	// Possible values are: keySigning, zoneSigning.
	keyType?: null | string @go(KeyType,*string)

	// Identifies what kind of resource this is
	kind?: null | string @go(Kind,*string)
}

#DefaultKeySpecsObservation: {
	// String mnemonic specifying the DNSSEC algorithm of this key
	// Possible values are: ecdsap256sha256, ecdsap384sha384, rsasha1, rsasha256, rsasha512.
	algorithm?: null | string @go(Algorithm,*string)

	// Length of the keys in bits
	keyLength?: null | float64 @go(KeyLength,*float64)

	// Specifies whether this is a key signing key (KSK) or a zone
	// signing key (ZSK). Key signing keys have the Secure Entry
	// Point flag set and, when active, will only be used to sign
	// resource record sets of type DNSKEY. Zone signing keys do
	// not have the Secure Entry Point flag set and will be used
	// to sign all other types of resource record sets.
	// Possible values are: keySigning, zoneSigning.
	keyType?: null | string @go(KeyType,*string)

	// Identifies what kind of resource this is
	kind?: null | string @go(Kind,*string)
}

#DefaultKeySpecsParameters: {
	// String mnemonic specifying the DNSSEC algorithm of this key
	// Possible values are: ecdsap256sha256, ecdsap384sha384, rsasha1, rsasha256, rsasha512.
	// +kubebuilder:validation:Optional
	algorithm?: null | string @go(Algorithm,*string)

	// Length of the keys in bits
	// +kubebuilder:validation:Optional
	keyLength?: null | float64 @go(KeyLength,*float64)

	// Specifies whether this is a key signing key (KSK) or a zone
	// signing key (ZSK). Key signing keys have the Secure Entry
	// Point flag set and, when active, will only be used to sign
	// resource record sets of type DNSKEY. Zone signing keys do
	// not have the Secure Entry Point flag set and will be used
	// to sign all other types of resource record sets.
	// Possible values are: keySigning, zoneSigning.
	// +kubebuilder:validation:Optional
	keyType?: null | string @go(KeyType,*string)

	// Identifies what kind of resource this is
	// +kubebuilder:validation:Optional
	kind?: null | string @go(Kind,*string)
}

#ForwardingConfigInitParameters: {
	// List of target name servers to forward to. Cloud DNS will
	// select the best available name server if more than
	// one target is given.
	// Structure is documented below.
	targetNameServers?: [...#TargetNameServersInitParameters] @go(TargetNameServers,[]TargetNameServersInitParameters)
}

#ForwardingConfigObservation: {
	// List of target name servers to forward to. Cloud DNS will
	// select the best available name server if more than
	// one target is given.
	// Structure is documented below.
	targetNameServers?: [...#TargetNameServersObservation] @go(TargetNameServers,[]TargetNameServersObservation)
}

#ForwardingConfigParameters: {
	// List of target name servers to forward to. Cloud DNS will
	// select the best available name server if more than
	// one target is given.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	targetNameServers: [...#TargetNameServersParameters] @go(TargetNameServers,[]TargetNameServersParameters)
}

#GkeClustersInitParameters: {
}

#GkeClustersObservation: {
	// The resource name of the cluster to bind this ManagedZone to.
	// This should be specified in the format like
	// projects/*/locations/*/clusters/*
	gkeClusterName?: null | string @go(GkeClusterName,*string)
}

#GkeClustersParameters: {
	// The resource name of the cluster to bind this ManagedZone to.
	// This should be specified in the format like
	// projects/*/locations/*/clusters/*
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/container/v1beta1.Cluster
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	gkeClusterName?: null | string @go(GkeClusterName,*string)
}

#ManagedZoneInitParameters: {
	// Cloud logging configuration
	// Structure is documented below.
	cloudLoggingConfig?: [...#CloudLoggingConfigInitParameters] @go(CloudLoggingConfig,[]CloudLoggingConfigInitParameters)

	// The DNS name of this managed zone, for instance "example.com.".
	dnsName?: null | string @go(DNSName,*string)

	// DNSSEC configuration
	// Structure is documented below.
	dnssecConfig?: [...#DNSSECConfigInitParameters] @go(DNSSECConfig,[]DNSSECConfigInitParameters)

	// A textual description field.
	description?: null | string @go(Description,*string)

	// Set this true to delete all records in the zone.
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// The presence for this field indicates that outbound forwarding is enabled
	// for this zone. The value of this field contains the set of destinations
	// to forward to.
	// Structure is documented below.
	forwardingConfig?: [...#ForwardingConfigInitParameters] @go(ForwardingConfig,[]ForwardingConfigInitParameters)

	// A set of key/value label pairs to assign to this ManagedZone.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The presence of this field indicates that DNS Peering is enabled for this
	// zone. The value of this field contains the network to peer with.
	// Structure is documented below.
	peeringConfig?: [...#PeeringConfigInitParameters] @go(PeeringConfig,[]PeeringConfigInitParameters)

	// For privately visible zones, the set of Virtual Private Cloud
	// resources that the zone is visible from.
	// Structure is documented below.
	privateVisibilityConfig?: [...#PrivateVisibilityConfigInitParameters] @go(PrivateVisibilityConfig,[]PrivateVisibilityConfigInitParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The zone's visibility: public zones are exposed to the Internet,
	// while private zones are visible only to Virtual Private Cloud resources.
	// Default value is public.
	// Possible values are: private, public.
	visibility?: null | string @go(Visibility,*string)
}

#ManagedZoneObservation: {
	// Cloud logging configuration
	// Structure is documented below.
	cloudLoggingConfig?: [...#CloudLoggingConfigObservation] @go(CloudLoggingConfig,[]CloudLoggingConfigObservation)

	// The time that this resource was created on the server.
	// This is in RFC3339 text format.
	creationTime?: null | string @go(CreationTime,*string)

	// The DNS name of this managed zone, for instance "example.com.".
	dnsName?: null | string @go(DNSName,*string)

	// DNSSEC configuration
	// Structure is documented below.
	dnssecConfig?: [...#DNSSECConfigObservation] @go(DNSSECConfig,[]DNSSECConfigObservation)

	// A textual description field.
	description?: null | string @go(Description,*string)

	// Set this true to delete all records in the zone.
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// The presence for this field indicates that outbound forwarding is enabled
	// for this zone. The value of this field contains the set of destinations
	// to forward to.
	// Structure is documented below.
	forwardingConfig?: [...#ForwardingConfigObservation] @go(ForwardingConfig,[]ForwardingConfigObservation)

	// an identifier for the resource with format projects/{{project}}/managedZones/{{name}}
	id?: null | string @go(ID,*string)

	// A set of key/value label pairs to assign to this ManagedZone.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Unique identifier for the resource; defined by the server.
	managedZoneId?: null | float64 @go(ManagedZoneID,*float64)

	// Delegate your managed_zone to these virtual name servers;
	// defined by the server
	nameServers?: [...null | string] @go(NameServers,[]*string)

	// The presence of this field indicates that DNS Peering is enabled for this
	// zone. The value of this field contains the network to peer with.
	// Structure is documented below.
	peeringConfig?: [...#PeeringConfigObservation] @go(PeeringConfig,[]PeeringConfigObservation)

	// For privately visible zones, the set of Virtual Private Cloud
	// resources that the zone is visible from.
	// Structure is documented below.
	privateVisibilityConfig?: [...#PrivateVisibilityConfigObservation] @go(PrivateVisibilityConfig,[]PrivateVisibilityConfigObservation)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The zone's visibility: public zones are exposed to the Internet,
	// while private zones are visible only to Virtual Private Cloud resources.
	// Default value is public.
	// Possible values are: private, public.
	visibility?: null | string @go(Visibility,*string)
}

#ManagedZoneParameters: {
	// Cloud logging configuration
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	cloudLoggingConfig?: [...#CloudLoggingConfigParameters] @go(CloudLoggingConfig,[]CloudLoggingConfigParameters)

	// The DNS name of this managed zone, for instance "example.com.".
	// +kubebuilder:validation:Optional
	dnsName?: null | string @go(DNSName,*string)

	// DNSSEC configuration
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	dnssecConfig?: [...#DNSSECConfigParameters] @go(DNSSECConfig,[]DNSSECConfigParameters)

	// A textual description field.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Set this true to delete all records in the zone.
	// +kubebuilder:validation:Optional
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// The presence for this field indicates that outbound forwarding is enabled
	// for this zone. The value of this field contains the set of destinations
	// to forward to.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	forwardingConfig?: [...#ForwardingConfigParameters] @go(ForwardingConfig,[]ForwardingConfigParameters)

	// A set of key/value label pairs to assign to this ManagedZone.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The presence of this field indicates that DNS Peering is enabled for this
	// zone. The value of this field contains the network to peer with.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	peeringConfig?: [...#PeeringConfigParameters] @go(PeeringConfig,[]PeeringConfigParameters)

	// For privately visible zones, the set of Virtual Private Cloud
	// resources that the zone is visible from.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	privateVisibilityConfig?: [...#PrivateVisibilityConfigParameters] @go(PrivateVisibilityConfig,[]PrivateVisibilityConfigParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The zone's visibility: public zones are exposed to the Internet,
	// while private zones are visible only to Virtual Private Cloud resources.
	// Default value is public.
	// Possible values are: private, public.
	// +kubebuilder:validation:Optional
	visibility?: null | string @go(Visibility,*string)
}

#NetworksInitParameters: {
}

#NetworksObservation: {
	// The id or fully qualified URL of the VPC network to forward queries to.
	// This should be formatted like projects/{project}/global/networks/{network} or
	// https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}
	networkUrl?: null | string @go(NetworkURL,*string)
}

#NetworksParameters: {
	// The id or fully qualified URL of the VPC network to forward queries to.
	// This should be formatted like projects/{project}/global/networks/{network} or
	// https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Network
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.SelfLinkExtractor()
	// +kubebuilder:validation:Optional
	networkUrl?: null | string @go(NetworkURL,*string)
}

#PeeringConfigInitParameters: {
	// The network with which to peer.
	// Structure is documented below.
	targetNetwork?: [...#TargetNetworkInitParameters] @go(TargetNetwork,[]TargetNetworkInitParameters)
}

#PeeringConfigObservation: {
	// The network with which to peer.
	// Structure is documented below.
	targetNetwork?: [...#TargetNetworkObservation] @go(TargetNetwork,[]TargetNetworkObservation)
}

#PeeringConfigParameters: {
	// The network with which to peer.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	targetNetwork: [...#TargetNetworkParameters] @go(TargetNetwork,[]TargetNetworkParameters)
}

#PrivateVisibilityConfigInitParameters: {
	// The list of Google Kubernetes Engine clusters that can see this zone.
	// Structure is documented below.
	gkeClusters?: [...#GkeClustersInitParameters] @go(GkeClusters,[]GkeClustersInitParameters)

	// The list of VPC networks that can see this zone.12 SDK in a future release, you
	// may experience issues with this resource while updating. If you encounter this issue, remove all networks
	// blocks in an update and then apply another update adding all of them back simultaneously.
	// Structure is documented below.
	networks?: [...#NetworksInitParameters] @go(Networks,[]NetworksInitParameters)
}

#PrivateVisibilityConfigObservation: {
	// The list of Google Kubernetes Engine clusters that can see this zone.
	// Structure is documented below.
	gkeClusters?: [...#GkeClustersObservation] @go(GkeClusters,[]GkeClustersObservation)

	// The list of VPC networks that can see this zone.12 SDK in a future release, you
	// may experience issues with this resource while updating. If you encounter this issue, remove all networks
	// blocks in an update and then apply another update adding all of them back simultaneously.
	// Structure is documented below.
	networks?: [...#NetworksObservation] @go(Networks,[]NetworksObservation)
}

#PrivateVisibilityConfigParameters: {
	// The list of Google Kubernetes Engine clusters that can see this zone.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	gkeClusters?: [...#GkeClustersParameters] @go(GkeClusters,[]GkeClustersParameters)

	// The list of VPC networks that can see this zone.12 SDK in a future release, you
	// may experience issues with this resource while updating. If you encounter this issue, remove all networks
	// blocks in an update and then apply another update adding all of them back simultaneously.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	networks: [...#NetworksParameters] @go(Networks,[]NetworksParameters)
}

#TargetNameServersInitParameters: {
	// Forwarding path for this TargetNameServer. If unset or default Cloud DNS will make forwarding
	// decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go
	// to the Internet. When set to private, Cloud DNS will always send queries through VPC for this target
	// Possible values are: default, private.
	forwardingPath?: null | string @go(ForwardingPath,*string)

	// IPv4 address of a target name server.
	ipv4Address?: null | string @go(IPv4Address,*string)
}

#TargetNameServersObservation: {
	// Forwarding path for this TargetNameServer. If unset or default Cloud DNS will make forwarding
	// decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go
	// to the Internet. When set to private, Cloud DNS will always send queries through VPC for this target
	// Possible values are: default, private.
	forwardingPath?: null | string @go(ForwardingPath,*string)

	// IPv4 address of a target name server.
	ipv4Address?: null | string @go(IPv4Address,*string)
}

#TargetNameServersParameters: {
	// Forwarding path for this TargetNameServer. If unset or default Cloud DNS will make forwarding
	// decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go
	// to the Internet. When set to private, Cloud DNS will always send queries through VPC for this target
	// Possible values are: default, private.
	// +kubebuilder:validation:Optional
	forwardingPath?: null | string @go(ForwardingPath,*string)

	// IPv4 address of a target name server.
	// +kubebuilder:validation:Optional
	ipv4Address?: null | string @go(IPv4Address,*string)
}

#TargetNetworkInitParameters: {
}

#TargetNetworkObservation: {
	// The id or fully qualified URL of the VPC network to forward queries to.
	// This should be formatted like projects/{project}/global/networks/{network} or
	// https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}
	networkUrl?: null | string @go(NetworkURL,*string)
}

#TargetNetworkParameters: {
	// The id or fully qualified URL of the VPC network to forward queries to.
	// This should be formatted like projects/{project}/global/networks/{network} or
	// https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Network
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.SelfLinkExtractor()
	// +kubebuilder:validation:Optional
	networkUrl?: null | string @go(NetworkURL,*string)
}

// ManagedZoneSpec defines the desired state of ManagedZone
#ManagedZoneSpec: {
	forProvider: #ManagedZoneParameters @go(ForProvider)

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
	initProvider?: #ManagedZoneInitParameters @go(InitProvider)
}

// ManagedZoneStatus defines the observed state of ManagedZone.
#ManagedZoneStatus: {
	atProvider?: #ManagedZoneObservation @go(AtProvider)
}

// ManagedZone is the Schema for the ManagedZones API. A zone is a subtree of the DNS namespace under one administrative responsibility.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ManagedZone: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.dnsName) || has(self.initProvider.dnsName)",message="dnsName is a required parameter"
	spec:    #ManagedZoneSpec   @go(Spec)
	status?: #ManagedZoneStatus @go(Status)
}

// ManagedZoneList contains a list of ManagedZones
#ManagedZoneList: {
	items: [...#ManagedZone] @go(Items,[]ManagedZone)
}