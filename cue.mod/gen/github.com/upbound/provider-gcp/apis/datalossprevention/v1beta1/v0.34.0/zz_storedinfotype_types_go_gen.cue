// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/datalossprevention/v1beta1

package v1beta1

#BigQueryFieldFieldObservation: {
	// The resource name of the info type. Set by the server.
	name?: null | string @go(Name,*string)
}

#BigQueryFieldFieldParameters: {
	// The resource name of the info type. Set by the server.
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)
}

#BigQueryFieldObservation: {
	// Designated field in the BigQuery table.
	// Structure is documented below.
	field?: [...#BigQueryFieldFieldObservation] @go(Field,[]BigQueryFieldFieldObservation)

	// Field in a BigQuery table where each cell represents a dictionary phrase.
	// Structure is documented below.
	table?: [...#BigQueryFieldTableObservation] @go(Table,[]BigQueryFieldTableObservation)
}

#BigQueryFieldParameters: {
	// Designated field in the BigQuery table.
	// Structure is documented below.
	// +kubebuilder:validation:Required
	field: [...#BigQueryFieldFieldParameters] @go(Field,[]BigQueryFieldFieldParameters)

	// Field in a BigQuery table where each cell represents a dictionary phrase.
	// Structure is documented below.
	// +kubebuilder:validation:Required
	table: [...#BigQueryFieldTableParameters] @go(Table,[]BigQueryFieldTableParameters)
}

#BigQueryFieldTableObservation: {
	// The dataset ID of the table.
	datasetId?: null | string @go(DatasetID,*string)

	// The Google Cloud Platform project ID of the project containing the table.
	projectId?: null | string @go(ProjectID,*string)

	// The name of the table.
	tableId?: null | string @go(TableID,*string)
}

#BigQueryFieldTableParameters: {
	// The dataset ID of the table.
	// +kubebuilder:validation:Required
	datasetId?: null | string @go(DatasetID,*string)

	// The Google Cloud Platform project ID of the project containing the table.
	// +kubebuilder:validation:Required
	projectId?: null | string @go(ProjectID,*string)

	// The name of the table.
	// +kubebuilder:validation:Required
	tableId?: null | string @go(TableID,*string)
}

#CloudStorageFileSetObservation: {
	// The url, in the format gs://<bucket>/<path>. Trailing wildcard in the path is allowed.
	url?: null | string @go(URL,*string)
}

#CloudStorageFileSetParameters: {
	// The url, in the format gs://<bucket>/<path>. Trailing wildcard in the path is allowed.
	// +kubebuilder:validation:Required
	url?: null | string @go(URL,*string)
}

#LargeCustomDictionaryObservation: {
	// Field in a BigQuery table where each cell represents a dictionary phrase.
	// Structure is documented below.
	bigQueryField?: [...#BigQueryFieldObservation] @go(BigQueryField,[]BigQueryFieldObservation)

	// Set of files containing newline-delimited lists of dictionary phrases.
	// Structure is documented below.
	cloudStorageFileSet?: [...#CloudStorageFileSetObservation] @go(CloudStorageFileSet,[]CloudStorageFileSetObservation)

	// Location to store dictionary artifacts in Google Cloud Storage. These files will only be accessible by project owners and the DLP API.
	// If any of these artifacts are modified, the dictionary is considered invalid and can no longer be used.
	// Structure is documented below.
	outputPath?: [...#OutputPathObservation] @go(OutputPath,[]OutputPathObservation)
}

#LargeCustomDictionaryParameters: {
	// Field in a BigQuery table where each cell represents a dictionary phrase.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	bigQueryField?: [...#BigQueryFieldParameters] @go(BigQueryField,[]BigQueryFieldParameters)

	// Set of files containing newline-delimited lists of dictionary phrases.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	cloudStorageFileSet?: [...#CloudStorageFileSetParameters] @go(CloudStorageFileSet,[]CloudStorageFileSetParameters)

	// Location to store dictionary artifacts in Google Cloud Storage. These files will only be accessible by project owners and the DLP API.
	// If any of these artifacts are modified, the dictionary is considered invalid and can no longer be used.
	// Structure is documented below.
	// +kubebuilder:validation:Required
	outputPath: [...#OutputPathParameters] @go(OutputPath,[]OutputPathParameters)
}

#OutputPathObservation: {
	// A url representing a file or path (no wildcards) in Cloud Storage. Example: gs://[BUCKET_NAME]/dictionary.txt
	path?: null | string @go(Path,*string)
}

#OutputPathParameters: {
	// A url representing a file or path (no wildcards) in Cloud Storage. Example: gs://[BUCKET_NAME]/dictionary.txt
	// +kubebuilder:validation:Required
	path?: null | string @go(Path,*string)
}

#StoredInfoTypeDictionaryCloudStoragePathObservation: {
	// A url representing a file or path (no wildcards) in Cloud Storage. Example: gs://[BUCKET_NAME]/dictionary.txt
	path?: null | string @go(Path,*string)
}

#StoredInfoTypeDictionaryCloudStoragePathParameters: {
	// A url representing a file or path (no wildcards) in Cloud Storage. Example: gs://[BUCKET_NAME]/dictionary.txt
	// +kubebuilder:validation:Required
	path?: null | string @go(Path,*string)
}

#StoredInfoTypeDictionaryObservation: {
	// Newline-delimited file of words in Cloud Storage. Only a single file is accepted.
	// Structure is documented below.
	cloudStoragePath?: [...#StoredInfoTypeDictionaryCloudStoragePathObservation] @go(CloudStoragePath,[]StoredInfoTypeDictionaryCloudStoragePathObservation)

	// List of words or phrases to search for.
	// Structure is documented below.
	wordList?: [...#StoredInfoTypeDictionaryWordListObservation] @go(WordList,[]StoredInfoTypeDictionaryWordListObservation)
}

#StoredInfoTypeDictionaryParameters: {
	// Newline-delimited file of words in Cloud Storage. Only a single file is accepted.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	cloudStoragePath?: [...#StoredInfoTypeDictionaryCloudStoragePathParameters] @go(CloudStoragePath,[]StoredInfoTypeDictionaryCloudStoragePathParameters)

	// List of words or phrases to search for.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	wordList?: [...#StoredInfoTypeDictionaryWordListParameters] @go(WordList,[]StoredInfoTypeDictionaryWordListParameters)
}

#StoredInfoTypeDictionaryWordListObservation: {
	// Words or phrases defining the dictionary. The dictionary must contain at least one
	// phrase and every phrase must contain at least 2 characters that are letters or digits.
	words?: [...null | string] @go(Words,[]*string)
}

#StoredInfoTypeDictionaryWordListParameters: {
	// Words or phrases defining the dictionary. The dictionary must contain at least one
	// phrase and every phrase must contain at least 2 characters that are letters or digits.
	// +kubebuilder:validation:Required
	words: [...null | string] @go(Words,[]*string)
}

#StoredInfoTypeObservation: {
	// A description of the info type.
	description?: null | string @go(Description,*string)

	// Dictionary which defines the rule.
	// Structure is documented below.
	dictionary?: [...#StoredInfoTypeDictionaryObservation] @go(Dictionary,[]StoredInfoTypeDictionaryObservation)

	// User set display name of the info type.
	displayName?: null | string @go(DisplayName,*string)

	// an identifier for the resource with format {{parent}}/storedInfoTypes/{{name}}
	id?: null | string @go(ID,*string)

	// Dictionary which defines the rule.
	// Structure is documented below.
	largeCustomDictionary?: [...#LargeCustomDictionaryObservation] @go(LargeCustomDictionary,[]LargeCustomDictionaryObservation)

	// The resource name of the info type. Set by the server.
	name?: null | string @go(Name,*string)

	// The parent of the info type in any of the following formats:
	parent?: null | string @go(Parent,*string)

	// Regular expression which defines the rule.
	// Structure is documented below.
	regex?: [...#StoredInfoTypeRegexObservation] @go(Regex,[]StoredInfoTypeRegexObservation)
}

#StoredInfoTypeParameters: {
	// A description of the info type.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Dictionary which defines the rule.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	dictionary?: [...#StoredInfoTypeDictionaryParameters] @go(Dictionary,[]StoredInfoTypeDictionaryParameters)

	// User set display name of the info type.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// Dictionary which defines the rule.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	largeCustomDictionary?: [...#LargeCustomDictionaryParameters] @go(LargeCustomDictionary,[]LargeCustomDictionaryParameters)

	// The parent of the info type in any of the following formats:
	// +kubebuilder:validation:Optional
	parent?: null | string @go(Parent,*string)

	// Regular expression which defines the rule.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	regex?: [...#StoredInfoTypeRegexParameters] @go(Regex,[]StoredInfoTypeRegexParameters)
}

#StoredInfoTypeRegexObservation: {
	// The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included.
	groupIndexes?: [...null | float64] @go(GroupIndexes,[]*float64)

	// Pattern defining the regular expression.
	// Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
	pattern?: null | string @go(Pattern,*string)
}

#StoredInfoTypeRegexParameters: {
	// The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included.
	// +kubebuilder:validation:Optional
	groupIndexes?: [...null | float64] @go(GroupIndexes,[]*float64)

	// Pattern defining the regular expression.
	// Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
	// +kubebuilder:validation:Required
	pattern?: null | string @go(Pattern,*string)
}

// StoredInfoTypeSpec defines the desired state of StoredInfoType
#StoredInfoTypeSpec: {
	forProvider: #StoredInfoTypeParameters @go(ForProvider)
}

// StoredInfoTypeStatus defines the observed state of StoredInfoType.
#StoredInfoTypeStatus: {
	atProvider?: #StoredInfoTypeObservation @go(AtProvider)
}

// StoredInfoType is the Schema for the StoredInfoTypes API. Allows creation of custom info types.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#StoredInfoType: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.parent)",message="parent is a required parameter"
	spec:    #StoredInfoTypeSpec   @go(Spec)
	status?: #StoredInfoTypeStatus @go(Status)
}

// StoredInfoTypeList contains a list of StoredInfoTypes
#StoredInfoTypeList: {
	items: [...#StoredInfoType] @go(Items,[]StoredInfoType)
}