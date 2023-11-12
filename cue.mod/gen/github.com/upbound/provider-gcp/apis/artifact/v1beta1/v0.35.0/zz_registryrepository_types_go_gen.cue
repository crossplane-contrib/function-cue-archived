// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/artifact/v1beta1

package v1beta1

#DockerConfigInitParameters: {
	// The repository which enabled this flag prevents all tags from being modified, moved or deleted. This does not prevent tags from being created.
	immutableTags?: null | bool @go(ImmutableTags,*bool)
}

#DockerConfigObservation: {
	// The repository which enabled this flag prevents all tags from being modified, moved or deleted. This does not prevent tags from being created.
	immutableTags?: null | bool @go(ImmutableTags,*bool)
}

#DockerConfigParameters: {
	// The repository which enabled this flag prevents all tags from being modified, moved or deleted. This does not prevent tags from being created.
	// +kubebuilder:validation:Optional
	immutableTags?: null | bool @go(ImmutableTags,*bool)
}

#DockerRepositoryInitParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#DockerRepositoryObservation: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#DockerRepositoryParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	// +kubebuilder:validation:Optional
	publicRepository?: null | string @go(PublicRepository,*string)
}

#MavenConfigInitParameters: {
	// The repository with this flag will allow publishing the same
	// snapshot versions.
	allowSnapshotOverwrites?: null | bool @go(AllowSnapshotOverwrites,*bool)

	// Version policy defines the versions that the registry will accept.
	// Default value is VERSION_POLICY_UNSPECIFIED.
	// Possible values are: VERSION_POLICY_UNSPECIFIED, RELEASE, SNAPSHOT.
	versionPolicy?: null | string @go(VersionPolicy,*string)
}

#MavenConfigObservation: {
	// The repository with this flag will allow publishing the same
	// snapshot versions.
	allowSnapshotOverwrites?: null | bool @go(AllowSnapshotOverwrites,*bool)

	// Version policy defines the versions that the registry will accept.
	// Default value is VERSION_POLICY_UNSPECIFIED.
	// Possible values are: VERSION_POLICY_UNSPECIFIED, RELEASE, SNAPSHOT.
	versionPolicy?: null | string @go(VersionPolicy,*string)
}

#MavenConfigParameters: {
	// The repository with this flag will allow publishing the same
	// snapshot versions.
	// +kubebuilder:validation:Optional
	allowSnapshotOverwrites?: null | bool @go(AllowSnapshotOverwrites,*bool)

	// Version policy defines the versions that the registry will accept.
	// Default value is VERSION_POLICY_UNSPECIFIED.
	// Possible values are: VERSION_POLICY_UNSPECIFIED, RELEASE, SNAPSHOT.
	// +kubebuilder:validation:Optional
	versionPolicy?: null | string @go(VersionPolicy,*string)
}

#MavenRepositoryInitParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#MavenRepositoryObservation: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#MavenRepositoryParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	// +kubebuilder:validation:Optional
	publicRepository?: null | string @go(PublicRepository,*string)
}

#NpmRepositoryInitParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#NpmRepositoryObservation: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#NpmRepositoryParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	// +kubebuilder:validation:Optional
	publicRepository?: null | string @go(PublicRepository,*string)
}

#PythonRepositoryInitParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#PythonRepositoryObservation: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	publicRepository?: null | string @go(PublicRepository,*string)
}

#PythonRepositoryParameters: {
	// Address of the remote repository.
	// Default value is PYPI.
	// Possible values are: PYPI.
	// +kubebuilder:validation:Optional
	publicRepository?: null | string @go(PublicRepository,*string)
}

#RegistryRepositoryInitParameters: {
	// The user-provided description of the repository.
	description?: null | string @go(Description,*string)

	// Docker repository config contains repository level configuration for the repositories of docker type.
	// Structure is documented below.
	dockerConfig?: [...#DockerConfigInitParameters] @go(DockerConfig,[]DockerConfigInitParameters)

	// The format of packages that are stored in the repository. Supported formats
	// can be found here.
	// You can only create alpha formats if you are a member of the
	// alpha user group.
	format?: null | string @go(Format,*string)

	// The Cloud KMS resource name of the customer managed encryption key that’s
	// used to encrypt the contents of the Repository. Has the form:
	// projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key.
	// This value may not be changed after the Repository has been created.
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// Labels with user-defined metadata.
	// This field may contain up to 64 entries. Label keys and values may be no
	// longer than 63 characters. Label keys must begin with a lowercase letter
	// and may only contain lowercase letters, numeric characters, underscores,
	// and dashes.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// MavenRepositoryConfig is maven related repository details.
	// Provides additional configuration details for repositories of the maven
	// format type.
	// Structure is documented below.
	mavenConfig?: [...#MavenConfigInitParameters] @go(MavenConfig,[]MavenConfigInitParameters)

	// The mode configures the repository to serve artifacts from different sources.
	// Default value is STANDARD_REPOSITORY.
	// Possible values are: STANDARD_REPOSITORY, VIRTUAL_REPOSITORY, REMOTE_REPOSITORY.
	mode?: null | string @go(Mode,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Configuration specific for a Remote Repository.
	// Structure is documented below.
	remoteRepositoryConfig?: [...#RemoteRepositoryConfigInitParameters] @go(RemoteRepositoryConfig,[]RemoteRepositoryConfigInitParameters)

	// Configuration specific for a Virtual Repository.
	// Structure is documented below.
	virtualRepositoryConfig?: [...#VirtualRepositoryConfigInitParameters] @go(VirtualRepositoryConfig,[]VirtualRepositoryConfigInitParameters)
}

#RegistryRepositoryObservation: {
	// The time when the repository was created.
	createTime?: null | string @go(CreateTime,*string)

	// The user-provided description of the repository.
	description?: null | string @go(Description,*string)

	// Docker repository config contains repository level configuration for the repositories of docker type.
	// Structure is documented below.
	dockerConfig?: [...#DockerConfigObservation] @go(DockerConfig,[]DockerConfigObservation)

	// The format of packages that are stored in the repository. Supported formats
	// can be found here.
	// You can only create alpha formats if you are a member of the
	// alpha user group.
	format?: null | string @go(Format,*string)

	// an identifier for the resource with format projects/{{project}}/locations/{{location}}/repositories/{{repository_id}}
	id?: null | string @go(ID,*string)

	// The Cloud KMS resource name of the customer managed encryption key that’s
	// used to encrypt the contents of the Repository. Has the form:
	// projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key.
	// This value may not be changed after the Repository has been created.
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// Labels with user-defined metadata.
	// This field may contain up to 64 entries. Label keys and values may be no
	// longer than 63 characters. Label keys must begin with a lowercase letter
	// and may only contain lowercase letters, numeric characters, underscores,
	// and dashes.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the location this repository is located in.
	location?: null | string @go(Location,*string)

	// MavenRepositoryConfig is maven related repository details.
	// Provides additional configuration details for repositories of the maven
	// format type.
	// Structure is documented below.
	mavenConfig?: [...#MavenConfigObservation] @go(MavenConfig,[]MavenConfigObservation)

	// The mode configures the repository to serve artifacts from different sources.
	// Default value is STANDARD_REPOSITORY.
	// Possible values are: STANDARD_REPOSITORY, VIRTUAL_REPOSITORY, REMOTE_REPOSITORY.
	mode?: null | string @go(Mode,*string)

	// The name of the repository, for example:
	// "repo1"
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Configuration specific for a Remote Repository.
	// Structure is documented below.
	remoteRepositoryConfig?: [...#RemoteRepositoryConfigObservation] @go(RemoteRepositoryConfig,[]RemoteRepositoryConfigObservation)

	// The time when the repository was last updated.
	updateTime?: null | string @go(UpdateTime,*string)

	// Configuration specific for a Virtual Repository.
	// Structure is documented below.
	virtualRepositoryConfig?: [...#VirtualRepositoryConfigObservation] @go(VirtualRepositoryConfig,[]VirtualRepositoryConfigObservation)
}

#RegistryRepositoryParameters: {
	// The user-provided description of the repository.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Docker repository config contains repository level configuration for the repositories of docker type.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	dockerConfig?: [...#DockerConfigParameters] @go(DockerConfig,[]DockerConfigParameters)

	// The format of packages that are stored in the repository. Supported formats
	// can be found here.
	// You can only create alpha formats if you are a member of the
	// alpha user group.
	// +kubebuilder:validation:Optional
	format?: null | string @go(Format,*string)

	// The Cloud KMS resource name of the customer managed encryption key that’s
	// used to encrypt the contents of the Repository. Has the form:
	// projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key.
	// This value may not be changed after the Repository has been created.
	// +kubebuilder:validation:Optional
	kmsKeyName?: null | string @go(KMSKeyName,*string)

	// Labels with user-defined metadata.
	// This field may contain up to 64 entries. Label keys and values may be no
	// longer than 63 characters. Label keys must begin with a lowercase letter
	// and may only contain lowercase letters, numeric characters, underscores,
	// and dashes.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The name of the location this repository is located in.
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)

	// MavenRepositoryConfig is maven related repository details.
	// Provides additional configuration details for repositories of the maven
	// format type.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	mavenConfig?: [...#MavenConfigParameters] @go(MavenConfig,[]MavenConfigParameters)

	// The mode configures the repository to serve artifacts from different sources.
	// Default value is STANDARD_REPOSITORY.
	// Possible values are: STANDARD_REPOSITORY, VIRTUAL_REPOSITORY, REMOTE_REPOSITORY.
	// +kubebuilder:validation:Optional
	mode?: null | string @go(Mode,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Configuration specific for a Remote Repository.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	remoteRepositoryConfig?: [...#RemoteRepositoryConfigParameters] @go(RemoteRepositoryConfig,[]RemoteRepositoryConfigParameters)

	// Configuration specific for a Virtual Repository.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	virtualRepositoryConfig?: [...#VirtualRepositoryConfigParameters] @go(VirtualRepositoryConfig,[]VirtualRepositoryConfigParameters)
}

#RemoteRepositoryConfigInitParameters: {
	// The description of the remote source.
	description?: null | string @go(Description,*string)

	// Specific settings for a Docker remote repository.
	// Structure is documented below.
	dockerRepository?: [...#DockerRepositoryInitParameters] @go(DockerRepository,[]DockerRepositoryInitParameters)

	// Specific settings for a Maven remote repository.
	// Structure is documented below.
	mavenRepository?: [...#MavenRepositoryInitParameters] @go(MavenRepository,[]MavenRepositoryInitParameters)

	// Specific settings for an Npm remote repository.
	// Structure is documented below.
	npmRepository?: [...#NpmRepositoryInitParameters] @go(NpmRepository,[]NpmRepositoryInitParameters)

	// Specific settings for a Python remote repository.
	// Structure is documented below.
	pythonRepository?: [...#PythonRepositoryInitParameters] @go(PythonRepository,[]PythonRepositoryInitParameters)
}

#RemoteRepositoryConfigObservation: {
	// The description of the remote source.
	description?: null | string @go(Description,*string)

	// Specific settings for a Docker remote repository.
	// Structure is documented below.
	dockerRepository?: [...#DockerRepositoryObservation] @go(DockerRepository,[]DockerRepositoryObservation)

	// Specific settings for a Maven remote repository.
	// Structure is documented below.
	mavenRepository?: [...#MavenRepositoryObservation] @go(MavenRepository,[]MavenRepositoryObservation)

	// Specific settings for an Npm remote repository.
	// Structure is documented below.
	npmRepository?: [...#NpmRepositoryObservation] @go(NpmRepository,[]NpmRepositoryObservation)

	// Specific settings for a Python remote repository.
	// Structure is documented below.
	pythonRepository?: [...#PythonRepositoryObservation] @go(PythonRepository,[]PythonRepositoryObservation)
}

#RemoteRepositoryConfigParameters: {
	// The description of the remote source.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Specific settings for a Docker remote repository.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	dockerRepository?: [...#DockerRepositoryParameters] @go(DockerRepository,[]DockerRepositoryParameters)

	// Specific settings for a Maven remote repository.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	mavenRepository?: [...#MavenRepositoryParameters] @go(MavenRepository,[]MavenRepositoryParameters)

	// Specific settings for an Npm remote repository.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	npmRepository?: [...#NpmRepositoryParameters] @go(NpmRepository,[]NpmRepositoryParameters)

	// Specific settings for a Python remote repository.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	pythonRepository?: [...#PythonRepositoryParameters] @go(PythonRepository,[]PythonRepositoryParameters)
}

#UpstreamPoliciesInitParameters: {
	// The user-provided ID of the upstream policy.
	id?: null | string @go(ID,*string)

	// Entries with a greater priority value take precedence in the pull order.
	priority?: null | float64 @go(Priority,*float64)
}

#UpstreamPoliciesObservation: {
	// The user-provided ID of the upstream policy.
	id?: null | string @go(ID,*string)

	// Entries with a greater priority value take precedence in the pull order.
	priority?: null | float64 @go(Priority,*float64)

	// A reference to the repository resource, for example:
	// "projects/p1/locations/us-central1/repository/repo1".
	repository?: null | string @go(Repository,*string)
}

#UpstreamPoliciesParameters: {
	// The user-provided ID of the upstream policy.
	// +kubebuilder:validation:Optional
	id?: null | string @go(ID,*string)

	// Entries with a greater priority value take precedence in the pull order.
	// +kubebuilder:validation:Optional
	priority?: null | float64 @go(Priority,*float64)

	// A reference to the repository resource, for example:
	// "projects/p1/locations/us-central1/repository/repo1".
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/artifact/v1beta1.RegistryRepository
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	repository?: null | string @go(Repository,*string)
}

#VirtualRepositoryConfigInitParameters: {
	// Policies that configure the upstream artifacts distributed by the Virtual
	// Repository. Upstream policies cannot be set on a standard repository.
	// Structure is documented below.
	upstreamPolicies?: [...#UpstreamPoliciesInitParameters] @go(UpstreamPolicies,[]UpstreamPoliciesInitParameters)
}

#VirtualRepositoryConfigObservation: {
	// Policies that configure the upstream artifacts distributed by the Virtual
	// Repository. Upstream policies cannot be set on a standard repository.
	// Structure is documented below.
	upstreamPolicies?: [...#UpstreamPoliciesObservation] @go(UpstreamPolicies,[]UpstreamPoliciesObservation)
}

#VirtualRepositoryConfigParameters: {
	// Policies that configure the upstream artifacts distributed by the Virtual
	// Repository. Upstream policies cannot be set on a standard repository.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	upstreamPolicies?: [...#UpstreamPoliciesParameters] @go(UpstreamPolicies,[]UpstreamPoliciesParameters)
}

// RegistryRepositorySpec defines the desired state of RegistryRepository
#RegistryRepositorySpec: {
	forProvider: #RegistryRepositoryParameters @go(ForProvider)

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
	initProvider?: #RegistryRepositoryInitParameters @go(InitProvider)
}

// RegistryRepositoryStatus defines the observed state of RegistryRepository.
#RegistryRepositoryStatus: {
	atProvider?: #RegistryRepositoryObservation @go(AtProvider)
}

// RegistryRepository is the Schema for the RegistryRepositorys API. A repository for storing artifacts
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#RegistryRepository: {
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.format) || has(self.initProvider.format)",message="format is a required parameter"
	spec:    #RegistryRepositorySpec   @go(Spec)
	status?: #RegistryRepositoryStatus @go(Status)
}

// RegistryRepositoryList contains a list of RegistryRepositorys
#RegistryRepositoryList: {
	items: [...#RegistryRepository] @go(Items,[]RegistryRepository)
}