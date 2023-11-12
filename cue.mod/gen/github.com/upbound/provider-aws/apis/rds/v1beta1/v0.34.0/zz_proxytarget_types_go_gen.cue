// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/rds/v1beta1

package v1beta1

#ProxyTargetObservation: {
	// DB cluster identifier.
	dbClusterIdentifier?: null | string @go(DBClusterIdentifier,*string)

	// DB instance identifier.
	dbInstanceIdentifier?: null | string @go(DBInstanceIdentifier,*string)

	// The name of the DB proxy.
	dbProxyName?: null | string @go(DBProxyName,*string)

	// Hostname for the target RDS DB Instance. Only returned for RDS_INSTANCE type.
	endpoint?: null | string @go(Endpoint,*string)

	// Identifier of  db_proxy_name, target_group_name, target type (e.g., RDS_INSTANCE or TRACKED_CLUSTER), and resource identifier separated by forward slashes (/).
	id?: null | string @go(ID,*string)

	// Port for the target RDS DB Instance or Aurora DB Cluster.
	port?: null | float64 @go(Port,*float64)

	// Identifier representing the DB Instance or DB Cluster target.
	rdsResourceId?: null | string @go(RDSResourceID,*string)

	// Amazon Resource Name (ARN) for the DB instance or DB cluster. Currently not returned by the RDS API.
	targetArn?: null | string @go(TargetArn,*string)

	// The name of the target group.
	targetGroupName?: null | string @go(TargetGroupName,*string)

	// DB Cluster identifier for the DB Instance target. Not returned unless manually importing an RDS_INSTANCE target that is part of a DB Cluster.
	trackedClusterId?: null | string @go(TrackedClusterID,*string)

	// Type of targetE.g., RDS_INSTANCE or TRACKED_CLUSTER
	type?: null | string @go(Type,*string)
}

#ProxyTargetParameters: {
	// DB cluster identifier.
	// +kubebuilder:validation:Optional
	dbClusterIdentifier?: null | string @go(DBClusterIdentifier,*string)

	// DB instance identifier.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/rds/v1beta1.Instance
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dbInstanceIdentifier?: null | string @go(DBInstanceIdentifier,*string)

	// The name of the DB proxy.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/rds/v1beta1.Proxy
	// +kubebuilder:validation:Optional
	dbProxyName?: null | string @go(DBProxyName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The name of the target group.
	// +kubebuilder:validation:Optional
	targetGroupName?: null | string @go(TargetGroupName,*string)
}

// ProxyTargetSpec defines the desired state of ProxyTarget
#ProxyTargetSpec: {
	forProvider: #ProxyTargetParameters @go(ForProvider)
}

// ProxyTargetStatus defines the observed state of ProxyTarget.
#ProxyTargetStatus: {
	atProvider?: #ProxyTargetObservation @go(AtProvider)
}

// ProxyTarget is the Schema for the ProxyTargets API. Provides an RDS DB proxy target resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ProxyTarget: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.targetGroupName)",message="targetGroupName is a required parameter"
	spec:    #ProxyTargetSpec   @go(Spec)
	status?: #ProxyTargetStatus @go(Status)
}

// ProxyTargetList contains a list of ProxyTargets
#ProxyTargetList: {
	items: [...#ProxyTarget] @go(Items,[]ProxyTarget)
}