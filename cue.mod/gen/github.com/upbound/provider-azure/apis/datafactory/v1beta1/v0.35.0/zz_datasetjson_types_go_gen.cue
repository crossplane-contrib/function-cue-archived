// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/datafactory/v1beta1

package v1beta1

#DataSetJSONAzureBlobStorageLocationInitParameters: {
	// The container on the Azure Blob Storage Account hosting the file.
	container?: null | string @go(Container,*string)

	// Is the container using dynamic expression, function or system variables? Defaults to false.
	dynamicContainerEnabled?: null | bool @go(DynamicContainerEnabled,*bool)

	// Is the filename using dynamic expression, function or system variables? Defaults to false.
	dynamicFilenameEnabled?: null | bool @go(DynamicFilenameEnabled,*bool)

	// Is the path using dynamic expression, function or system variables? Defaults to false.
	dynamicPathEnabled?: null | bool @go(DynamicPathEnabled,*bool)

	// The filename of the file on the web server.
	filename?: null | string @go(Filename,*string)

	// The folder path to the file on the web server.
	path?: null | string @go(Path,*string)
}

#DataSetJSONAzureBlobStorageLocationObservation: {
	// The container on the Azure Blob Storage Account hosting the file.
	container?: null | string @go(Container,*string)

	// Is the container using dynamic expression, function or system variables? Defaults to false.
	dynamicContainerEnabled?: null | bool @go(DynamicContainerEnabled,*bool)

	// Is the filename using dynamic expression, function or system variables? Defaults to false.
	dynamicFilenameEnabled?: null | bool @go(DynamicFilenameEnabled,*bool)

	// Is the path using dynamic expression, function or system variables? Defaults to false.
	dynamicPathEnabled?: null | bool @go(DynamicPathEnabled,*bool)

	// The filename of the file on the web server.
	filename?: null | string @go(Filename,*string)

	// The folder path to the file on the web server.
	path?: null | string @go(Path,*string)
}

#DataSetJSONAzureBlobStorageLocationParameters: {
	// The container on the Azure Blob Storage Account hosting the file.
	// +kubebuilder:validation:Optional
	container?: null | string @go(Container,*string)

	// Is the container using dynamic expression, function or system variables? Defaults to false.
	// +kubebuilder:validation:Optional
	dynamicContainerEnabled?: null | bool @go(DynamicContainerEnabled,*bool)

	// Is the filename using dynamic expression, function or system variables? Defaults to false.
	// +kubebuilder:validation:Optional
	dynamicFilenameEnabled?: null | bool @go(DynamicFilenameEnabled,*bool)

	// Is the path using dynamic expression, function or system variables? Defaults to false.
	// +kubebuilder:validation:Optional
	dynamicPathEnabled?: null | bool @go(DynamicPathEnabled,*bool)

	// The filename of the file on the web server.
	// +kubebuilder:validation:Optional
	filename?: null | string @go(Filename,*string)

	// The folder path to the file on the web server.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)
}

#DataSetJSONHTTPServerLocationInitParameters: {
	// Is the filename using dynamic expression, function or system variables? Defaults to false.
	dynamicFilenameEnabled?: null | bool @go(DynamicFilenameEnabled,*bool)

	// Is the path using dynamic expression, function or system variables? Defaults to false.
	dynamicPathEnabled?: null | bool @go(DynamicPathEnabled,*bool)

	// The filename of the file on the web server.
	filename?: null | string @go(Filename,*string)

	// The folder path to the file on the web server.
	path?: null | string @go(Path,*string)

	// The base URL to the web server hosting the file.
	relativeUrl?: null | string @go(RelativeURL,*string)
}

#DataSetJSONHTTPServerLocationObservation: {
	// Is the filename using dynamic expression, function or system variables? Defaults to false.
	dynamicFilenameEnabled?: null | bool @go(DynamicFilenameEnabled,*bool)

	// Is the path using dynamic expression, function or system variables? Defaults to false.
	dynamicPathEnabled?: null | bool @go(DynamicPathEnabled,*bool)

	// The filename of the file on the web server.
	filename?: null | string @go(Filename,*string)

	// The folder path to the file on the web server.
	path?: null | string @go(Path,*string)

	// The base URL to the web server hosting the file.
	relativeUrl?: null | string @go(RelativeURL,*string)
}

#DataSetJSONHTTPServerLocationParameters: {
	// Is the filename using dynamic expression, function or system variables? Defaults to false.
	// +kubebuilder:validation:Optional
	dynamicFilenameEnabled?: null | bool @go(DynamicFilenameEnabled,*bool)

	// Is the path using dynamic expression, function or system variables? Defaults to false.
	// +kubebuilder:validation:Optional
	dynamicPathEnabled?: null | bool @go(DynamicPathEnabled,*bool)

	// The filename of the file on the web server.
	// +kubebuilder:validation:Optional
	filename?: null | string @go(Filename,*string)

	// The folder path to the file on the web server.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)

	// The base URL to the web server hosting the file.
	// +kubebuilder:validation:Optional
	relativeUrl?: null | string @go(RelativeURL,*string)
}

#DataSetJSONInitParameters: {
	// A map of additional properties to associate with the Data Factory Dataset.
	additionalProperties?: {[string]: null | string} @go(AdditionalProperties,map[string]*string)

	// List of tags that can be used for describing the Data Factory Dataset.
	annotations?: [...null | string] @go(Annotations,[]*string)

	// A azure_blob_storage_location block as defined below.
	azureBlobStorageLocation?: [...#DataSetJSONAzureBlobStorageLocationInitParameters] @go(AzureBlobStorageLocation,[]DataSetJSONAzureBlobStorageLocationInitParameters)

	// The description for the Data Factory Dataset.
	description?: null | string @go(Description,*string)

	// The encoding format for the file.
	encoding?: null | string @go(Encoding,*string)

	// The folder that this Dataset is in. If not specified, the Dataset will appear at the root level.
	folder?: null | string @go(Folder,*string)

	// A http_server_location block as defined below.
	httpServerLocation?: [...#DataSetJSONHTTPServerLocationInitParameters] @go(HTTPServerLocation,[]DataSetJSONHTTPServerLocationInitParameters)

	// A map of parameters to associate with the Data Factory Dataset.
	parameters?: {[string]: null | string} @go(Parameters,map[string]*string)

	// A schema_column block as defined below.
	schemaColumn?: [...#DataSetJSONSchemaColumnInitParameters] @go(SchemaColumn,[]DataSetJSONSchemaColumnInitParameters)
}

#DataSetJSONObservation: {
	// A map of additional properties to associate with the Data Factory Dataset.
	additionalProperties?: {[string]: null | string} @go(AdditionalProperties,map[string]*string)

	// List of tags that can be used for describing the Data Factory Dataset.
	annotations?: [...null | string] @go(Annotations,[]*string)

	// A azure_blob_storage_location block as defined below.
	azureBlobStorageLocation?: [...#DataSetJSONAzureBlobStorageLocationObservation] @go(AzureBlobStorageLocation,[]DataSetJSONAzureBlobStorageLocationObservation)

	// The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource.
	dataFactoryId?: null | string @go(DataFactoryID,*string)

	// The description for the Data Factory Dataset.
	description?: null | string @go(Description,*string)

	// The encoding format for the file.
	encoding?: null | string @go(Encoding,*string)

	// The folder that this Dataset is in. If not specified, the Dataset will appear at the root level.
	folder?: null | string @go(Folder,*string)

	// A http_server_location block as defined below.
	httpServerLocation?: [...#DataSetJSONHTTPServerLocationObservation] @go(HTTPServerLocation,[]DataSetJSONHTTPServerLocationObservation)

	// The ID of the Data Factory Dataset.
	id?: null | string @go(ID,*string)

	// The Data Factory Linked Service name in which to associate the Dataset with.
	linkedServiceName?: null | string @go(LinkedServiceName,*string)

	// A map of parameters to associate with the Data Factory Dataset.
	parameters?: {[string]: null | string} @go(Parameters,map[string]*string)

	// A schema_column block as defined below.
	schemaColumn?: [...#DataSetJSONSchemaColumnObservation] @go(SchemaColumn,[]DataSetJSONSchemaColumnObservation)
}

#DataSetJSONParameters: {
	// A map of additional properties to associate with the Data Factory Dataset.
	// +kubebuilder:validation:Optional
	additionalProperties?: {[string]: null | string} @go(AdditionalProperties,map[string]*string)

	// List of tags that can be used for describing the Data Factory Dataset.
	// +kubebuilder:validation:Optional
	annotations?: [...null | string] @go(Annotations,[]*string)

	// A azure_blob_storage_location block as defined below.
	// +kubebuilder:validation:Optional
	azureBlobStorageLocation?: [...#DataSetJSONAzureBlobStorageLocationParameters] @go(AzureBlobStorageLocation,[]DataSetJSONAzureBlobStorageLocationParameters)

	// The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/datafactory/v1beta1.Factory
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dataFactoryId?: null | string @go(DataFactoryID,*string)

	// The description for the Data Factory Dataset.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The encoding format for the file.
	// +kubebuilder:validation:Optional
	encoding?: null | string @go(Encoding,*string)

	// The folder that this Dataset is in. If not specified, the Dataset will appear at the root level.
	// +kubebuilder:validation:Optional
	folder?: null | string @go(Folder,*string)

	// A http_server_location block as defined below.
	// +kubebuilder:validation:Optional
	httpServerLocation?: [...#DataSetJSONHTTPServerLocationParameters] @go(HTTPServerLocation,[]DataSetJSONHTTPServerLocationParameters)

	// The Data Factory Linked Service name in which to associate the Dataset with.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/datafactory/v1beta1.LinkedServiceWeb
	// +kubebuilder:validation:Optional
	linkedServiceName?: null | string @go(LinkedServiceName,*string)

	// A map of parameters to associate with the Data Factory Dataset.
	// +kubebuilder:validation:Optional
	parameters?: {[string]: null | string} @go(Parameters,map[string]*string)

	// A schema_column block as defined below.
	// +kubebuilder:validation:Optional
	schemaColumn?: [...#DataSetJSONSchemaColumnParameters] @go(SchemaColumn,[]DataSetJSONSchemaColumnParameters)
}

#DataSetJSONSchemaColumnInitParameters: {
	// The description of the column.
	description?: null | string @go(Description,*string)

	// The name of the column.
	name?: null | string @go(Name,*string)

	// Type of the column. Valid values are Byte, Byte[], Boolean, Date, DateTime,DateTimeOffset, Decimal, Double, Guid, Int16, Int32, Int64, Single, String, TimeSpan. Please note these values are case sensitive.
	type?: null | string @go(Type,*string)
}

#DataSetJSONSchemaColumnObservation: {
	// The description of the column.
	description?: null | string @go(Description,*string)

	// The name of the column.
	name?: null | string @go(Name,*string)

	// Type of the column. Valid values are Byte, Byte[], Boolean, Date, DateTime,DateTimeOffset, Decimal, Double, Guid, Int16, Int32, Int64, Single, String, TimeSpan. Please note these values are case sensitive.
	type?: null | string @go(Type,*string)
}

#DataSetJSONSchemaColumnParameters: {
	// The description of the column.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The name of the column.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Type of the column. Valid values are Byte, Byte[], Boolean, Date, DateTime,DateTimeOffset, Decimal, Double, Guid, Int16, Int32, Int64, Single, String, TimeSpan. Please note these values are case sensitive.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// DataSetJSONSpec defines the desired state of DataSetJSON
#DataSetJSONSpec: {
	forProvider: #DataSetJSONParameters @go(ForProvider)

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
	initProvider?: #DataSetJSONInitParameters @go(InitProvider)
}

// DataSetJSONStatus defines the observed state of DataSetJSON.
#DataSetJSONStatus: {
	atProvider?: #DataSetJSONObservation @go(AtProvider)
}

// DataSetJSON is the Schema for the DataSetJSONs API. Manages an Azure JSON Dataset inside an Azure Data Factory.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#DataSetJSON: {
	spec:    #DataSetJSONSpec   @go(Spec)
	status?: #DataSetJSONStatus @go(Status)
}

// DataSetJSONList contains a list of DataSetJSONs
#DataSetJSONList: {
	items: [...#DataSetJSON] @go(Items,[]DataSetJSON)
}