// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudwatch/v1beta1

package v1beta1

#DashboardObservation: {
	// The Amazon Resource Name (ARN) of the dashboard.
	dashboardArn?: null | string @go(DashboardArn,*string)

	// The detailed information about the dashboard, including what widgets are included and their location on the dashboard. You can read more about the body structure in the documentation.
	dashboardBody?: null | string @go(DashboardBody,*string)
	id?:            null | string @go(ID,*string)
}

#DashboardParameters: {
	// The detailed information about the dashboard, including what widgets are included and their location on the dashboard. You can read more about the body structure in the documentation.
	// +kubebuilder:validation:Optional
	dashboardBody?: null | string @go(DashboardBody,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// DashboardSpec defines the desired state of Dashboard
#DashboardSpec: {
	forProvider: #DashboardParameters @go(ForProvider)
}

// DashboardStatus defines the observed state of Dashboard.
#DashboardStatus: {
	atProvider?: #DashboardObservation @go(AtProvider)
}

// Dashboard is the Schema for the Dashboards API. Provides a CloudWatch Dashboard resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Dashboard: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.dashboardBody)",message="dashboardBody is a required parameter"
	spec:    #DashboardSpec   @go(Spec)
	status?: #DashboardStatus @go(Status)
}

// DashboardList contains a list of Dashboards
#DashboardList: {
	items: [...#Dashboard] @go(Items,[]Dashboard)
}