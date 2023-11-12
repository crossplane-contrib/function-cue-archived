// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/filestore/v1beta1

package v1beta1

#FileSharesInitParameters: {
	// File share capacity in GiB. This must be at least 1024 GiB
	// for the standard tier, or 2560 GiB for the premium tier.
	capacityGb?: null | float64 @go(CapacityGb,*float64)

	// Nfs Export Options. There is a limit of 10 export options per file share.
	// Structure is documented below.
	nfsExportOptions?: [...#NFSExportOptionsInitParameters] @go(NFSExportOptions,[]NFSExportOptionsInitParameters)

	// The name of the fileshare (16 characters or less)
	name?: null | string @go(Name,*string)
}

#FileSharesObservation: {
	// File share capacity in GiB. This must be at least 1024 GiB
	// for the standard tier, or 2560 GiB for the premium tier.
	capacityGb?: null | float64 @go(CapacityGb,*float64)

	// Nfs Export Options. There is a limit of 10 export options per file share.
	// Structure is documented below.
	nfsExportOptions?: [...#NFSExportOptionsObservation] @go(NFSExportOptions,[]NFSExportOptionsObservation)

	// The name of the fileshare (16 characters or less)
	name?: null | string @go(Name,*string)

	// (Output)
	// The resource name of the backup, in the format
	// projects/{projectId}/locations/{locationId}/backups/{backupId},
	// that this file share has been restored from.
	sourceBackup?: null | string @go(SourceBackup,*string)
}

#FileSharesParameters: {
	// File share capacity in GiB. This must be at least 1024 GiB
	// for the standard tier, or 2560 GiB for the premium tier.
	// +kubebuilder:validation:Optional
	capacityGb?: null | float64 @go(CapacityGb,*float64)

	// Nfs Export Options. There is a limit of 10 export options per file share.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	nfsExportOptions?: [...#NFSExportOptionsParameters] @go(NFSExportOptions,[]NFSExportOptionsParameters)

	// The name of the fileshare (16 characters or less)
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)
}

#InstanceInitParameters: {
	// A description of the instance.
	description?: null | string @go(Description,*string)

	// File system shares on the instance. For this version, only a
	// single file share is supported.
	// Structure is documented below.
	fileShares?: [...#FileSharesInitParameters] @go(FileShares,[]FileSharesInitParameters)

	// Resource labels to represent user-provided metadata.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// VPC networks to which the instance is connected. For this version,
	// only a single network is supported.
	// Structure is documented below.
	networks?: [...#NetworksInitParameters] @go(Networks,[]NetworksInitParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The service tier of the instance.
	// Possible values include: STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD, HIGH_SCALE_SSD and ENTERPRISE
	tier?: null | string @go(Tier,*string)

	// The name of the Filestore zone of the instance.
	zone?: null | string @go(Zone,*string)
}

#InstanceObservation: {
	// Creation timestamp in RFC3339 text format.
	createTime?: null | string @go(CreateTime,*string)

	// A description of the instance.
	description?: null | string @go(Description,*string)

	// Server-specified ETag for the instance resource to prevent
	// simultaneous updates from overwriting each other.
	etag?: null | string @go(Etag,*string)

	// File system shares on the instance. For this version, only a
	// single file share is supported.
	// Structure is documented below.
	fileShares?: [...#FileSharesObservation] @go(FileShares,[]FileSharesObservation)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/instances/{{name}}
	id?: null | string @go(ID,*string)

	// KMS key name used for data encryption.
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// Resource labels to represent user-provided metadata.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the location of the instance. This can be a region for ENTERPRISE tier instances.
	location?: null | string @go(Location,*string)

	// VPC networks to which the instance is connected. For this version,
	// only a single network is supported.
	// Structure is documented below.
	networks?: [...#NetworksObservation] @go(Networks,[]NetworksObservation)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The service tier of the instance.
	// Possible values include: STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD, HIGH_SCALE_SSD and ENTERPRISE
	tier?: null | string @go(Tier,*string)

	// The name of the Filestore zone of the instance.
	zone?: null | string @go(Zone,*string)
}

#InstanceParameters: {
	// A description of the instance.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// File system shares on the instance. For this version, only a
	// single file share is supported.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	fileShares?: [...#FileSharesParameters] @go(FileShares,[]FileSharesParameters)

	// KMS key name used for data encryption.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/kms/v1beta1.CryptoKey
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// Resource labels to represent user-provided metadata.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the location of the instance. This can be a region for ENTERPRISE tier instances.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// VPC networks to which the instance is connected. For this version,
	// only a single network is supported.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	networks?: [...#NetworksParameters] @go(Networks,[]NetworksParameters)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The service tier of the instance.
	// Possible values include: STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD, HIGH_SCALE_SSD and ENTERPRISE
	// +kubebuilder:validation:Optional
	tier?: null | string @go(Tier,*string)

	// The name of the Filestore zone of the instance.
	// +kubebuilder:validation:Optional
	zone?: null | string @go(Zone,*string)
}

#NFSExportOptionsInitParameters: {
	// Either READ_ONLY, for allowing only read requests on the exported directory,
	// or READ_WRITE, for allowing both read and write requests. The default is READ_WRITE.
	// Default value is READ_WRITE.
	// Possible values are: READ_ONLY, READ_WRITE.
	accessMode?: null | string @go(AccessMode,*string)

	// An integer representing the anonymous group id with a default value of 65534.
	// Anon_gid may only be set with squashMode of ROOT_SQUASH. An error will be returned
	// if this field is specified for other squashMode settings.
	anonGid?: null | float64 @go(AnonGID,*float64)

	// An integer representing the anonymous user id with a default value of 65534.
	// Anon_uid may only be set with squashMode of ROOT_SQUASH. An error will be returned
	// if this field is specified for other squashMode settings.
	anonUid?: null | float64 @go(AnonUID,*float64)

	// List of either IPv4 addresses, or ranges in CIDR notation which may mount the file share.
	// Overlapping IP ranges are not allowed, both within and across NfsExportOptions. An error will be returned.
	// The limit is 64 IP ranges/addresses for each FileShareConfig among all NfsExportOptions.
	ipRanges?: [...null | string] @go(IPRanges,[]*string)

	// Either NO_ROOT_SQUASH, for allowing root access on the exported directory, or ROOT_SQUASH,
	// for not allowing root access. The default is NO_ROOT_SQUASH.
	// Default value is NO_ROOT_SQUASH.
	// Possible values are: NO_ROOT_SQUASH, ROOT_SQUASH.
	squashMode?: null | string @go(SquashMode,*string)
}

#NFSExportOptionsObservation: {
	// Either READ_ONLY, for allowing only read requests on the exported directory,
	// or READ_WRITE, for allowing both read and write requests. The default is READ_WRITE.
	// Default value is READ_WRITE.
	// Possible values are: READ_ONLY, READ_WRITE.
	accessMode?: null | string @go(AccessMode,*string)

	// An integer representing the anonymous group id with a default value of 65534.
	// Anon_gid may only be set with squashMode of ROOT_SQUASH. An error will be returned
	// if this field is specified for other squashMode settings.
	anonGid?: null | float64 @go(AnonGID,*float64)

	// An integer representing the anonymous user id with a default value of 65534.
	// Anon_uid may only be set with squashMode of ROOT_SQUASH. An error will be returned
	// if this field is specified for other squashMode settings.
	anonUid?: null | float64 @go(AnonUID,*float64)

	// List of either IPv4 addresses, or ranges in CIDR notation which may mount the file share.
	// Overlapping IP ranges are not allowed, both within and across NfsExportOptions. An error will be returned.
	// The limit is 64 IP ranges/addresses for each FileShareConfig among all NfsExportOptions.
	ipRanges?: [...null | string] @go(IPRanges,[]*string)

	// Either NO_ROOT_SQUASH, for allowing root access on the exported directory, or ROOT_SQUASH,
	// for not allowing root access. The default is NO_ROOT_SQUASH.
	// Default value is NO_ROOT_SQUASH.
	// Possible values are: NO_ROOT_SQUASH, ROOT_SQUASH.
	squashMode?: null | string @go(SquashMode,*string)
}

#NFSExportOptionsParameters: {
	// Either READ_ONLY, for allowing only read requests on the exported directory,
	// or READ_WRITE, for allowing both read and write requests. The default is READ_WRITE.
	// Default value is READ_WRITE.
	// Possible values are: READ_ONLY, READ_WRITE.
	// +kubebuilder:validation:Optional
	accessMode?: null | string @go(AccessMode,*string)

	// An integer representing the anonymous group id with a default value of 65534.
	// Anon_gid may only be set with squashMode of ROOT_SQUASH. An error will be returned
	// if this field is specified for other squashMode settings.
	// +kubebuilder:validation:Optional
	anonGid?: null | float64 @go(AnonGID,*float64)

	// An integer representing the anonymous user id with a default value of 65534.
	// Anon_uid may only be set with squashMode of ROOT_SQUASH. An error will be returned
	// if this field is specified for other squashMode settings.
	// +kubebuilder:validation:Optional
	anonUid?: null | float64 @go(AnonUID,*float64)

	// List of either IPv4 addresses, or ranges in CIDR notation which may mount the file share.
	// Overlapping IP ranges are not allowed, both within and across NfsExportOptions. An error will be returned.
	// The limit is 64 IP ranges/addresses for each FileShareConfig among all NfsExportOptions.
	// +kubebuilder:validation:Optional
	ipRanges?: [...null | string] @go(IPRanges,[]*string)

	// Either NO_ROOT_SQUASH, for allowing root access on the exported directory, or ROOT_SQUASH,
	// for not allowing root access. The default is NO_ROOT_SQUASH.
	// Default value is NO_ROOT_SQUASH.
	// Possible values are: NO_ROOT_SQUASH, ROOT_SQUASH.
	// +kubebuilder:validation:Optional
	squashMode?: null | string @go(SquashMode,*string)
}

#NetworksInitParameters: {
	// The network connect mode of the Filestore instance.
	// If not provided, the connect mode defaults to
	// DIRECT_PEERING.
	// Default value is DIRECT_PEERING.
	// Possible values are: DIRECT_PEERING, PRIVATE_SERVICE_ACCESS.
	connectMode?: null | string @go(ConnectMode,*string)

	// IP versions for which the instance has
	// IP addresses assigned.
	// Each value may be one of: ADDRESS_MODE_UNSPECIFIED, MODE_IPV4, MODE_IPV6.
	modes?: [...null | string] @go(Modes,[]*string)

	// The name of the GCE VPC network to which the
	// instance is connected.
	network?: null | string @go(Network,*string)

	// A /29 CIDR block that identifies the range of IP
	// addresses reserved for this instance.
	reservedIpRange?: null | string @go(ReservedIPRange,*string)
}

#NetworksObservation: {
	// The network connect mode of the Filestore instance.
	// If not provided, the connect mode defaults to
	// DIRECT_PEERING.
	// Default value is DIRECT_PEERING.
	// Possible values are: DIRECT_PEERING, PRIVATE_SERVICE_ACCESS.
	connectMode?: null | string @go(ConnectMode,*string)

	// (Output)
	// A list of IPv4 or IPv6 addresses.
	ipAddresses?: [...null | string] @go(IPAddresses,[]*string)

	// IP versions for which the instance has
	// IP addresses assigned.
	// Each value may be one of: ADDRESS_MODE_UNSPECIFIED, MODE_IPV4, MODE_IPV6.
	modes?: [...null | string] @go(Modes,[]*string)

	// The name of the GCE VPC network to which the
	// instance is connected.
	network?: null | string @go(Network,*string)

	// A /29 CIDR block that identifies the range of IP
	// addresses reserved for this instance.
	reservedIpRange?: null | string @go(ReservedIPRange,*string)
}

#NetworksParameters: {
	// The network connect mode of the Filestore instance.
	// If not provided, the connect mode defaults to
	// DIRECT_PEERING.
	// Default value is DIRECT_PEERING.
	// Possible values are: DIRECT_PEERING, PRIVATE_SERVICE_ACCESS.
	// +kubebuilder:validation:Optional
	connectMode?: null | string @go(ConnectMode,*string)

	// IP versions for which the instance has
	// IP addresses assigned.
	// Each value may be one of: ADDRESS_MODE_UNSPECIFIED, MODE_IPV4, MODE_IPV6.
	// +kubebuilder:validation:Optional
	modes?: [...null | string] @go(Modes,[]*string)

	// The name of the GCE VPC network to which the
	// instance is connected.
	// +kubebuilder:validation:Optional
	network?: null | string @go(Network,*string)

	// A /29 CIDR block that identifies the range of IP
	// addresses reserved for this instance.
	// +kubebuilder:validation:Optional
	reservedIpRange?: null | string @go(ReservedIPRange,*string)
}

// InstanceSpec defines the desired state of Instance
#InstanceSpec: {
	forProvider: #InstanceParameters @go(ForProvider)

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
	initProvider?: #InstanceInitParameters @go(InitProvider)
}

// InstanceStatus defines the observed state of Instance.
#InstanceStatus: {
	atProvider?: #InstanceObservation @go(AtProvider)
}

// Instance is the Schema for the Instances API. A Google Cloud Filestore instance.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Instance: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.fileShares) || has(self.initProvider.fileShares)",message="fileShares is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.networks) || has(self.initProvider.networks)",message="networks is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.tier) || has(self.initProvider.tier)",message="tier is a required parameter"
	spec:    #InstanceSpec   @go(Spec)
	status?: #InstanceStatus @go(Status)
}

// InstanceList contains a list of Instances
#InstanceList: {
	items: [...#Instance] @go(Items,[]Instance)
}