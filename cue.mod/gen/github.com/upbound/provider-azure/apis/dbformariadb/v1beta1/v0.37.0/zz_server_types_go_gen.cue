// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/dbformariadb/v1beta1

package v1beta1

#ServerInitParameters: {
	// The Administrator login for the MariaDB Server. Changing this forces a new resource to be created.
	administratorLogin?: null | string @go(AdministratorLogin,*string)

	// Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true.
	autoGrowEnabled?: null | bool @go(AutoGrowEnabled,*bool)

	// Backup retention days for the server, supported values are between 7 and 35 days.
	backupRetentionDays?: null | float64 @go(BackupRetentionDays,*float64)

	// The creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default.
	createMode?: null | string @go(CreateMode,*string)

	// Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not supported for the Basic tier.
	geoRedundantBackupEnabled?: null | bool @go(GeoRedundantBackupEnabled,*bool)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Whether or not public network access is allowed for this server. Defaults to true.
	publicNetworkAccessEnabled?: null | bool @go(PublicNetworkAccessEnabled,*bool)

	// When create_mode is PointInTimeRestore, specifies the point in time to restore from creation_source_server_id. It should be provided in RFC3339 format, e.g. 2013-11-08T22:00:40Z.
	restorePointInTime?: null | string @go(RestorePointInTime,*string)

	// Specifies if SSL should be enforced on connections. Possible values are true and false.
	sslEnforcementEnabled?: null | bool @go(SSLEnforcementEnabled,*bool)

	// The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2.
	sslMinimalTlsVersionEnforced?: null | string @go(SSLMinimalTLSVersionEnforced,*string)

	// Specifies the SKU Name for this MariaDB Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8). For more information see the product documentation. Possible values are B_Gen5_1, B_Gen5_2, GP_Gen5_2, GP_Gen5_4, GP_Gen5_8, GP_Gen5_16, GP_Gen5_32, MO_Gen5_2, MO_Gen5_4, MO_Gen5_8 and MO_Gen5_16.
	skuName?: null | string @go(SkuName,*string)

	// Max storage allowed for a server. Possible values are between 5120 MB (5GB) and 1024000MB (1TB) for the Basic SKU and between 5120 MB (5GB) and 4096000 MB (4TB) for General Purpose/Memory Optimized SKUs. For more information see the product documentation.
	storageMb?: null | float64 @go(StorageMb,*float64)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3. Changing this forces a new resource to be created.
	version?: null | string @go(Version,*string)
}

#ServerObservation: {
	// The Administrator login for the MariaDB Server. Changing this forces a new resource to be created.
	administratorLogin?: null | string @go(AdministratorLogin,*string)

	// Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true.
	autoGrowEnabled?: null | bool @go(AutoGrowEnabled,*bool)

	// Backup retention days for the server, supported values are between 7 and 35 days.
	backupRetentionDays?: null | float64 @go(BackupRetentionDays,*float64)

	// The creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default.
	createMode?: null | string @go(CreateMode,*string)

	// For creation modes other than Default, the source server ID to use.
	creationSourceServerId?: null | string @go(CreationSourceServerID,*string)

	// The FQDN of the MariaDB Server.
	fqdn?: null | string @go(Fqdn,*string)

	// Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not supported for the Basic tier.
	geoRedundantBackupEnabled?: null | bool @go(GeoRedundantBackupEnabled,*bool)

	// The ID of the MariaDB Server.
	id?: null | string @go(ID,*string)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	location?: null | string @go(Location,*string)

	// Whether or not public network access is allowed for this server. Defaults to true.
	publicNetworkAccessEnabled?: null | bool @go(PublicNetworkAccessEnabled,*bool)

	// The name of the resource group in which to create the MariaDB Server. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// When create_mode is PointInTimeRestore, specifies the point in time to restore from creation_source_server_id. It should be provided in RFC3339 format, e.g. 2013-11-08T22:00:40Z.
	restorePointInTime?: null | string @go(RestorePointInTime,*string)

	// Specifies if SSL should be enforced on connections. Possible values are true and false.
	sslEnforcementEnabled?: null | bool @go(SSLEnforcementEnabled,*bool)

	// The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2.
	sslMinimalTlsVersionEnforced?: null | string @go(SSLMinimalTLSVersionEnforced,*string)

	// Specifies the SKU Name for this MariaDB Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8). For more information see the product documentation. Possible values are B_Gen5_1, B_Gen5_2, GP_Gen5_2, GP_Gen5_4, GP_Gen5_8, GP_Gen5_16, GP_Gen5_32, MO_Gen5_2, MO_Gen5_4, MO_Gen5_8 and MO_Gen5_16.
	skuName?: null | string @go(SkuName,*string)

	// Max storage allowed for a server. Possible values are between 5120 MB (5GB) and 1024000MB (1TB) for the Basic SKU and between 5120 MB (5GB) and 4096000 MB (4TB) for General Purpose/Memory Optimized SKUs. For more information see the product documentation.
	storageMb?: null | float64 @go(StorageMb,*float64)

	// A mapping of tags to assign to the resource.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3. Changing this forces a new resource to be created.
	version?: null | string @go(Version,*string)
}

#ServerParameters: {
	// The Administrator login for the MariaDB Server. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	administratorLogin?: null | string @go(AdministratorLogin,*string)

	// Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true.
	// +kubebuilder:validation:Optional
	autoGrowEnabled?: null | bool @go(AutoGrowEnabled,*bool)

	// Backup retention days for the server, supported values are between 7 and 35 days.
	// +kubebuilder:validation:Optional
	backupRetentionDays?: null | float64 @go(BackupRetentionDays,*float64)

	// The creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default.
	// +kubebuilder:validation:Optional
	createMode?: null | string @go(CreateMode,*string)

	// For creation modes other than Default, the source server ID to use.
	// +crossplane:generate:reference:type=Server
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-azure/apis/rconfig.ExtractResourceID()
	// +kubebuilder:validation:Optional
	creationSourceServerId?: null | string @go(CreationSourceServerID,*string)

	// Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not supported for the Basic tier.
	// +kubebuilder:validation:Optional
	geoRedundantBackupEnabled?: null | bool @go(GeoRedundantBackupEnabled,*bool)

	// Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// Whether or not public network access is allowed for this server. Defaults to true.
	// +kubebuilder:validation:Optional
	publicNetworkAccessEnabled?: null | bool @go(PublicNetworkAccessEnabled,*bool)

	// The name of the resource group in which to create the MariaDB Server. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// When create_mode is PointInTimeRestore, specifies the point in time to restore from creation_source_server_id. It should be provided in RFC3339 format, e.g. 2013-11-08T22:00:40Z.
	// +kubebuilder:validation:Optional
	restorePointInTime?: null | string @go(RestorePointInTime,*string)

	// Specifies if SSL should be enforced on connections. Possible values are true and false.
	// +kubebuilder:validation:Optional
	sslEnforcementEnabled?: null | bool @go(SSLEnforcementEnabled,*bool)

	// The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2.
	// +kubebuilder:validation:Optional
	sslMinimalTlsVersionEnforced?: null | string @go(SSLMinimalTLSVersionEnforced,*string)

	// Specifies the SKU Name for this MariaDB Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8). For more information see the product documentation. Possible values are B_Gen5_1, B_Gen5_2, GP_Gen5_2, GP_Gen5_4, GP_Gen5_8, GP_Gen5_16, GP_Gen5_32, MO_Gen5_2, MO_Gen5_4, MO_Gen5_8 and MO_Gen5_16.
	// +kubebuilder:validation:Optional
	skuName?: null | string @go(SkuName,*string)

	// Max storage allowed for a server. Possible values are between 5120 MB (5GB) and 1024000MB (1TB) for the Basic SKU and between 5120 MB (5GB) and 4096000 MB (4TB) for General Purpose/Memory Optimized SKUs. For more information see the product documentation.
	// +kubebuilder:validation:Optional
	storageMb?: null | float64 @go(StorageMb,*float64)

	// A mapping of tags to assign to the resource.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3. Changing this forces a new resource to be created.
	// +kubebuilder:validation:Optional
	version?: null | string @go(Version,*string)
}

// ServerSpec defines the desired state of Server
#ServerSpec: {
	forProvider: #ServerParameters @go(ForProvider)

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
	initProvider?: #ServerInitParameters @go(InitProvider)
}

// ServerStatus defines the observed state of Server.
#ServerStatus: {
	atProvider?: #ServerObservation @go(AtProvider)
}

// Server is the Schema for the Servers API. Manages a MariaDB Server.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#Server: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.location) || (has(self.initProvider) && has(self.initProvider.location))",message="spec.forProvider.location is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.skuName) || (has(self.initProvider) && has(self.initProvider.skuName))",message="spec.forProvider.skuName is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.sslEnforcementEnabled) || (has(self.initProvider) && has(self.initProvider.sslEnforcementEnabled))",message="spec.forProvider.sslEnforcementEnabled is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.version) || (has(self.initProvider) && has(self.initProvider.version))",message="spec.forProvider.version is a required parameter"
	spec:    #ServerSpec   @go(Spec)
	status?: #ServerStatus @go(Status)
}

// ServerList contains a list of Servers
#ServerList: {
	items: [...#Server] @go(Items,[]Server)
}