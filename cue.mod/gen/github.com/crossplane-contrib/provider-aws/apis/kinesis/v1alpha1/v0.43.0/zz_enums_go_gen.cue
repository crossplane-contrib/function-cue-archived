// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/kinesis/v1alpha1

package v1alpha1

#ConsumerStatus: string // #enumConsumerStatus

#enumConsumerStatus:
	#ConsumerStatus_CREATING |
	#ConsumerStatus_DELETING |
	#ConsumerStatus_ACTIVE

#ConsumerStatus_CREATING: #ConsumerStatus & "CREATING"
#ConsumerStatus_DELETING: #ConsumerStatus & "DELETING"
#ConsumerStatus_ACTIVE:   #ConsumerStatus & "ACTIVE"

#EncryptionType: string // #enumEncryptionType

#enumEncryptionType:
	#EncryptionType_NONE |
	#EncryptionType_KMS

#EncryptionType_NONE: #EncryptionType & "NONE"
#EncryptionType_KMS:  #EncryptionType & "KMS"

#MetricsName: string // #enumMetricsName

#enumMetricsName:
	#MetricsName_IncomingBytes |
	#MetricsName_IncomingRecords |
	#MetricsName_OutgoingBytes |
	#MetricsName_OutgoingRecords |
	#MetricsName_WriteProvisionedThroughputExceeded |
	#MetricsName_ReadProvisionedThroughputExceeded |
	#MetricsName_IteratorAgeMilliseconds |
	#MetricsName_ALL

#MetricsName_IncomingBytes:                      #MetricsName & "IncomingBytes"
#MetricsName_IncomingRecords:                    #MetricsName & "IncomingRecords"
#MetricsName_OutgoingBytes:                      #MetricsName & "OutgoingBytes"
#MetricsName_OutgoingRecords:                    #MetricsName & "OutgoingRecords"
#MetricsName_WriteProvisionedThroughputExceeded: #MetricsName & "WriteProvisionedThroughputExceeded"
#MetricsName_ReadProvisionedThroughputExceeded:  #MetricsName & "ReadProvisionedThroughputExceeded"
#MetricsName_IteratorAgeMilliseconds:            #MetricsName & "IteratorAgeMilliseconds"
#MetricsName_ALL:                                #MetricsName & "ALL"

#ScalingType: string // #enumScalingType

#enumScalingType:
	#ScalingType_UNIFORM_SCALING

#ScalingType_UNIFORM_SCALING: #ScalingType & "UNIFORM_SCALING"

#ShardFilterType: string // #enumShardFilterType

#enumShardFilterType:
	#ShardFilterType_AFTER_SHARD_ID |
	#ShardFilterType_AT_TRIM_HORIZON |
	#ShardFilterType_FROM_TRIM_HORIZON |
	#ShardFilterType_AT_LATEST |
	#ShardFilterType_AT_TIMESTAMP |
	#ShardFilterType_FROM_TIMESTAMP

#ShardFilterType_AFTER_SHARD_ID:    #ShardFilterType & "AFTER_SHARD_ID"
#ShardFilterType_AT_TRIM_HORIZON:   #ShardFilterType & "AT_TRIM_HORIZON"
#ShardFilterType_FROM_TRIM_HORIZON: #ShardFilterType & "FROM_TRIM_HORIZON"
#ShardFilterType_AT_LATEST:         #ShardFilterType & "AT_LATEST"
#ShardFilterType_AT_TIMESTAMP:      #ShardFilterType & "AT_TIMESTAMP"
#ShardFilterType_FROM_TIMESTAMP:    #ShardFilterType & "FROM_TIMESTAMP"

#ShardIteratorType: string // #enumShardIteratorType

#enumShardIteratorType:
	#ShardIteratorType_AT_SEQUENCE_NUMBER |
	#ShardIteratorType_AFTER_SEQUENCE_NUMBER |
	#ShardIteratorType_TRIM_HORIZON |
	#ShardIteratorType_LATEST |
	#ShardIteratorType_AT_TIMESTAMP

#ShardIteratorType_AT_SEQUENCE_NUMBER:    #ShardIteratorType & "AT_SEQUENCE_NUMBER"
#ShardIteratorType_AFTER_SEQUENCE_NUMBER: #ShardIteratorType & "AFTER_SEQUENCE_NUMBER"
#ShardIteratorType_TRIM_HORIZON:          #ShardIteratorType & "TRIM_HORIZON"
#ShardIteratorType_LATEST:                #ShardIteratorType & "LATEST"
#ShardIteratorType_AT_TIMESTAMP:          #ShardIteratorType & "AT_TIMESTAMP"

#StreamMode: string // #enumStreamMode

#enumStreamMode:
	#StreamMode_PROVISIONED |
	#StreamMode_ON_DEMAND

#StreamMode_PROVISIONED: #StreamMode & "PROVISIONED"
#StreamMode_ON_DEMAND:   #StreamMode & "ON_DEMAND"

#StreamStatus_SDK: string // #enumStreamStatus_SDK

#enumStreamStatus_SDK:
	#StreamStatus_SDK_CREATING |
	#StreamStatus_SDK_DELETING |
	#StreamStatus_SDK_ACTIVE |
	#StreamStatus_SDK_UPDATING

#StreamStatus_SDK_CREATING: #StreamStatus_SDK & "CREATING"
#StreamStatus_SDK_DELETING: #StreamStatus_SDK & "DELETING"
#StreamStatus_SDK_ACTIVE:   #StreamStatus_SDK & "ACTIVE"
#StreamStatus_SDK_UPDATING: #StreamStatus_SDK & "UPDATING"