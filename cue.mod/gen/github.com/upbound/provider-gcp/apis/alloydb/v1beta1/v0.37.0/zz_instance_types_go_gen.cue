// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/alloydb/v1beta1

package v1beta1

#InstanceInitParameters: {
	// Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels.
	annotations?: {[string]: null | string} @go(Annotations,map[string]*string)

	// 'Availability type of an Instance. Defaults to REGIONAL for both primary and read instances.
	// Note that primary and read instances can have different availability types.
	// Only READ_POOL instance supports ZONAL type. Users can't specify the zone for READ_POOL instance.
	// Zone is automatically chosen from the list of zones in the region specified.
	// Read pool of size 1 can only have zonal availability. Read pools with node count of 2 or more
	// can have regional availability (nodes are present in 2 or more zones in a region).'
	// Possible values are: AVAILABILITY_TYPE_UNSPECIFIED, ZONAL, REGIONAL.
	availabilityType?: null | string @go(AvailabilityType,*string)

	// Database flags. Set at instance level. * They are copied from primary instance on read instance creation. * Read instances can set new or override existing flags that are relevant for reads, e.g. for enabling columnar cache on a read instance. Flags set on read instance may or may not be present on primary.
	databaseFlags?: {[string]: null | string} @go(DatabaseFlags,map[string]*string)

	// User-settable and human-readable display name for the Instance.
	displayName?: null | string @go(DisplayName,*string)

	// The Compute Engine zone that the instance should serve from, per https://cloud.google.com/compute/docs/regions-zones This can ONLY be specified for ZONAL instances. If present for a REGIONAL instance, an error will be thrown. If this is absent for a ZONAL instance, instance is created in a random zone with available capacity.
	gceZone?: null | string @go(GceZone,*string)

	// The type of the instance. If the instance type is READ_POOL, provide the associated PRIMARY instance in the depends_on meta-data attribute.
	// Possible values are: PRIMARY, READ_POOL.
	instanceType?: null | string @go(InstanceType,*string)

	// User-defined labels for the alloydb instance.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Configurations for the machines that host the underlying database engine.
	// Structure is documented below.
	machineConfig?: [...#MachineConfigInitParameters] @go(MachineConfig,[]MachineConfigInitParameters)

	// Read pool specific config.
	// Structure is documented below.
	readPoolConfig?: [...#ReadPoolConfigInitParameters] @go(ReadPoolConfig,[]ReadPoolConfigInitParameters)
}

#InstanceObservation: {
	// Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels.
	annotations?: {[string]: null | string} @go(Annotations,map[string]*string)

	// 'Availability type of an Instance. Defaults to REGIONAL for both primary and read instances.
	// Note that primary and read instances can have different availability types.
	// Only READ_POOL instance supports ZONAL type. Users can't specify the zone for READ_POOL instance.
	// Zone is automatically chosen from the list of zones in the region specified.
	// Read pool of size 1 can only have zonal availability. Read pools with node count of 2 or more
	// can have regional availability (nodes are present in 2 or more zones in a region).'
	// Possible values are: AVAILABILITY_TYPE_UNSPECIFIED, ZONAL, REGIONAL.
	availabilityType?: null | string @go(AvailabilityType,*string)

	// Identifies the alloydb cluster. Must be in the format
	// 'projects/{project}/locations/{location}/clusters/{cluster_id}'
	cluster?: null | string @go(Cluster,*string)

	// Time the Instance was created in UTC.
	createTime?: null | string @go(CreateTime,*string)

	// Database flags. Set at instance level. * They are copied from primary instance on read instance creation. * Read instances can set new or override existing flags that are relevant for reads, e.g. for enabling columnar cache on a read instance. Flags set on read instance may or may not be present on primary.
	databaseFlags?: {[string]: null | string} @go(DatabaseFlags,map[string]*string)

	// User-settable and human-readable display name for the Instance.
	displayName?: null | string @go(DisplayName,*string)

	// The Compute Engine zone that the instance should serve from, per https://cloud.google.com/compute/docs/regions-zones This can ONLY be specified for ZONAL instances. If present for a REGIONAL instance, an error will be thrown. If this is absent for a ZONAL instance, instance is created in a random zone with available capacity.
	gceZone?: null | string @go(GceZone,*string)

	// an identifier for the resource with format {{cluster}}/instances/{{instance_id}}
	id?: null | string @go(ID,*string)

	// The IP address for the Instance. This is the connection endpoint for an end-user application.
	ipAddress?: null | string @go(IPAddress,*string)

	// The type of the instance. If the instance type is READ_POOL, provide the associated PRIMARY instance in the depends_on meta-data attribute.
	// Possible values are: PRIMARY, READ_POOL.
	instanceType?: null | string @go(InstanceType,*string)

	// User-defined labels for the alloydb instance.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Configurations for the machines that host the underlying database engine.
	// Structure is documented below.
	machineConfig?: [...#MachineConfigObservation] @go(MachineConfig,[]MachineConfigObservation)

	// The name of the instance resource.
	name?: null | string @go(Name,*string)

	// Read pool specific config.
	// Structure is documented below.
	readPoolConfig?: [...#ReadPoolConfigObservation] @go(ReadPoolConfig,[]ReadPoolConfigObservation)

	// Set to true if the current state of Instance does not match the user's intended state, and the service is actively updating the resource to reconcile them. This can happen due to user-triggered updates or system actions like failover or maintenance.
	reconciling?: null | bool @go(Reconciling,*bool)

	// The current state of the alloydb instance.
	state?: null | string @go(State,*string)

	// The system-generated UID of the resource.
	uid?: null | string @go(UID,*string)

	// Time the Instance was updated in UTC.
	updateTime?: null | string @go(UpdateTime,*string)
}

#InstanceParameters: {
	// Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels.
	// +kubebuilder:validation:Optional
	annotations?: {[string]: null | string} @go(Annotations,map[string]*string)

	// 'Availability type of an Instance. Defaults to REGIONAL for both primary and read instances.
	// Note that primary and read instances can have different availability types.
	// Only READ_POOL instance supports ZONAL type. Users can't specify the zone for READ_POOL instance.
	// Zone is automatically chosen from the list of zones in the region specified.
	// Read pool of size 1 can only have zonal availability. Read pools with node count of 2 or more
	// can have regional availability (nodes are present in 2 or more zones in a region).'
	// Possible values are: AVAILABILITY_TYPE_UNSPECIFIED, ZONAL, REGIONAL.
	// +kubebuilder:validation:Optional
	availabilityType?: null | string @go(AvailabilityType,*string)

	// Identifies the alloydb cluster. Must be in the format
	// 'projects/{project}/locations/{location}/clusters/{cluster_id}'
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/alloydb/v1beta1.Cluster
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",true)
	// +kubebuilder:validation:Optional
	cluster?: null | string @go(Cluster,*string)

	// Database flags. Set at instance level. * They are copied from primary instance on read instance creation. * Read instances can set new or override existing flags that are relevant for reads, e.g. for enabling columnar cache on a read instance. Flags set on read instance may or may not be present on primary.
	// +kubebuilder:validation:Optional
	databaseFlags?: {[string]: null | string} @go(DatabaseFlags,map[string]*string)

	// User-settable and human-readable display name for the Instance.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// The Compute Engine zone that the instance should serve from, per https://cloud.google.com/compute/docs/regions-zones This can ONLY be specified for ZONAL instances. If present for a REGIONAL instance, an error will be thrown. If this is absent for a ZONAL instance, instance is created in a random zone with available capacity.
	// +kubebuilder:validation:Optional
	gceZone?: null | string @go(GceZone,*string)

	// The type of the instance. If the instance type is READ_POOL, provide the associated PRIMARY instance in the depends_on meta-data attribute.
	// Possible values are: PRIMARY, READ_POOL.
	// +kubebuilder:validation:Optional
	instanceType?: null | string @go(InstanceType,*string)

	// User-defined labels for the alloydb instance.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Configurations for the machines that host the underlying database engine.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	machineConfig?: [...#MachineConfigParameters] @go(MachineConfig,[]MachineConfigParameters)

	// Read pool specific config.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	readPoolConfig?: [...#ReadPoolConfigParameters] @go(ReadPoolConfig,[]ReadPoolConfigParameters)
}

#MachineConfigInitParameters: {
	// The number of CPU's in the VM instance.
	cpuCount?: null | float64 @go(CPUCount,*float64)
}

#MachineConfigObservation: {
	// The number of CPU's in the VM instance.
	cpuCount?: null | float64 @go(CPUCount,*float64)
}

#MachineConfigParameters: {
	// The number of CPU's in the VM instance.
	// +kubebuilder:validation:Optional
	cpuCount?: null | float64 @go(CPUCount,*float64)
}

#ReadPoolConfigInitParameters: {
	// Read capacity, i.e. number of nodes in a read pool instance.
	nodeCount?: null | float64 @go(NodeCount,*float64)
}

#ReadPoolConfigObservation: {
	// Read capacity, i.e. number of nodes in a read pool instance.
	nodeCount?: null | float64 @go(NodeCount,*float64)
}

#ReadPoolConfigParameters: {
	// Read capacity, i.e. number of nodes in a read pool instance.
	// +kubebuilder:validation:Optional
	nodeCount?: null | float64 @go(NodeCount,*float64)
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

// Instance is the Schema for the Instances API. A managed alloydb cluster instance.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Instance: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.instanceType) || (has(self.initProvider) && has(self.initProvider.instanceType))",message="spec.forProvider.instanceType is a required parameter"
	spec:    #InstanceSpec   @go(Spec)
	status?: #InstanceStatus @go(Status)
}

// InstanceList contains a list of Instances
#InstanceList: {
	items: [...#Instance] @go(Items,[]Instance)
}