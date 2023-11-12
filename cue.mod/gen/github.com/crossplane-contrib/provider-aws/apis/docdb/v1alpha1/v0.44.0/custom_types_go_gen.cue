// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/docdb/v1alpha1

package v1alpha1

// The instance is healthy and available
#DocDBInstanceStateAvailable: "available"

// The instance is being created. The instance is inaccessible while it is being created.
#DocDBInstanceStateCreating: "creating"

// The instance is being deleted.
#DocDBInstanceStateDeleting: "deleting"

// The instance is being modified.
#DocDBInstanceStateModifying: "modifying"

// The instance has failed and Amazon RDS can't recover it. Perform a point-in-time restore to the latest restorable time of the instance to recover the data.
#DocDBInstanceStateFailed: "failed"

// CustomDBInstanceParameters for DBInstance
#CustomDBInstanceParameters: {
	// Specifies whether the modifications in this request and any pending modifications
	// are asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow
	// setting for the instance.
	//
	// If this parameter is set to false, changes to the instance are applied during
	// the next maintenance window. Some parameter changes can cause an outage and
	// are applied on the next reboot.
	//
	// Default: false
	// +optional
	applyImmediately?: null | bool @go(ApplyImmediately,*bool)

	// The identifier of the CA certificate for this DB instance.
	// +optional
	caCertificateIdentifier?: null | string @go(CACertificateIdentifier,*string)

	// The identifier of the cluster this instance will belong to
	dbClusterIdentifier?: null | string @go(DBClusterIdentifier,*string)
}

// CustomDBSubnetGroupParameters for DBSubnetGroupParameters
#CustomDBSubnetGroupParameters: {
	subnetIDs?: [...null | string] @go(SubnetIDs,[]*string)
}

// CustomDBClusterParameterGroupParameters for DBClusterParameterGroup
#CustomDBClusterParameterGroupParameters: {
	// A list of parameters to associate with this DB parameter group.
	// The fields ApplyMethod, ParameterName and ParameterValue are required
	// for every parameter.
	// Note: AWS actually only modifies the ApplyMethod of a parameter,
	// if the ParameterValue changes too.
	// +optional
	parameters?: [...null | #CustomParameter] @go(Parameters,[]*CustomParameter)
}

// CustomDBClusterParameters for DBCluster
#CustomDBClusterParameters: {
	// A value that specifies whether the changes in this request and any pending
	// changes are asynchronously applied as soon as possible, regardless of the
	// PreferredMaintenanceWindow setting for the cluster. If this parameter is
	// set to false, changes to the cluster are applied during the next maintenance
	// window.
	//
	// The ApplyImmediately parameter affects only the NewDBClusterIdentifier and
	// MasterUserPassword values. If you set this parameter value to false, the
	// changes to the NewDBClusterIdentifier and MasterUserPassword values are applied
	// during the next maintenance window. All other changes are applied immediately,
	// regardless of the value of the ApplyImmediately parameter.
	//
	// Default: false
	// +optional
	applyImmediately?: null | bool @go(ApplyImmediately,*bool)

	// AutogeneratePassword indicates whether the controller should generate
	// a random password for the master user if one is not provided via
	// MasterUserPasswordSecretRef.
	//
	// If a password is generated, it will
	// be stored as a secret at the location specified by MasterUserPasswordSecretRef.
	// +optional
	autogeneratePassword?: bool @go(AutogeneratePassword)

	// Determines whether a final cluster snapshot is created before the cluster
	// is deleted. If true is specified, no cluster snapshot is created. If false
	// is specified, a cluster snapshot is created before the DB cluster is deleted.
	//
	// If SkipFinalSnapshot is false, you must specify a FinalDBSnapshotIdentifier
	// parameter.
	//
	// Default: false
	// +optional
	skipFinalSnapshot?: null | bool @go(SkipFinalSnapshot,*bool)

	// The cluster snapshot identifier of the new cluster snapshot created when
	// SkipFinalSnapshot is set to false.
	//
	// Specifying this parameter and also setting the SkipFinalShapshot parameter
	// to true results in an error.
	//
	// Constraints:
	//
	//    * Must be from 1 to 255 letters, numbers, or hyphens.
	//
	//    * The first character must be a letter.
	//
	//    * Cannot end with a hyphen or contain two consecutive hyphens.
	// +optional
	finalDBSnapshotIdentifier?: null | string @go(FinalDBSnapshotIdentifier,*string)

	// RestoreFrom specifies the details of the backup to restore when creating a new DBCluster.
	// +optional
	restoreFrom?: null | #RestoreDBClusterBackupConfiguration @go(RestoreFrom,*RestoreDBClusterBackupConfiguration)
}

// RestoreSnapshotConfiguration defines the details of the snapshot to restore from.
#RestoreSnapshotConfiguration: {
	// SnapshotIdentifier is the identifier of the snapshot to restore.
	snapshotIdentifier: string @go(SnapshotIdentifier)
}

// RestorePointInTimeConfiguration defines the details of the time to restore from
#RestorePointInTimeConfiguration: {
	// UseLatestRestorableTime indicates that the DB instance is restored from the latest backup
	// Can't be specified if the restoreTime parameter is provided.
	// +optional
	useLatestRestorableTime?: null | bool @go(UseLatestRestorableTime,*bool)

	// SourceDBClusterIdentifier specifies the identifier of the source DB cluster from which to restore. Constraints:
	// Must match the identifier of an existing DB instance.
	// +optional
	sourceDBClusterIdentifier: string @go(SourceDBClusterIdentifier)

	// The type of restore to be performed. You can specify one of the following
	// values:
	//
	//    * full-copy - The new DB cluster is restored as a full copy of the source
	//    DB cluster.
	//
	//    * copy-on-write - The new DB cluster is restored as a clone of the source
	//    DB cluster.
	//
	// Constraints: You can't specify copy-on-write if the engine version of the
	// source DB cluster is earlier than 1.11.
	//
	// If you don't specify a RestoreType value, then the new DB cluster is restored
	// as a full copy of the source DB cluster.
	//
	// Valid for: Aurora DB clusters and Multi-AZ DB clusters
	// +optional
	// +kubebuilder:validation:Enum=full-copy;copy-on-write
	restoreType?: null | string @go(RestoreType,*string)
}

// RestoreSource specifies the data source for a DocumentDB restore.
#RestoreSource: string

#RestoreSourceSnapshot:    "Snapshot"
#RestoreSourcePointInTime: "PointInTime"

// RestoreDBClusterBackupConfiguration defines the backup to restore a new DBCluster from.
#RestoreDBClusterBackupConfiguration: {
	// Snapshot specifies the details of the snapshot to restore from.
	// +optional
	snapshot?: null | #RestoreSnapshotConfiguration @go(Snapshot,*RestoreSnapshotConfiguration)

	// PointInTime specifies the details of the point in time restore.
	// +optional
	pointInTime?: null | #RestorePointInTimeConfiguration @go(PointInTime,*RestorePointInTimeConfiguration)

	// Source is the type of the backup to restore when creating a new  DBCluster or DBInstance.
	// Snapshot and PointInTime are supported.
	// +kubebuilder:validation:Enum=Snapshot;PointInTime
	source: #RestoreSource @go(Source)
}

// CustomParameter are custom parameters for the Parameter
#CustomParameter: {
	// The apply method of the parameter.
	// AWS actually only modifies to value set here, if the parameter value changes too.
	// +kubebuilder:validation:Enum=immediate;pending-reboot
	// +kubebuilder:validation:Required
	applyMethod?: null | string @go(ApplyMethod,*string)

	// The name of the parameter.
	// +kubebuilder:validation:Required
	parameterName?: null | string @go(ParameterName,*string)

	// The value of the parameter.
	// +kubebuilder:validation:Required
	parameterValue?: null | string @go(ParameterValue,*string)
}