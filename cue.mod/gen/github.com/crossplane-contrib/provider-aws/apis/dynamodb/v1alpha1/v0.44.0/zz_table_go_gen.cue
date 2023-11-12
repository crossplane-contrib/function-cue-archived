// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/dynamodb/v1alpha1

package v1alpha1

// TableParameters defines the desired state of Table
#TableParameters: {
	// Region is which region the Table will be created.
	// +kubebuilder:validation:Required
	region: string @go(Region)

	// An array of attributes that describe the key schema for the table and indexes.
	// +kubebuilder:validation:Required
	attributeDefinitions: [...null | #AttributeDefinition] @go(AttributeDefinitions,[]*AttributeDefinition)

	// Controls how you are charged for read and write throughput and how you manage
	// capacity. This setting can be changed later.
	//
	//    * PROVISIONED - We recommend using PROVISIONED for predictable workloads.
	//    PROVISIONED sets the billing mode to Provisioned Mode (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.ProvisionedThroughput.Manual).
	//
	//    * PAY_PER_REQUEST - We recommend using PAY_PER_REQUEST for unpredictable
	//    workloads. PAY_PER_REQUEST sets the billing mode to On-Demand Mode (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.OnDemand).
	billingMode?: null | string @go(BillingMode,*string)

	// Indicates whether deletion protection is to be enabled (true) or disabled
	// (false) on the table.
	deletionProtectionEnabled?: null | bool @go(DeletionProtectionEnabled,*bool)

	// One or more global secondary indexes (the maximum is 20) to be created on
	// the table. Each global secondary index in the array includes the following:
	//
	//    * IndexName - The name of the global secondary index. Must be unique only
	//    for this table.
	//
	//    * KeySchema - Specifies the key schema for the global secondary index.
	//
	//    * Projection - Specifies attributes that are copied (projected) from the
	//    table into the index. These are in addition to the primary key attributes
	//    and index key attributes, which are automatically projected. Each attribute
	//    specification is composed of: ProjectionType - One of the following: KEYS_ONLY
	//    - Only the index and primary keys are projected into the index. INCLUDE
	//    - Only the specified table attributes are projected into the index. The
	//    list of projected attributes is in NonKeyAttributes. ALL - All of the
	//    table attributes are projected into the index. NonKeyAttributes - A list
	//    of one or more non-key attribute names that are projected into the secondary
	//    index. The total count of attributes provided in NonKeyAttributes, summed
	//    across all of the secondary indexes, must not exceed 100. If you project
	//    the same attribute into two different indexes, this counts as two distinct
	//    attributes when determining the total.
	//
	//    * ProvisionedThroughput - The provisioned throughput settings for the
	//    global secondary index, consisting of read and write capacity units.
	globalSecondaryIndexes?: [...null | #GlobalSecondaryIndex] @go(GlobalSecondaryIndexes,[]*GlobalSecondaryIndex)

	// Specifies the attributes that make up the primary key for a table or an index.
	// The attributes in KeySchema must also be defined in the AttributeDefinitions
	// array. For more information, see Data Model (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html)
	// in the Amazon DynamoDB Developer Guide.
	//
	// Each KeySchemaElement in the array is composed of:
	//
	//    * AttributeName - The name of this key attribute.
	//
	//    * KeyType - The role that the key attribute will assume: HASH - partition
	//    key RANGE - sort key
	//
	// The partition key of an item is also known as its hash attribute. The term
	// "hash attribute" derives from the DynamoDB usage of an internal hash function
	// to evenly distribute data items across partitions, based on their partition
	// key values.
	//
	// The sort key of an item is also known as its range attribute. The term "range
	// attribute" derives from the way DynamoDB stores items with the same partition
	// key physically close together, in sorted order by the sort key value.
	//
	// For a simple primary key (partition key), you must provide exactly one element
	// with a KeyType of HASH.
	//
	// For a composite primary key (partition key and sort key), you must provide
	// exactly two elements, in this order: The first element must have a KeyType
	// of HASH, and the second element must have a KeyType of RANGE.
	//
	// For more information, see Working with Tables (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key)
	// in the Amazon DynamoDB Developer Guide.
	// +kubebuilder:validation:Required
	keySchema: [...null | #KeySchemaElement] @go(KeySchema,[]*KeySchemaElement)

	// One or more local secondary indexes (the maximum is 5) to be created on the
	// table. Each index is scoped to a given partition key value. There is a 10
	// GB size limit per partition key value; otherwise, the size of a local secondary
	// index is unconstrained.
	//
	// Each local secondary index in the array includes the following:
	//
	//    * IndexName - The name of the local secondary index. Must be unique only
	//    for this table.
	//
	//    * KeySchema - Specifies the key schema for the local secondary index.
	//    The key schema must begin with the same partition key as the table.
	//
	//    * Projection - Specifies attributes that are copied (projected) from the
	//    table into the index. These are in addition to the primary key attributes
	//    and index key attributes, which are automatically projected. Each attribute
	//    specification is composed of: ProjectionType - One of the following: KEYS_ONLY
	//    - Only the index and primary keys are projected into the index. INCLUDE
	//    - Only the specified table attributes are projected into the index. The
	//    list of projected attributes is in NonKeyAttributes. ALL - All of the
	//    table attributes are projected into the index. NonKeyAttributes - A list
	//    of one or more non-key attribute names that are projected into the secondary
	//    index. The total count of attributes provided in NonKeyAttributes, summed
	//    across all of the secondary indexes, must not exceed 100. If you project
	//    the same attribute into two different indexes, this counts as two distinct
	//    attributes when determining the total.
	localSecondaryIndexes?: [...null | #LocalSecondaryIndex] @go(LocalSecondaryIndexes,[]*LocalSecondaryIndex)

	// Indicates whether point in time recovery is enabled (true) or disabled (false)
	// on the table.
	pointInTimeRecoveryEnabled?: null | bool @go(PointInTimeRecoveryEnabled,*bool)

	// Represents the provisioned throughput settings for a specified table or index.
	// The settings can be modified using the UpdateTable operation.
	//
	// If you set BillingMode as PROVISIONED, you must specify this property. If
	// you set BillingMode as PAY_PER_REQUEST, you cannot specify this property.
	//
	// For current minimum and maximum provisioned throughput values, see Service,
	// Account, and Table Quotas (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
	// in the Amazon DynamoDB Developer Guide.
	provisionedThroughput?: null | #ProvisionedThroughput @go(ProvisionedThroughput,*ProvisionedThroughput)

	// Represents the settings used to enable server-side encryption.
	sseSpecification?: null | #SSESpecification @go(SSESpecification,*SSESpecification)

	// The settings for DynamoDB Streams on the table. These settings consist of:
	//
	//    * StreamEnabled - Indicates whether DynamoDB Streams is to be enabled
	//    (true) or disabled (false).
	//
	//    * StreamViewType - When an item in the table is modified, StreamViewType
	//    determines what information is written to the table's stream. Valid values
	//    for StreamViewType are: KEYS_ONLY - Only the key attributes of the modified
	//    item are written to the stream. NEW_IMAGE - The entire item, as it appears
	//    after it was modified, is written to the stream. OLD_IMAGE - The entire
	//    item, as it appeared before it was modified, is written to the stream.
	//    NEW_AND_OLD_IMAGES - Both the new and the old item images of the item
	//    are written to the stream.
	streamSpecification?: null | #StreamSpecification @go(StreamSpecification,*StreamSpecification)

	// The table class of the new table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS.
	tableClass?: null | string @go(TableClass,*string)

	// A list of key-value pairs to label the table. For more information, see Tagging
	// for DynamoDB (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html).
	tags?: [...null | #Tag] @go(Tags,[]*Tag)

	#CustomTableParameters
}

// TableSpec defines the desired state of Table
#TableSpec: {
	forProvider: #TableParameters @go(ForProvider)
}

// TableObservation defines the observed state of Table
#TableObservation: {
	// Contains information about the table archive.
	archivalSummary?: null | #ArchivalSummary @go(ArchivalSummary,*ArchivalSummary)

	// Contains the details for the read/write capacity mode.
	billingModeSummary?: null | #BillingModeSummary @go(BillingModeSummary,*BillingModeSummary)

	// Represents the version of global tables (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html)
	// in use, if the table is replicated across Amazon Web Services Regions.
	globalTableVersion?: null | string @go(GlobalTableVersion,*string)

	// The number of items in the specified table. DynamoDB updates this value approximately
	// every six hours. Recent changes might not be reflected in this value.
	itemCount?: null | int64 @go(ItemCount,*int64)

	// The Amazon Resource Name (ARN) that uniquely identifies the latest stream
	// for this table.
	latestStreamARN?: null | string @go(LatestStreamARN,*string)

	// A timestamp, in ISO 8601 format, for this stream.
	//
	// Note that LatestStreamLabel is not a unique identifier for the stream, because
	// it is possible that a stream from another table might have the same timestamp.
	// However, the combination of the following three elements is guaranteed to
	// be unique:
	//
	//    * Amazon Web Services customer ID
	//
	//    * Table name
	//
	//    * StreamLabel
	latestStreamLabel?: null | string @go(LatestStreamLabel,*string)

	// Represents replicas of the table.
	replicas?: [...null | #ReplicaDescription] @go(Replicas,[]*ReplicaDescription)

	// Contains details for the restore.
	restoreSummary?: null | #RestoreSummary @go(RestoreSummary,*RestoreSummary)

	// The description of the server-side encryption status on the specified table.
	sseDescription?: null | #SSEDescription @go(SSEDescription,*SSEDescription)

	// The Amazon Resource Name (ARN) that uniquely identifies the table.
	tableARN?: null | string @go(TableARN,*string)

	// Contains details of the table class.
	tableClassSummary?: null | #TableClassSummary @go(TableClassSummary,*TableClassSummary)

	// Unique identifier for the table for which the backup was created.
	tableID?: null | string @go(TableID,*string)

	// The name of the table.
	tableName?: null | string @go(TableName,*string)

	// The total size of the specified table, in bytes. DynamoDB updates this value
	// approximately every six hours. Recent changes might not be reflected in this
	// value.
	tableSizeBytes?: null | int64 @go(TableSizeBytes,*int64)

	// The current state of the table:
	//
	//    * CREATING - The table is being created.
	//
	//    * UPDATING - The table/index configuration is being updated. The table/index
	//    remains available for data operations when UPDATING.
	//
	//    * DELETING - The table is being deleted.
	//
	//    * ACTIVE - The table is ready for use.
	//
	//    * INACCESSIBLE_ENCRYPTION_CREDENTIALS - The KMS key used to encrypt the
	//    table in inaccessible. Table operations may fail due to failure to use
	//    the KMS key. DynamoDB will initiate the table archival process when a
	//    table's KMS key remains inaccessible for more than seven days.
	//
	//    * ARCHIVING - The table is being archived. Operations are not allowed
	//    until archival is complete.
	//
	//    * ARCHIVED - The table has been archived. See the ArchivalReason for more
	//    information.
	tableStatus?: null | string @go(TableStatus,*string)
}

// TableStatus defines the observed state of Table.
#TableStatus: {
	atProvider?: #TableObservation @go(AtProvider)
}

// Table is the Schema for the Tables API
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:storageversion
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Table: {
	spec:    #TableSpec   @go(Spec)
	status?: #TableStatus @go(Status)
}

// TableList contains a list of Tables
#TableList: {
	items: [...#Table] @go(Items,[]Table)
}