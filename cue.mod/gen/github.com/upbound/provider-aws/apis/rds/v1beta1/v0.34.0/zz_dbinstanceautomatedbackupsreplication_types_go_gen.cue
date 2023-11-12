// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/rds/v1beta1

package v1beta1

#DBInstanceAutomatedBackupsReplicationObservation: {
	// The Amazon Resource Name (ARN) of the replicated automated backups.
	id?: null | string @go(ID,*string)

	// The AWS KMS key identifier for encryption of the replicated automated backups. The KMS key ID is the Amazon Resource Name (ARN) for the KMS encryption key in the destination AWS Region, for example, arn:aws:kms:us-east-1:123456789012:key/AKIAIOSFODNN7EXAMPLE.
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// A URL that contains a Signature Version 4 signed request for the StartDBInstanceAutomatedBackupsReplication action to be called in the AWS Region of the source DB instance.
	preSignedUrl?: null | string @go(PreSignedURL,*string)

	// The retention period for the replicated automated backups, defaults to 7.
	retentionPeriod?: null | float64 @go(RetentionPeriod,*float64)

	// The Amazon Resource Name (ARN) of the source DB instance for the replicated automated backups, for example, arn:aws:rds:us-west-2:123456789012:db:mydatabase.
	sourceDbInstanceArn?: null | string @go(SourceDBInstanceArn,*string)
}

#DBInstanceAutomatedBackupsReplicationParameters: {
	// The AWS KMS key identifier for encryption of the replicated automated backups. The KMS key ID is the Amazon Resource Name (ARN) for the KMS encryption key in the destination AWS Region, for example, arn:aws:kms:us-east-1:123456789012:key/AKIAIOSFODNN7EXAMPLE.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/kms/v1beta1.Key
	// +kubebuilder:validation:Optional
	kmsKeyId?: null | string @go(KMSKeyID,*string)

	// A URL that contains a Signature Version 4 signed request for the StartDBInstanceAutomatedBackupsReplication action to be called in the AWS Region of the source DB instance.
	// +kubebuilder:validation:Optional
	preSignedUrl?: null | string @go(PreSignedURL,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The retention period for the replicated automated backups, defaults to 7.
	// +kubebuilder:validation:Optional
	retentionPeriod?: null | float64 @go(RetentionPeriod,*float64)

	// The Amazon Resource Name (ARN) of the source DB instance for the replicated automated backups, for example, arn:aws:rds:us-west-2:123456789012:db:mydatabase.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/rds/v1beta1.Instance
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	sourceDbInstanceArn?: null | string @go(SourceDBInstanceArn,*string)
}

// DBInstanceAutomatedBackupsReplicationSpec defines the desired state of DBInstanceAutomatedBackupsReplication
#DBInstanceAutomatedBackupsReplicationSpec: {
	forProvider: #DBInstanceAutomatedBackupsReplicationParameters @go(ForProvider)
}

// DBInstanceAutomatedBackupsReplicationStatus defines the observed state of DBInstanceAutomatedBackupsReplication.
#DBInstanceAutomatedBackupsReplicationStatus: {
	atProvider?: #DBInstanceAutomatedBackupsReplicationObservation @go(AtProvider)
}

// DBInstanceAutomatedBackupsReplication is the Schema for the DBInstanceAutomatedBackupsReplications API. Enables replication of automated backups to a different AWS Region.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DBInstanceAutomatedBackupsReplication: {
	spec:    #DBInstanceAutomatedBackupsReplicationSpec   @go(Spec)
	status?: #DBInstanceAutomatedBackupsReplicationStatus @go(Status)
}

// DBInstanceAutomatedBackupsReplicationList contains a list of DBInstanceAutomatedBackupsReplications
#DBInstanceAutomatedBackupsReplicationList: {
	items: [...#DBInstanceAutomatedBackupsReplication] @go(Items,[]DBInstanceAutomatedBackupsReplication)
}