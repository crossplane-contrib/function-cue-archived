// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/cache/v1beta1

package v1beta1

#StatusCreating:     "creating"
#StatusAvailable:    "available"
#StatusModifying:    "modifying"
#StatusDeleting:     "deleting"
#StatusCreateFailed: "create-failed"
#StatusSnapshotting: "snapshotting"

#CacheEngineRedis:     "redis"
#CacheEngineMemcached: "memcached"

// MinorVersion represents a supported minor version of Redis.
#MinorVersion: string

// PatchVersion represents a supported patch version of Redis.
#PatchVersion: string // #enumPatchVersion

#enumPatchVersion:
	#UnsupportedVersion

#UnsupportedVersion: #PatchVersion & ""

// Endpoint represents the information required for client programs to connect
// to a cache node.
// Please also see https://docs.aws.amazon.com/goto/WebAPI/elasticache-2015-02-02/Endpoint
#Endpoint: {
	// Address is the DNS hostname of the cache node.
	address?: string @go(Address)

	// Port number that the cache engine is listening on.
	port?: int @go(Port)
}

// NodeGroup represents a collection of cache nodes in a replication group.
// One node in the node group is the read/write primary node. All the other
// nodes are read-only Replica nodes.
// Please also see https://docs.aws.amazon.com/goto/WebAPI/elasticache-2015-02-02/NodeGroup
#NodeGroup: {
	// NodeGroupID is the identifier for the node group (shard). A Redis
	// (cluster mode disabled) replication group contains only 1 node group;
	// therefore, the node group ID is 0001. A Redis (cluster mode enabled)
	// replication group contains 1 to 15 node groups numbered 0001 to 0015.
	nodeGroupID?: string @go(NodeGroupID)

	// NodeGroupMembers is a list containing information about individual nodes
	// within the node group (shard).
	nodeGroupMembers?: [...#NodeGroupMember] @go(NodeGroupMembers,[]NodeGroupMember)

	// PrimaryEndpoint is the endpoint of the primary node in this
	// node group (shard).
	primaryEndpoint?: #Endpoint @go(PrimaryEndpoint)

	// Slots is the keyspace for this node group (shard).
	slots?: string @go(Slots)

	// Status of this replication group - creating, available, etc.
	status?: string @go(Status)
}

// NodeGroupMember represents a single node within a node group (shard).
// Please also see https://docs.aws.amazon.com/goto/WebAPI/elasticache-2015-02-02/NodeGroupMember
#NodeGroupMember: {
	// CacheClusterID is the ID of the cluster to which the node belongs.
	cacheClusterId?: string @go(CacheClusterID)

	// CacheNodeID is the ID of the node within its cluster. A node ID is a
	// numeric identifier (0001, 0002, etc.).
	cacheNodeId?: string @go(CacheNodeID)

	// CurrentRole is the role that is currently assigned to the node - primary
	// or replica. This member is only applicable for Redis (cluster mode
	// disabled) replication groups.
	currentRole?: string @go(CurrentRole)

	// PreferredAvailabilityZone is the name of the Availability Zone in
	// which the node is located.
	preferredAvailabilityZone?: string @go(PreferredAvailabilityZone)

	// ReadEndpoint is the information required for client programs to connect to a
	// node for read operations. The read endpoint is only applicable on Redis
	// (cluster mode disabled) clusters.
	readEndpoint?: #Endpoint @go(ReadEndpoint)
}

// ReplicationGroupPendingModifiedValues are the settings to be applied to the
// Redis replication group, either immediately or during the next maintenance
// window. Please also see
// https://docs.aws.amazon.com/goto/WebAPI/elasticache-2015-02-02/ReplicationGroupPendingModifiedValues
#ReplicationGroupPendingModifiedValues: {
	// AutomaticFailoverStatus indicates the status of Multi-AZ with automatic
	// failover for this Redis replication group.
	automaticFailoverStatus?: string @go(AutomaticFailoverStatus)

	// PrimaryClusterID that is applied immediately or during the next
	// maintenance window.
	primaryClusterId?: string @go(PrimaryClusterID)

	// Resharding is the status of an online resharding operation.
	resharding?: #ReshardingStatus @go(Resharding)
}

// ReshardingStatus is the status of an online resharding operation.
// Please also see https://docs.aws.amazon.com/goto/WebAPI/elasticache-2015-02-02/ReshardingStatus
#ReshardingStatus: {
	// Represents the progress of an online resharding operation.
	slotMigration: #SlotMigration @go(SlotMigration)
}

// SlotMigration represents the progress of an online resharding operation.
// Please also see https://docs.aws.amazon.com/goto/WebAPI/elasticache-2015-02-02/SlotMigration
#SlotMigration: {
	// ProgressPercentage is the percentage of the slot migration
	// that is complete.
	progressPercentage: int @go(ProgressPercentage)
}

// ReplicationGroupObservation contains the observation of the status of
// the given ReplicationGroup.
#ReplicationGroupObservation: {
	// AutomaticFailover indicates the status of Multi-AZ with automatic failover
	// for this Redis replication group.
	automaticFailoverStatus?: string @go(AutomaticFailover)

	// ClusterEnabled is a flag indicating whether or not this replication group
	// is cluster enabled; i.e., whether its data can be partitioned across
	// multiple shards (API/CLI: node groups).
	clusterEnabled?: bool @go(ClusterEnabled)

	// ConfigurationEndpoint for this replication group. Use the configuration
	// endpoint to connect to this replication group.
	configurationEndpoint?: #Endpoint @go(ConfigurationEndpoint)

	// MemberClusters is the list of names of all the cache clusters that are
	// part of this replication group.
	memberClusters?: [...string] @go(MemberClusters,[]string)

	// NodeGroups is a list of node groups in this replication group.
	// For Redis (cluster mode disabled) replication groups, this is a
	// single-element list. For Redis (cluster mode enabled) replication groups,
	// the list contains an entry for each node group (shard).
	nodeGroups?: [...#NodeGroup] @go(NodeGroups,[]NodeGroup)

	// PendingModifiedValues is a group of settings to be applied to the
	// replication group, either immediately or during the next maintenance window.
	pendingModifiedValues?: #ReplicationGroupPendingModifiedValues @go(PendingModifiedValues)

	// Status is the current state of this replication group - creating,
	// available, modifying, deleting, create-failed, snapshotting.
	status?: string @go(Status)
}

// A Tag is used to tag the ElastiCache resources in AWS.
#Tag: {
	// Key for the tag.
	key: string @go(Key)

	// Value of the tag.
	value: string @go(Value)
}

// A NodeGroupConfigurationSpec specifies the desired state of a node group.
#NodeGroupConfigurationSpec: {
	// PrimaryAvailabilityZone specifies the Availability Zone where the primary
	// node of this node group (shard) is launched.
	// +optional
	primaryAvailabilityZone?: null | string @go(PrimaryAvailabilityZone,*string)

	// ReplicaAvailabilityZones specifies a list of Availability Zones to be
	// used for the read replicas. The number of Availability Zones in this list
	// must match the value of ReplicaCount or ReplicasPerNodeGroup if not
	// specified.
	// +optional
	replicaAvailabilityZones?: [...string] @go(ReplicaAvailabilityZones,[]string)

	// ReplicaCount specifies the number of read replica nodes in this node
	// group (shard).
	// +optional
	replicaCount?: null | int @go(ReplicaCount,*int)

	// Slots specifies the keyspace for a particular node group. Keyspaces range
	// from 0 to 16,383. The string is in the format startkey-endkey.
	//
	// Example: "0-3999"
	// +optional
	slots?: null | string @go(Slots,*string)
}

// ReplicationGroupParameters define the desired state of an AWS ElastiCache
// Replication Group. Most fields map directly to an AWS ReplicationGroup:
// https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateReplicationGroup.html#API_CreateReplicationGroup_RequestParameters
#ReplicationGroupParameters: {
	// Region is the region you'd like your ReplicationGroup to be created in.
	// +optional
	region?: null | string @go(Region,*string)

	// If true, this parameter causes the modifications in this request and any
	// pending modifications to be applied, asynchronously and as soon as possible,
	// regardless of the PreferredMaintenanceWindow setting for the replication
	// group.
	//
	// If false, changes to the nodes in the replication group are applied on the
	// next maintenance reboot, or the next failure reboot, whichever occurs first.
	applyModificationsImmediately: bool @go(ApplyModificationsImmediately)

	// AtRestEncryptionEnabled enables encryption at rest when set to true.
	//
	// You cannot modify the value of AtRestEncryptionEnabled after the replication
	// group is created. To enable encryption at rest on a replication group you
	// must set AtRestEncryptionEnabled to true when you create the replication
	// group.
	//
	// Only available when creating a replication group in an Amazon VPC
	// using redis version 3.2.6 or 4.x.
	//
	// +immutable
	// +optional
	atRestEncryptionEnabled?: null | bool @go(AtRestEncryptionEnabled,*bool)

	// AuthEnabled enables mandatory authentication when connecting to the
	// managed replication group. AuthEnabled requires TransitEncryptionEnabled
	// to be true.
	//
	// While ReplicationGroupSpec mirrors the fields of the upstream replication
	// group object as closely as possible, we expose a boolean here rather than
	// requiring the operator pass in a string authentication token. Crossplane
	// will generate a token automatically and expose it via a Secret.
	// +immutable
	// +optional
	authEnabled?: null | bool @go(AuthEnabled,*bool)

	// AutomaticFailoverEnabled specifies whether a read-only replica is
	// automatically promoted to read/write primary if the existing primary
	// fails. Must be set to true if Multi-AZ is enabled for this replication group.
	// If false, Multi-AZ cannot be enabled for this replication group.
	//
	// AutomaticFailoverEnabled must be enabled for Redis (cluster mode enabled)
	// replication groups.
	//
	// Amazon ElastiCache for Redis does not support Multi-AZ with automatic
	// failover on:
	// * Redis versions earlier than 2.8.6.
	// * Redis (cluster mode disabled): T1 and T2 cache node types.
	// * Redis (cluster mode enabled): T1 node types.
	// +optional
	automaticFailoverEnabled?: null | bool @go(AutomaticFailoverEnabled,*bool)

	// CacheNodeType specifies the compute and memory capacity of the nodes in
	// the node group (shard).
	// For a complete listing of node types and specifications, see:
	// * Amazon ElastiCache Product Features and Details (http://aws.amazon.com/elasticache/details)
	// * Cache Node Type-Specific Parameters for Memcached (http://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/ParameterGroups.Memcached.html#ParameterGroups.Memcached.NodeSpecific)
	// * Cache Node Type-Specific Parameters for Redis (http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.Redis.html#ParameterGroups.Redis.NodeSpecific)
	cacheNodeType: string @go(CacheNodeType)

	// CacheParameterGroupName specifies the name of the parameter group to
	// associate with this replication group. If this argument is omitted, the
	// default cache parameter group for the specified engine is used.
	//
	// If you are running Redis version 3.2.4 or later, only one node group (shard),
	// and want to use a default parameter group, we recommend that you specify
	// the parameter group by name.
	// * To create a Redis (cluster mode disabled) replication group,
	// use CacheParameterGroupName=default.redis3.2.
	// * To create a Redis (cluster mode enabled) replication group,
	// use CacheParameterGroupName=default.redis3.2.cluster.on.
	// +optional
	cacheParameterGroupName?: null | string @go(CacheParameterGroupName,*string)

	// CacheSecurityGroupNames specifies a list of cache security group names to
	// associate with this replication group. Only for EC2-Classic mode.
	// +optional
	cacheSecurityGroupNames?: [...string] @go(CacheSecurityGroupNames,[]string)

	// CacheSubnetGroupName specifies the name of the cache subnet group to be
	// used for the replication group. If you're going to launch your cluster in
	// an Amazon VPC, you need to create a subnet group before you start
	// creating a cluster. For more information, see Subnets and Subnet Groups
	// (http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html).
	// +immutable
	// +optional
	cacheSubnetGroupName?: null | string @go(CacheSubnetGroupName,*string)

	// Engine is the name of the cache engine (memcached or redis) to be used
	// for the clusters in this replication group.
	// +immutable
	engine: string @go(Engine)

	// EngineVersion specifies the version number of the cache engine to be
	// used for the clusters in this replication group. To view the supported
	// cache engine versions, use the DescribeCacheEngineVersions operation.
	//
	// Important: You can upgrade to a newer engine version (see Selecting a Cache
	// Engine and Version (http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement))
	// in the ElastiCache User Guide, but you cannot downgrade to an earlier engine
	// version. If you want to use an earlier engine version, you must delete the
	// existing cluster or replication group and create it anew with the earlier
	// engine version.
	// +optional
	engineVersion?: null | string @go(EngineVersion,*string)

	// MultiAZEnabled specifies if Multi-AZ is enabled to enhance fault tolerance
	// You must have nodes across two or more Availability Zones in order to enable
	// this feature.
	// If this feature is set, automaticFailoverEnabled must be set to true.
	// +optional
	multiAZEnabled?: null | bool @go(MultiAZEnabled,*bool)

	// NodeGroupConfigurationSpec specifies a list of node group (shard)
	// configuration options.
	//
	// If you're creating a Redis (cluster mode disabled) or a Redis (cluster mode
	// enabled) replication group, you can use this parameter to individually configure
	// each node group (shard), or you can omit this parameter. However, when seeding
	// a Redis (cluster mode enabled) cluster from a S3 rdb file, you must configure
	// each node group (shard) using this parameter because you must specify the
	// slots for each node group.
	// +immutable
	// +optional
	nodeGroupConfiguration?: [...#NodeGroupConfigurationSpec] @go(NodeGroupConfiguration,[]NodeGroupConfigurationSpec)

	// NotificationTopicARN specifies the Amazon Resource Name (ARN) of the
	// Amazon Simple Notification Service (SNS) topic to which notifications are
	// sent. The Amazon SNS topic owner must be the same as the cluster owner.
	// +optional
	notificationTopicArn?: null | string @go(NotificationTopicARN,*string)

	// NotificationTopicStatus is the status of the Amazon SNS notification
	// topic for the replication group. Notifications are sent only if the status
	// is active.
	//
	// Valid values: active | inactive
	// +optional
	notificationTopicStatus?: null | string @go(NotificationTopicStatus,*string)

	// NumCacheClusters specifies the number of clusters this replication group
	// initially has. This parameter is not used if there is more than one node
	// group (shard). You should use ReplicasPerNodeGroup instead.
	//
	// If AutomaticFailoverEnabled is true, the value of this parameter must be
	// at least 2. If AutomaticFailoverEnabled is false you can omit this
	// parameter (it will default to 1), or you can explicitly set it to a value
	// between 2 and 6.
	//
	// The maximum permitted value for NumCacheClusters is 6 (1 primary plus 5 replicas).
	// +kubebuilder:validation:Maximum=6
	// +optional
	numCacheClusters?: null | int @go(NumCacheClusters,*int)

	// NumNodeGroups specifies the number of node groups (shards) for this Redis
	// (cluster mode enabled) replication group. For Redis (cluster mode
	// disabled) either omit this parameter or set it to 1.
	//
	// Default: 1
	// +immutable
	// +optional
	numNodeGroups?: null | int @go(NumNodeGroups,*int)

	// Port number on which each member of the replication group accepts
	// connections.
	// +immutable
	// +optional
	port?: null | int @go(Port,*int)

	// PreferredCacheClusterAZs specifies a list of EC2 Availability Zones in
	// which the replication group's clusters are created. The order of the
	// Availability Zones in the list is the order in which clusters are
	// allocated. The primary cluster is created in the first AZ in the list.
	//
	// This parameter is not used if there is more than one node group (shard).
	// You should use NodeGroupConfigurationSpec instead.
	//
	// If you are creating your replication group in an Amazon VPC (recommended),
	// you can only locate clusters in Availability Zones associated with the subnets
	// in the selected subnet group.
	//
	// The number of Availability Zones listed must equal the value of NumCacheClusters.
	//
	// Default: system chosen Availability Zones.
	// +immutable
	// +optional
	preferredCacheClusterAzs?: [...string] @go(PreferredCacheClusterAZs,[]string)

	// PreferredMaintenanceWindow specifies the weekly time range during which
	// maintenance on the cluster is performed. It is specified as a range in
	// the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum
	// maintenance window is a 60 minute period.
	//
	// Example: sun:23:00-mon:01:30
	// +optional
	preferredMaintenanceWindow?: null | string @go(PreferredMaintenanceWindow,*string)

	// PrimaryClusterId is the identifier of the cluster that serves as the
	// primary for this replication group. This cluster must already exist
	// and have a status of available.
	//
	// This parameter is not required if NumCacheClusters, NumNodeGroups or
	// ReplicasPerNodeGroup is specified.
	// +optional
	primaryClusterId?: null | string @go(PrimaryClusterID,*string)

	// ReplicasPerNodeGroup specifies the number of replica nodes in each node
	// group (shard). Valid values are 0 to 5.
	// +immutable
	// +optional
	replicasPerNodeGroup?: null | int @go(ReplicasPerNodeGroup,*int)

	// ReplicationGroupDescription is the description for the replication group.
	replicationGroupDescription: string @go(ReplicationGroupDescription)

	// SecurityGroupIDs specifies one or more Amazon VPC security groups
	// associated with this replication group. Use this parameter only when you
	// are creating a replication group in an Amazon VPC.
	// +optional
	securityGroupIds?: [...string] @go(SecurityGroupIDs,[]string)

	// SnapshotARNs specifies a list of Amazon Resource Names (ARN) that
	// uniquely identify the Redis RDB snapshot files stored in Amazon S3. The
	// snapshot files are used to populate the new replication group. The Amazon
	// S3 object name in the ARN cannot contain any commas. The new replication
	// group will have the number of node groups (console: shards) specified by
	// the parameter NumNodeGroups or the number of node groups configured by
	// NodeGroupConfigurationSpec regardless of the number of ARNs specified here.
	// +immutable
	// +optional
	snapshotArns?: [...string] @go(SnapshotARNs,[]string)

	// SnapshotName specifies the name of a snapshot from which to restore data
	// into the new replication group. The snapshot status changes to restoring
	// while the new replication group is being created.
	// +immutable
	// +optional
	snapshotName?: null | string @go(SnapshotName,*string)

	// SnapshotRetentionLimit specifies the number of days for which ElastiCache
	// retains automatic snapshots before deleting them. For example, if you set
	// SnapshotRetentionLimit to 5, a snapshot that was taken today is retained
	// for 5 days before being deleted.
	// Default: 0 (i.e., automatic backups are disabled for this cluster).
	// +optional
	snapshotRetentionLimit?: null | int @go(SnapshotRetentionLimit,*int)

	// SnapshotWindow specifies the daily time range (in UTC) during which
	// ElastiCache begins taking a daily snapshot of your node group (shard).
	//
	// Example: 05:00-09:00
	//
	// If you do not specify this parameter, ElastiCache automatically chooses an
	// appropriate time range.
	// +optional
	snapshotWindow?: null | string @go(SnapshotWindow,*string)

	// SnapshottingClusterID is used as the daily snapshot source for the replication
	// group. This parameter cannot be set for Redis (cluster mode enabled) replication
	// groups.
	// +optional
	snapshottingClusterID?: null | string @go(SnapshottingClusterID,*string)

	// A list of cost allocation tags to be added to this resource. A tag is a key-value
	// pair.
	// +optional
	tags?: [...#Tag] @go(Tags,[]Tag)

	// TransitEncryptionEnabled enables in-transit encryption when set to true.
	//
	// You cannot modify the value of TransitEncryptionEnabled after the cluster
	// is created. To enable in-transit encryption on a cluster you must
	// TransitEncryptionEnabled to true when you create a cluster.
	//
	// This parameter is valid only if the Engine parameter is redis, the EngineVersion
	// parameter is 3.2.6 or 4.x, and the cluster is being created in an Amazon
	// VPC.
	//
	// If you enable in-transit encryption, you must also specify a value for CacheSubnetGroup.
	//
	// Required: Only available when creating a replication group in an Amazon VPC
	// using redis version 3.2.6 or 4.x.
	//
	// Default: false
	//
	// For HIPAA compliance, you must specify TransitEncryptionEnabled as true,
	// an AuthToken, and a CacheSubnetGroup.
	// +immutable
	// +optional
	transitEncryptionEnabled?: null | bool @go(TransitEncryptionEnabled,*bool)
}

// A ReplicationGroupSpec defines the desired state of a ReplicationGroup.
#ReplicationGroupSpec: {
	forProvider: #ReplicationGroupParameters @go(ForProvider)
}

// A ReplicationGroupStatus defines the observed state of a ReplicationGroup.
#ReplicationGroupStatus: {
	atProvider?: #ReplicationGroupObservation @go(AtProvider)
}

// A ReplicationGroup is a managed resource that represents an AWS ElastiCache
// Replication Group.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="STATE",type="string",JSONPath=".status.atProvider.status"
// +kubebuilder:printcolumn:name="VERSION",type="string",JSONPath=".spec.forProvider.engineVersion"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ReplicationGroup: {
	spec:    #ReplicationGroupSpec   @go(Spec)
	status?: #ReplicationGroupStatus @go(Status)
}

// ReplicationGroupList contains a list of ReplicationGroup
#ReplicationGroupList: {
	items: [...#ReplicationGroup] @go(Items,[]ReplicationGroup)
}