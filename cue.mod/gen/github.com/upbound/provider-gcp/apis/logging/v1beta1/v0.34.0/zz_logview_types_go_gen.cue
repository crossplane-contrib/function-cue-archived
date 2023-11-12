// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/logging/v1beta1

package v1beta1

#LogViewObservation: {
	// The bucket of the resource
	bucket?: null | string @go(Bucket,*string)

	// Output only. The creation timestamp of the view.
	createTime?: null | string @go(CreateTime,*string)

	// Describes this view.
	description?: null | string @go(Description,*string)

	// Filter that restricts which log entries in a bucket are visible in this view. Filters are restricted to be a logical AND of ==/!= of any of the following: - originating project/folder/organization/billing account. - resource type - log id For example: SOURCE("projects/myproject") AND resource.type = "gce_instance" AND LOG_ID("stdout")
	filter?: null | string @go(Filter,*string)

	// an identifier for the resource with format {{parent}}/locations/{{location}}/buckets/{{bucket}}/views/{{name}}
	id?: null | string @go(ID,*string)

	// The location of the resource. The supported locations are: global, us-central1, us-east1, us-west1, asia-east1, europe-west1.
	location?: null | string @go(Location,*string)

	// The parent of the resource.
	parent?: null | string @go(Parent,*string)

	// Output only. The last update timestamp of the view.
	updateTime?: null | string @go(UpdateTime,*string)
}

#LogViewParameters: {
	// The bucket of the resource
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/logging/v1beta1.ProjectBucketConfig
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	bucket?: null | string @go(Bucket,*string)

	// Describes this view.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Filter that restricts which log entries in a bucket are visible in this view. Filters are restricted to be a logical AND of ==/!= of any of the following: - originating project/folder/organization/billing account. - resource type - log id For example: SOURCE("projects/myproject") AND resource.type = "gce_instance" AND LOG_ID("stdout")
	// +kubebuilder:validation:Optional
	filter?: null | string @go(Filter,*string)

	// The location of the resource. The supported locations are: global, us-central1, us-east1, us-west1, asia-east1, europe-west1.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// The parent of the resource.
	// +kubebuilder:validation:Optional
	parent?: null | string @go(Parent,*string)
}

// LogViewSpec defines the desired state of LogView
#LogViewSpec: {
	forProvider: #LogViewParameters @go(ForProvider)
}

// LogViewStatus defines the observed state of LogView.
#LogViewStatus: {
	atProvider?: #LogViewObservation @go(AtProvider)
}

// LogView is the Schema for the LogViews API. Describes a view over log entries in a bucket.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#LogView: {
	spec:    #LogViewSpec   @go(Spec)
	status?: #LogViewStatus @go(Status)
}

// LogViewList contains a list of LogViews
#LogViewList: {
	items: [...#LogView] @go(Items,[]LogView)
}