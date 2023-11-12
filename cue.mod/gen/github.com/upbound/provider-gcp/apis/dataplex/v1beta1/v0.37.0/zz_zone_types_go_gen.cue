// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/dataplex/v1beta1

package v1beta1

#DiscoverySpecCsvOptionsInitParameters: {
	// Optional. The delimiter being used to separate values. This defaults to ','.
	delimiter?: null | string @go(Delimiter,*string)

	// Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
	disableTypeInference?: null | bool @go(DisableTypeInference,*bool)

	// Optional. The character encoding of the data. The default is UTF-8.
	encoding?: null | string @go(Encoding,*string)

	// Optional. The number of rows to interpret as header rows that should be skipped when reading data rows.
	headerRows?: null | float64 @go(HeaderRows,*float64)
}

#DiscoverySpecCsvOptionsObservation: {
	// Optional. The delimiter being used to separate values. This defaults to ','.
	delimiter?: null | string @go(Delimiter,*string)

	// Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
	disableTypeInference?: null | bool @go(DisableTypeInference,*bool)

	// Optional. The character encoding of the data. The default is UTF-8.
	encoding?: null | string @go(Encoding,*string)

	// Optional. The number of rows to interpret as header rows that should be skipped when reading data rows.
	headerRows?: null | float64 @go(HeaderRows,*float64)
}

#DiscoverySpecCsvOptionsParameters: {
	// Optional. The delimiter being used to separate values. This defaults to ','.
	// +kubebuilder:validation:Optional
	delimiter?: null | string @go(Delimiter,*string)

	// Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
	// +kubebuilder:validation:Optional
	disableTypeInference?: null | bool @go(DisableTypeInference,*bool)

	// Optional. The character encoding of the data. The default is UTF-8.
	// +kubebuilder:validation:Optional
	encoding?: null | string @go(Encoding,*string)

	// Optional. The number of rows to interpret as header rows that should be skipped when reading data rows.
	// +kubebuilder:validation:Optional
	headerRows?: null | float64 @go(HeaderRows,*float64)
}

#DiscoverySpecJSONOptionsInitParameters: {
	// Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
	disableTypeInference?: null | bool @go(DisableTypeInference,*bool)

	// Optional. The character encoding of the data. The default is UTF-8.
	encoding?: null | string @go(Encoding,*string)
}

#DiscoverySpecJSONOptionsObservation: {
	// Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
	disableTypeInference?: null | bool @go(DisableTypeInference,*bool)

	// Optional. The character encoding of the data. The default is UTF-8.
	encoding?: null | string @go(Encoding,*string)
}

#DiscoverySpecJSONOptionsParameters: {
	// Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
	// +kubebuilder:validation:Optional
	disableTypeInference?: null | bool @go(DisableTypeInference,*bool)

	// Optional. The character encoding of the data. The default is UTF-8.
	// +kubebuilder:validation:Optional
	encoding?: null | string @go(Encoding,*string)
}

#ZoneAssetStatusInitParameters: {
}

#ZoneAssetStatusObservation: {
	activeAssets?:                 null | float64 @go(ActiveAssets,*float64)
	securityPolicyApplyingAssets?: null | float64 @go(SecurityPolicyApplyingAssets,*float64)

	// Output only. The time when the zone was last updated.
	updateTime?: null | string @go(UpdateTime,*string)
}

#ZoneAssetStatusParameters: {
}

#ZoneDiscoverySpecInitParameters: {
	// Optional. Configuration for CSV data.
	csvOptions?: [...#DiscoverySpecCsvOptionsInitParameters] @go(CsvOptions,[]DiscoverySpecCsvOptionsInitParameters)

	// Required. Whether discovery is enabled.
	enabled?: null | bool @go(Enabled,*bool)

	// Optional. The list of patterns to apply for selecting data to exclude during discovery. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
	excludePatterns?: [...null | string] @go(ExcludePatterns,[]*string)

	// Optional. The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
	includePatterns?: [...null | string] @go(IncludePatterns,[]*string)

	// Optional. Configuration for Json data.
	jsonOptions?: [...#DiscoverySpecJSONOptionsInitParameters] @go(JSONOptions,[]DiscoverySpecJSONOptionsInitParameters)

	// Optional. Cron schedule (https://en.wikipedia.org/wiki/Cron) for running discovery periodically. Successive discovery runs must be scheduled at least 60 minutes apart. The default value is to run discovery every 60 minutes. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or TZ=${IANA_TIME_ZONE}". The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, "CRON_TZ=America/New_York 1 * * * *", or "TZ=America/New_York 1 * * * *".
	schedule?: null | string @go(Schedule,*string)
}

#ZoneDiscoverySpecObservation: {
	// Optional. Configuration for CSV data.
	csvOptions?: [...#DiscoverySpecCsvOptionsObservation] @go(CsvOptions,[]DiscoverySpecCsvOptionsObservation)

	// Required. Whether discovery is enabled.
	enabled?: null | bool @go(Enabled,*bool)

	// Optional. The list of patterns to apply for selecting data to exclude during discovery. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
	excludePatterns?: [...null | string] @go(ExcludePatterns,[]*string)

	// Optional. The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
	includePatterns?: [...null | string] @go(IncludePatterns,[]*string)

	// Optional. Configuration for Json data.
	jsonOptions?: [...#DiscoverySpecJSONOptionsObservation] @go(JSONOptions,[]DiscoverySpecJSONOptionsObservation)

	// Optional. Cron schedule (https://en.wikipedia.org/wiki/Cron) for running discovery periodically. Successive discovery runs must be scheduled at least 60 minutes apart. The default value is to run discovery every 60 minutes. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or TZ=${IANA_TIME_ZONE}". The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, "CRON_TZ=America/New_York 1 * * * *", or "TZ=America/New_York 1 * * * *".
	schedule?: null | string @go(Schedule,*string)
}

#ZoneDiscoverySpecParameters: {
	// Optional. Configuration for CSV data.
	// +kubebuilder:validation:Optional
	csvOptions?: [...#DiscoverySpecCsvOptionsParameters] @go(CsvOptions,[]DiscoverySpecCsvOptionsParameters)

	// Required. Whether discovery is enabled.
	// +kubebuilder:validation:Optional
	enabled?: null | bool @go(Enabled,*bool)

	// Optional. The list of patterns to apply for selecting data to exclude during discovery. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
	// +kubebuilder:validation:Optional
	excludePatterns?: [...null | string] @go(ExcludePatterns,[]*string)

	// Optional. The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
	// +kubebuilder:validation:Optional
	includePatterns?: [...null | string] @go(IncludePatterns,[]*string)

	// Optional. Configuration for Json data.
	// +kubebuilder:validation:Optional
	jsonOptions?: [...#DiscoverySpecJSONOptionsParameters] @go(JSONOptions,[]DiscoverySpecJSONOptionsParameters)

	// Optional. Cron schedule (https://en.wikipedia.org/wiki/Cron) for running discovery periodically. Successive discovery runs must be scheduled at least 60 minutes apart. The default value is to run discovery every 60 minutes. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or TZ=${IANA_TIME_ZONE}". The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, "CRON_TZ=America/New_York 1 * * * *", or "TZ=America/New_York 1 * * * *".
	// +kubebuilder:validation:Optional
	schedule?: null | string @go(Schedule,*string)
}

#ZoneInitParameters: {
	// Optional. Description of the zone.
	description?: null | string @go(Description,*string)

	// Required. Specification of the discovery feature applied to data in this zone.
	discoverySpec?: [...#ZoneDiscoverySpecInitParameters] @go(DiscoverySpec,[]ZoneDiscoverySpecInitParameters)

	// Optional. User friendly display name.
	displayName?: null | string @go(DisplayName,*string)

	// Optional. User defined labels for the zone.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The project for the resource
	project?: null | string @go(Project,*string)

	// Required. Immutable. Specification of the resources that are referenced by the assets within this zone.
	resourceSpec?: [...#ZoneResourceSpecInitParameters] @go(ResourceSpec,[]ZoneResourceSpecInitParameters)

	// Required. Immutable. The type of the zone. Possible values: TYPE_UNSPECIFIED, RAW, CURATED
	type?: null | string @go(Type,*string)
}

#ZoneObservation: {
	// Output only. Aggregated status of the underlying assets of the zone.
	assetStatus?: [...#ZoneAssetStatusObservation] @go(AssetStatus,[]ZoneAssetStatusObservation)

	// Output only. The time when the zone was created.
	createTime?: null | string @go(CreateTime,*string)

	// Optional. Description of the zone.
	description?: null | string @go(Description,*string)

	// Required. Specification of the discovery feature applied to data in this zone.
	discoverySpec?: [...#ZoneDiscoverySpecObservation] @go(DiscoverySpec,[]ZoneDiscoverySpecObservation)

	// Optional. User friendly display name.
	displayName?: null | string @go(DisplayName,*string)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{name}}
	id?: null | string @go(ID,*string)

	// Optional. User defined labels for the zone.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The lake for the resource
	lake?: null | string @go(Lake,*string)

	// The location for the resource
	location?: null | string @go(Location,*string)

	// The project for the resource
	project?: null | string @go(Project,*string)

	// Required. Immutable. Specification of the resources that are referenced by the assets within this zone.
	resourceSpec?: [...#ZoneResourceSpecObservation] @go(ResourceSpec,[]ZoneResourceSpecObservation)

	// Output only. Current state of the zone. Possible values: STATE_UNSPECIFIED, ACTIVE, CREATING, DELETING, ACTION_REQUIRED
	state?: null | string @go(State,*string)

	// Required. Immutable. The type of the zone. Possible values: TYPE_UNSPECIFIED, RAW, CURATED
	type?: null | string @go(Type,*string)

	// Output only. System generated globally unique ID for the zone. This ID will be different if the zone is deleted and re-created with the same name.
	uid?: null | string @go(UID,*string)

	// Output only. The time when the zone was last updated.
	updateTime?: null | string @go(UpdateTime,*string)
}

#ZoneParameters: {
	// Optional. Description of the zone.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Required. Specification of the discovery feature applied to data in this zone.
	// +kubebuilder:validation:Optional
	discoverySpec?: [...#ZoneDiscoverySpecParameters] @go(DiscoverySpec,[]ZoneDiscoverySpecParameters)

	// Optional. User friendly display name.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// Optional. User defined labels for the zone.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The lake for the resource
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/dataplex/v1beta1.Lake
	// +kubebuilder:validation:Optional
	lake?: null | string @go(Lake,*string)

	// The location for the resource
	// +kubebuilder:validation:Required
	location?: null | string @go(Location,*string)

	// The project for the resource
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Required. Immutable. Specification of the resources that are referenced by the assets within this zone.
	// +kubebuilder:validation:Optional
	resourceSpec?: [...#ZoneResourceSpecParameters] @go(ResourceSpec,[]ZoneResourceSpecParameters)

	// Required. Immutable. The type of the zone. Possible values: TYPE_UNSPECIFIED, RAW, CURATED
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#ZoneResourceSpecInitParameters: {
	// Required. Immutable. The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: LOCATION_TYPE_UNSPECIFIED, SINGLE_REGION, MULTI_REGION
	locationType?: null | string @go(LocationType,*string)
}

#ZoneResourceSpecObservation: {
	// Required. Immutable. The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: LOCATION_TYPE_UNSPECIFIED, SINGLE_REGION, MULTI_REGION
	locationType?: null | string @go(LocationType,*string)
}

#ZoneResourceSpecParameters: {
	// Required. Immutable. The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: LOCATION_TYPE_UNSPECIFIED, SINGLE_REGION, MULTI_REGION
	// +kubebuilder:validation:Optional
	locationType?: null | string @go(LocationType,*string)
}

// ZoneSpec defines the desired state of Zone
#ZoneSpec: {
	forProvider: #ZoneParameters @go(ForProvider)

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
	initProvider?: #ZoneInitParameters @go(InitProvider)
}

// ZoneStatus defines the observed state of Zone.
#ZoneStatus: {
	atProvider?: #ZoneObservation @go(AtProvider)
}

// Zone is the Schema for the Zones API. The Dataplex Zone resource
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Zone: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.discoverySpec) || (has(self.initProvider) && has(self.initProvider.discoverySpec))",message="spec.forProvider.discoverySpec is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.resourceSpec) || (has(self.initProvider) && has(self.initProvider.resourceSpec))",message="spec.forProvider.resourceSpec is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.type) || (has(self.initProvider) && has(self.initProvider.type))",message="spec.forProvider.type is a required parameter"
	spec:    #ZoneSpec   @go(Spec)
	status?: #ZoneStatus @go(Status)
}

// ZoneList contains a list of Zones
#ZoneList: {
	items: [...#Zone] @go(Items,[]Zone)
}