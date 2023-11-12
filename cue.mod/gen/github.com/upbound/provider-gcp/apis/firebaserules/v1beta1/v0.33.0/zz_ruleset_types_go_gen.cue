// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/firebaserules/v1beta1

package v1beta1

#FilesObservation: {
	// Textual Content.
	content?: null | string @go(Content,*string)

	// Fingerprint (e.g. github sha) associated with the File.
	fingerprint?: null | string @go(Fingerprint,*string)

	// Output only. Name of the Ruleset. The ruleset_id is auto generated by the service. Format: projects/{project_id}/rulesets/{ruleset_id}
	name?: null | string @go(Name,*string)
}

#FilesParameters: {
	// Textual Content.
	// +kubebuilder:validation:Required
	content?: null | string @go(Content,*string)

	// Fingerprint (e.g. github sha) associated with the File.
	// +kubebuilder:validation:Optional
	fingerprint?: null | string @go(Fingerprint,*string)

	// Output only. Name of the Ruleset. The ruleset_id is auto generated by the service. Format: projects/{project_id}/rulesets/{ruleset_id}
	// +kubebuilder:validation:Required
	name?: null | string @go(Name,*string)
}

#MetadataObservation: {
	services?: [...null | string] @go(Services,[]*string)
}

#MetadataParameters: {
}

#RulesetObservation: {
	// Output only. Time the Ruleset was created.
	createTime?: null | string @go(CreateTime,*string)

	// an identifier for the resource with format projects/{{project}}/rulesets/{{name}}
	id?: null | string @go(ID,*string)

	// Output only. The metadata for this ruleset.
	metadata?: [...#MetadataObservation] @go(Metadata,[]MetadataObservation)

	// Output only. Name of the Ruleset. The ruleset_id is auto generated by the service. Format: projects/{project_id}/rulesets/{ruleset_id}
	name?: null | string @go(Name,*string)

	// The project for the resource
	project?: null | string @go(Project,*string)

	// Source for the Ruleset.
	source?: [...#SourceObservation] @go(Source,[]SourceObservation)
}

#RulesetParameters: {
	// The project for the resource
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Source for the Ruleset.
	// +kubebuilder:validation:Optional
	source?: [...#SourceParameters] @go(Source,[]SourceParameters)
}

#SourceObservation: {
	// File set constituting the Source bundle.
	files?: [...#FilesObservation] @go(Files,[]FilesObservation)

	// Language of the Source bundle. If unspecified, the language will default to FIREBASE_RULES. Possible values: LANGUAGE_UNSPECIFIED, FIREBASE_RULES, EVENT_FLOW_TRIGGERS
	language?: null | string @go(Language,*string)
}

#SourceParameters: {
	// File set constituting the Source bundle.
	// +kubebuilder:validation:Required
	files: [...#FilesParameters] @go(Files,[]FilesParameters)

	// Language of the Source bundle. If unspecified, the language will default to FIREBASE_RULES. Possible values: LANGUAGE_UNSPECIFIED, FIREBASE_RULES, EVENT_FLOW_TRIGGERS
	// +kubebuilder:validation:Optional
	language?: null | string @go(Language,*string)
}

// RulesetSpec defines the desired state of Ruleset
#RulesetSpec: {
	forProvider: #RulesetParameters @go(ForProvider)
}

// RulesetStatus defines the observed state of Ruleset.
#RulesetStatus: {
	atProvider?: #RulesetObservation @go(AtProvider)
}

// Ruleset is the Schema for the Rulesets API.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Ruleset: {
	// +kubebuilder:validation:XValidation:rule="self.managementPolicy == 'ObserveOnly' || has(self.forProvider.source)",message="source is a required parameter"
	spec:    #RulesetSpec   @go(Spec)
	status?: #RulesetStatus @go(Status)
}

// RulesetList contains a list of Rulesets
#RulesetList: {
	items: [...#Ruleset] @go(Items,[]Ruleset)
}