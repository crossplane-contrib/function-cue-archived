// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/dataproc/v1beta1

package v1beta1

#ConsumersInitParameters: {
}

#ConsumersObservation: {
	// (Output)
	// The URI of the endpoint used to access the metastore service.
	endpointUri?: null | string @go(EndpointURI,*string)

	// The subnetwork of the customer project from which an IP address is reserved and used as the Dataproc Metastore service's endpoint.
	// It is accessible to hosts in the subnet and to all hosts in a subnet in the same region and same network.
	// There must be at least one IP address available in the subnet's primary range. The subnet is specified in the following form:
	// `projects/{projectNumber}/regions/{region_id}/subnetworks/{subnetwork_id}
	subnetwork?: null | string @go(Subnetwork,*string)
}

#ConsumersParameters: {
	// The subnetwork of the customer project from which an IP address is reserved and used as the Dataproc Metastore service's endpoint.
	// It is accessible to hosts in the subnet and to all hosts in a subnet in the same region and same network.
	// There must be at least one IP address available in the subnet's primary range. The subnet is specified in the following form:
	// `projects/{projectNumber}/regions/{region_id}/subnetworks/{subnetwork_id}
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Subnetwork
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	subnetwork?: null | string @go(Subnetwork,*string)
}

#HiveMetastoreConfigInitParameters: {
	// A mapping of Hive metastore configuration key-value pairs to apply to the Hive metastore (configured in hive-site.xml).
	// The mappings override system defaults (some keys cannot be overridden)
	configOverrides?: {[string]: null | string} @go(ConfigOverrides,map[string]*string)

	// Information used to configure the Hive metastore service as a service principal in a Kerberos realm.
	// Structure is documented below.
	kerberosConfig?: [...#HiveMetastoreConfigKerberosConfigInitParameters] @go(KerberosConfig,[]HiveMetastoreConfigKerberosConfigInitParameters)

	// The Hive metastore schema version.
	version?: null | string @go(Version,*string)
}

#HiveMetastoreConfigKerberosConfigInitParameters: {
	// A Kerberos keytab file that can be used to authenticate a service principal with a Kerberos Key Distribution Center (KDC).
	// Structure is documented below.
	keytab?: [...#KeytabInitParameters] @go(Keytab,[]KeytabInitParameters)

	// A Cloud Storage URI that specifies the path to a krb5.conf file. It is of the form gs://{bucket_name}/path/to/krb5.conf, although the file does not need to be named krb5.conf explicitly.
	krb5ConfigGcsUri?: null | string @go(Krb5ConfigGcsURI,*string)

	// A Kerberos principal that exists in the both the keytab the KDC to authenticate as. A typical principal is of the form "primary/instance@REALM", but there is no exact format.
	principal?: null | string @go(Principal,*string)
}

#HiveMetastoreConfigKerberosConfigObservation: {
	// A Kerberos keytab file that can be used to authenticate a service principal with a Kerberos Key Distribution Center (KDC).
	// Structure is documented below.
	keytab?: [...#KeytabObservation] @go(Keytab,[]KeytabObservation)

	// A Cloud Storage URI that specifies the path to a krb5.conf file. It is of the form gs://{bucket_name}/path/to/krb5.conf, although the file does not need to be named krb5.conf explicitly.
	krb5ConfigGcsUri?: null | string @go(Krb5ConfigGcsURI,*string)

	// A Kerberos principal that exists in the both the keytab the KDC to authenticate as. A typical principal is of the form "primary/instance@REALM", but there is no exact format.
	principal?: null | string @go(Principal,*string)
}

#HiveMetastoreConfigKerberosConfigParameters: {
	// A Kerberos keytab file that can be used to authenticate a service principal with a Kerberos Key Distribution Center (KDC).
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	keytab?: [...#KeytabParameters] @go(Keytab,[]KeytabParameters)

	// A Cloud Storage URI that specifies the path to a krb5.conf file. It is of the form gs://{bucket_name}/path/to/krb5.conf, although the file does not need to be named krb5.conf explicitly.
	// +kubebuilder:validation:Optional
	krb5ConfigGcsUri?: null | string @go(Krb5ConfigGcsURI,*string)

	// A Kerberos principal that exists in the both the keytab the KDC to authenticate as. A typical principal is of the form "primary/instance@REALM", but there is no exact format.
	// +kubebuilder:validation:Optional
	principal?: null | string @go(Principal,*string)
}

#HiveMetastoreConfigObservation: {
	// A mapping of Hive metastore configuration key-value pairs to apply to the Hive metastore (configured in hive-site.xml).
	// The mappings override system defaults (some keys cannot be overridden)
	configOverrides?: {[string]: null | string} @go(ConfigOverrides,map[string]*string)

	// Information used to configure the Hive metastore service as a service principal in a Kerberos realm.
	// Structure is documented below.
	kerberosConfig?: [...#HiveMetastoreConfigKerberosConfigObservation] @go(KerberosConfig,[]HiveMetastoreConfigKerberosConfigObservation)

	// The Hive metastore schema version.
	version?: null | string @go(Version,*string)
}

#HiveMetastoreConfigParameters: {
	// A mapping of Hive metastore configuration key-value pairs to apply to the Hive metastore (configured in hive-site.xml).
	// The mappings override system defaults (some keys cannot be overridden)
	// +kubebuilder:validation:Optional
	configOverrides?: {[string]: null | string} @go(ConfigOverrides,map[string]*string)

	// Information used to configure the Hive metastore service as a service principal in a Kerberos realm.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	kerberosConfig?: [...#HiveMetastoreConfigKerberosConfigParameters] @go(KerberosConfig,[]HiveMetastoreConfigKerberosConfigParameters)

	// The Hive metastore schema version.
	// +kubebuilder:validation:Optional
	version?: null | string @go(Version,*string)
}

#KeytabInitParameters: {
	// The relative resource name of a Secret Manager secret version, in the following form:
	// "projects/{projectNumber}/secrets/{secret_id}/versions/{version_id}".
	cloudSecret?: null | string @go(CloudSecret,*string)
}

#KeytabObservation: {
	// The relative resource name of a Secret Manager secret version, in the following form:
	// "projects/{projectNumber}/secrets/{secret_id}/versions/{version_id}".
	cloudSecret?: null | string @go(CloudSecret,*string)
}

#KeytabParameters: {
	// The relative resource name of a Secret Manager secret version, in the following form:
	// "projects/{projectNumber}/secrets/{secret_id}/versions/{version_id}".
	// +kubebuilder:validation:Optional
	cloudSecret?: null | string @go(CloudSecret,*string)
}

#MaintenanceWindowInitParameters: {
	// The day of week, when the window starts.
	// Possible values are: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.
	dayOfWeek?: null | string @go(DayOfWeek,*string)

	// The hour of day (0-23) when the window starts.
	hourOfDay?: null | float64 @go(HourOfDay,*float64)
}

#MaintenanceWindowObservation: {
	// The day of week, when the window starts.
	// Possible values are: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.
	dayOfWeek?: null | string @go(DayOfWeek,*string)

	// The hour of day (0-23) when the window starts.
	hourOfDay?: null | float64 @go(HourOfDay,*float64)
}

#MaintenanceWindowParameters: {
	// The day of week, when the window starts.
	// Possible values are: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.
	// +kubebuilder:validation:Optional
	dayOfWeek?: null | string @go(DayOfWeek,*string)

	// The hour of day (0-23) when the window starts.
	// +kubebuilder:validation:Optional
	hourOfDay?: null | float64 @go(HourOfDay,*float64)
}

#MetastoreServiceEncryptionConfigInitParameters: {
}

#MetastoreServiceEncryptionConfigObservation: {
	// The fully qualified customer provided Cloud KMS key name to use for customer data encryption.
	// Use the following format: projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)
	kmsKey?: null | string @go(KMSKey,*string)
}

#MetastoreServiceEncryptionConfigParameters: {
	// The fully qualified customer provided Cloud KMS key name to use for customer data encryption.
	// Use the following format: projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/kms/v1beta1.CryptoKey
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	kmsKey?: null | string @go(KMSKey,*string)
}

#MetastoreServiceInitParameters: {
	// The database type that the Metastore service stores its data.
	// Default value is MYSQL.
	// Possible values are: MYSQL, SPANNER.
	databaseType?: null | string @go(DatabaseType,*string)

	// Information used to configure the Dataproc Metastore service to encrypt
	// customer data at rest.
	// Structure is documented below.
	encryptionConfig?: [...#MetastoreServiceEncryptionConfigInitParameters] @go(EncryptionConfig,[]MetastoreServiceEncryptionConfigInitParameters)

	// Configuration information specific to running Hive metastore software as the metastore service.
	// Structure is documented below.
	hiveMetastoreConfig?: [...#HiveMetastoreConfigInitParameters] @go(HiveMetastoreConfig,[]HiveMetastoreConfigInitParameters)

	// User-defined labels for the metastore service.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The one hour maintenance window of the metastore service.
	// This specifies when the service can be restarted for maintenance purposes in UTC time.
	// Maintenance window is not needed for services with the SPANNER database type.
	// Structure is documented below.
	maintenanceWindow?: [...#MaintenanceWindowInitParameters] @go(MaintenanceWindow,[]MaintenanceWindowInitParameters)

	// The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form:
	// "projects/{projectNumber}/global/networks/{network_id}".
	network?: null | string @go(Network,*string)

	// The configuration specifying the network settings for the Dataproc Metastore service.
	// Structure is documented below.
	networkConfig?: [...#NetworkConfigInitParameters] @go(NetworkConfig,[]NetworkConfigInitParameters)

	// The TCP port at which the metastore service is reached. Default: 9083.
	port?: null | float64 @go(Port,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The release channel of the service. If unspecified, defaults to STABLE.
	// Default value is STABLE.
	// Possible values are: CANARY, STABLE.
	releaseChannel?: null | string @go(ReleaseChannel,*string)

	// The configuration specifying telemetry settings for the Dataproc Metastore service. If unspecified defaults to JSON.
	// Structure is documented below.
	telemetryConfig?: [...#TelemetryConfigInitParameters] @go(TelemetryConfig,[]TelemetryConfigInitParameters)

	// The tier of the service.
	// Possible values are: DEVELOPER, ENTERPRISE.
	tier?: null | string @go(Tier,*string)
}

#MetastoreServiceObservation: {
	// A Cloud Storage URI (starting with gs://) that specifies where artifacts related to the metastore service are stored.
	artifactGcsUri?: null | string @go(ArtifactGcsURI,*string)

	// The database type that the Metastore service stores its data.
	// Default value is MYSQL.
	// Possible values are: MYSQL, SPANNER.
	databaseType?: null | string @go(DatabaseType,*string)

	// Information used to configure the Dataproc Metastore service to encrypt
	// customer data at rest.
	// Structure is documented below.
	encryptionConfig?: [...#MetastoreServiceEncryptionConfigObservation] @go(EncryptionConfig,[]MetastoreServiceEncryptionConfigObservation)

	// The URI of the endpoint used to access the metastore service.
	endpointUri?: null | string @go(EndpointURI,*string)

	// Configuration information specific to running Hive metastore software as the metastore service.
	// Structure is documented below.
	hiveMetastoreConfig?: [...#HiveMetastoreConfigObservation] @go(HiveMetastoreConfig,[]HiveMetastoreConfigObservation)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/services/{{service_id}}
	id?: null | string @go(ID,*string)

	// User-defined labels for the metastore service.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The location where the metastore service should reside.
	// The default value is global.
	location?: null | string @go(Location,*string)

	// The one hour maintenance window of the metastore service.
	// This specifies when the service can be restarted for maintenance purposes in UTC time.
	// Maintenance window is not needed for services with the SPANNER database type.
	// Structure is documented below.
	maintenanceWindow?: [...#MaintenanceWindowObservation] @go(MaintenanceWindow,[]MaintenanceWindowObservation)

	// The relative resource name of the metastore service.
	name?: null | string @go(Name,*string)

	// The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form:
	// "projects/{projectNumber}/global/networks/{network_id}".
	network?: null | string @go(Network,*string)

	// The configuration specifying the network settings for the Dataproc Metastore service.
	// Structure is documented below.
	networkConfig?: [...#NetworkConfigObservation] @go(NetworkConfig,[]NetworkConfigObservation)

	// The TCP port at which the metastore service is reached. Default: 9083.
	port?: null | float64 @go(Port,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The release channel of the service. If unspecified, defaults to STABLE.
	// Default value is STABLE.
	// Possible values are: CANARY, STABLE.
	releaseChannel?: null | string @go(ReleaseChannel,*string)

	// The current state of the metastore service.
	state?: null | string @go(State,*string)

	// Additional information about the current state of the metastore service, if available.
	stateMessage?: null | string @go(StateMessage,*string)

	// The configuration specifying telemetry settings for the Dataproc Metastore service. If unspecified defaults to JSON.
	// Structure is documented below.
	telemetryConfig?: [...#TelemetryConfigObservation] @go(TelemetryConfig,[]TelemetryConfigObservation)

	// The tier of the service.
	// Possible values are: DEVELOPER, ENTERPRISE.
	tier?: null | string @go(Tier,*string)

	// The globally unique resource identifier of the metastore service.
	uid?: null | string @go(UID,*string)
}

#MetastoreServiceParameters: {
	// The database type that the Metastore service stores its data.
	// Default value is MYSQL.
	// Possible values are: MYSQL, SPANNER.
	// +kubebuilder:validation:Optional
	databaseType?: null | string @go(DatabaseType,*string)

	// Information used to configure the Dataproc Metastore service to encrypt
	// customer data at rest.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	encryptionConfig?: [...#MetastoreServiceEncryptionConfigParameters] @go(EncryptionConfig,[]MetastoreServiceEncryptionConfigParameters)

	// Configuration information specific to running Hive metastore software as the metastore service.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	hiveMetastoreConfig?: [...#HiveMetastoreConfigParameters] @go(HiveMetastoreConfig,[]HiveMetastoreConfigParameters)

	// User-defined labels for the metastore service.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The location where the metastore service should reside.
	// The default value is global.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The one hour maintenance window of the metastore service.
	// This specifies when the service can be restarted for maintenance purposes in UTC time.
	// Maintenance window is not needed for services with the SPANNER database type.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	maintenanceWindow?: [...#MaintenanceWindowParameters] @go(MaintenanceWindow,[]MaintenanceWindowParameters)

	// The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form:
	// "projects/{projectNumber}/global/networks/{network_id}".
	// +kubebuilder:validation:Optional
	network?: null | string @go(Network,*string)

	// The configuration specifying the network settings for the Dataproc Metastore service.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	networkConfig?: [...#NetworkConfigParameters] @go(NetworkConfig,[]NetworkConfigParameters)

	// The TCP port at which the metastore service is reached. Default: 9083.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The release channel of the service. If unspecified, defaults to STABLE.
	// Default value is STABLE.
	// Possible values are: CANARY, STABLE.
	// +kubebuilder:validation:Optional
	releaseChannel?: null | string @go(ReleaseChannel,*string)

	// The configuration specifying telemetry settings for the Dataproc Metastore service. If unspecified defaults to JSON.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	telemetryConfig?: [...#TelemetryConfigParameters] @go(TelemetryConfig,[]TelemetryConfigParameters)

	// The tier of the service.
	// Possible values are: DEVELOPER, ENTERPRISE.
	// +kubebuilder:validation:Optional
	tier?: null | string @go(Tier,*string)
}

#NetworkConfigInitParameters: {
	// The consumer-side network configuration for the Dataproc Metastore instance.
	// Structure is documented below.
	consumers?: [...#ConsumersInitParameters] @go(Consumers,[]ConsumersInitParameters)
}

#NetworkConfigObservation: {
	// The consumer-side network configuration for the Dataproc Metastore instance.
	// Structure is documented below.
	consumers?: [...#ConsumersObservation] @go(Consumers,[]ConsumersObservation)
}

#NetworkConfigParameters: {
	// The consumer-side network configuration for the Dataproc Metastore instance.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	consumers?: [...#ConsumersParameters] @go(Consumers,[]ConsumersParameters)
}

#TelemetryConfigInitParameters: {
	// The output format of the Dataproc Metastore service's logs.
	// Default value is JSON.
	// Possible values are: LEGACY, JSON.
	logFormat?: null | string @go(LogFormat,*string)
}

#TelemetryConfigObservation: {
	// The output format of the Dataproc Metastore service's logs.
	// Default value is JSON.
	// Possible values are: LEGACY, JSON.
	logFormat?: null | string @go(LogFormat,*string)
}

#TelemetryConfigParameters: {
	// The output format of the Dataproc Metastore service's logs.
	// Default value is JSON.
	// Possible values are: LEGACY, JSON.
	// +kubebuilder:validation:Optional
	logFormat?: null | string @go(LogFormat,*string)
}

// MetastoreServiceSpec defines the desired state of MetastoreService
#MetastoreServiceSpec: {
	forProvider: #MetastoreServiceParameters @go(ForProvider)

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
	initProvider?: #MetastoreServiceInitParameters @go(InitProvider)
}

// MetastoreServiceStatus defines the observed state of MetastoreService.
#MetastoreServiceStatus: {
	atProvider?: #MetastoreServiceObservation @go(AtProvider)
}

// MetastoreService is the Schema for the MetastoreServices API. A managed metastore service that serves metadata queries.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#MetastoreService: {
	spec:    #MetastoreServiceSpec   @go(Spec)
	status?: #MetastoreServiceStatus @go(Status)
}

// MetastoreServiceList contains a list of MetastoreServices
#MetastoreServiceList: {
	items: [...#MetastoreService] @go(Items,[]MetastoreService)
}