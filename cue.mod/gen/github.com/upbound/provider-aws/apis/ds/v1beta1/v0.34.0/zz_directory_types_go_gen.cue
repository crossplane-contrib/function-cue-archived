// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ds/v1beta1

package v1beta1

#ConnectSettingsObservation: {
	availabilityZones?: [...null | string] @go(AvailabilityZones,[]*string)

	// The IP addresses of the AD Connector servers.
	connectIps?: [...null | string] @go(ConnectIps,[]*string)

	// The DNS IP addresses of the domain to connect to.
	customerDnsIps?: [...null | string] @go(CustomerDNSIps,[]*string)

	// The username corresponding to the password provided.
	customerUsername?: null | string @go(CustomerUsername,*string)

	// The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs).
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// The identifier of the VPC that the directory is in.
	vpcId?: null | string @go(VPCID,*string)
}

#ConnectSettingsParameters: {
	// The DNS IP addresses of the domain to connect to.
	// +kubebuilder:validation:Required
	customerDnsIps: [...null | string] @go(CustomerDNSIps,[]*string)

	// The username corresponding to the password provided.
	// +kubebuilder:validation:Required
	customerUsername?: null | string @go(CustomerUsername,*string)

	// The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs).
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.Subnet
	// +kubebuilder:validation:Optional
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// The identifier of the VPC that the directory is in.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.VPC
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	vpcId?: null | string @go(VPCID,*string)
}

#DirectoryObservation: {
	// The access URL for the directory, such as http://alias.awsapps.com.
	accessUrl?: null | string @go(AccessURL,*string)

	// The alias for the directory (must be unique amongst all aliases in AWS). Required for enable_sso.
	alias?: null | string @go(Alias,*string)

	// Connector related information about the directory. Fields documented below.
	connectSettings?: [...#ConnectSettingsObservation] @go(ConnectSettings,[]ConnectSettingsObservation)

	// A list of IP addresses of the DNS servers for the directory or connector.
	dnsIpAddresses?: [...null | string] @go(DNSIPAddresses,[]*string)

	// A textual description for the directory.
	description?: null | string @go(Description,*string)

	// The number of domain controllers desired in the directory. Minimum value of 2. Scaling of domain controllers is only supported for MicrosoftAD directories.
	desiredNumberOfDomainControllers?: null | float64 @go(DesiredNumberOfDomainControllers,*float64)

	// The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise.
	edition?: null | string @go(Edition,*string)

	// Whether to enable single-sign on for the directory. Requires alias. Defaults to false.
	enableSso?: null | bool @go(EnableSso,*bool)

	// The directory identifier.
	id?: null | string @go(ID,*string)

	// The fully qualified name for the directory, such as corp.example.com
	name?: null | string @go(Name,*string)

	// The ID of the security group created by the directory.
	securityGroupId?: null | string @go(SecurityGroupID,*string)

	// The short name of the directory, such as CORP.
	shortName?: null | string @go(ShortName,*string)

	// (For SimpleAD and ADConnector types) The size of the directory (Small or Large are accepted values). Large by default.
	size?: null | string @go(Size,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The directory type (SimpleAD, ADConnector or MicrosoftAD are accepted values). Defaults to SimpleAD.
	type?: null | string @go(Type,*string)

	// VPC related information about the directory. Fields documented below.
	vpcSettings?: [...#VPCSettingsObservation] @go(VPCSettings,[]VPCSettingsObservation)
}

#DirectoryParameters: {
	// The alias for the directory (must be unique amongst all aliases in AWS). Required for enable_sso.
	// +kubebuilder:validation:Optional
	alias?: null | string @go(Alias,*string)

	// Connector related information about the directory. Fields documented below.
	// +kubebuilder:validation:Optional
	connectSettings?: [...#ConnectSettingsParameters] @go(ConnectSettings,[]ConnectSettingsParameters)

	// A textual description for the directory.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The number of domain controllers desired in the directory. Minimum value of 2. Scaling of domain controllers is only supported for MicrosoftAD directories.
	// +kubebuilder:validation:Optional
	desiredNumberOfDomainControllers?: null | float64 @go(DesiredNumberOfDomainControllers,*float64)

	// The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise.
	// +kubebuilder:validation:Optional
	edition?: null | string @go(Edition,*string)

	// Whether to enable single-sign on for the directory. Requires alias. Defaults to false.
	// +kubebuilder:validation:Optional
	enableSso?: null | bool @go(EnableSso,*bool)

	// The fully qualified name for the directory, such as corp.example.com
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The short name of the directory, such as CORP.
	// +kubebuilder:validation:Optional
	shortName?: null | string @go(ShortName,*string)

	// (For SimpleAD and ADConnector types) The size of the directory (Small or Large are accepted values). Large by default.
	// +kubebuilder:validation:Optional
	size?: null | string @go(Size,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// The directory type (SimpleAD, ADConnector or MicrosoftAD are accepted values). Defaults to SimpleAD.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)

	// VPC related information about the directory. Fields documented below.
	// +kubebuilder:validation:Optional
	vpcSettings?: [...#VPCSettingsParameters] @go(VPCSettings,[]VPCSettingsParameters)
}

#VPCSettingsObservation: {
	availabilityZones?: [...null | string] @go(AvailabilityZones,[]*string)

	// The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs).
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// The identifier of the VPC that the directory is in.
	vpcId?: null | string @go(VPCID,*string)
}

#VPCSettingsParameters: {
	// The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs).
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.Subnet
	// +kubebuilder:validation:Optional
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// The identifier of the VPC that the directory is in.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.VPC
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	vpcId?: null | string @go(VPCID,*string)
}

// DirectorySpec defines the desired state of Directory
#DirectorySpec: {
	forProvider: #DirectoryParameters @go(ForProvider)
}

// DirectoryStatus defines the observed state of Directory.
#DirectoryStatus: {
	atProvider?: #DirectoryObservation @go(AtProvider)
}

// Directory is the Schema for the Directorys API. Provides a directory in AWS Directory Service.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Directory: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.name)",message="name is a required parameter"
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.passwordSecretRef)",message="passwordSecretRef is a required parameter"
	spec:    #DirectorySpec   @go(Spec)
	status?: #DirectoryStatus @go(Status)
}

// DirectoryList contains a list of Directorys
#DirectoryList: {
	items: [...#Directory] @go(Items,[]Directory)
}