// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-azure/apis/appplatform/v1beta1

package v1beta1

#CustomPersistentDiskObservation: {
	// These are the mount options for a persistent disk.
	mountOptions?: [...null | string] @go(MountOptions,[]*string)

	// The mount path of the persistent disk.
	mountPath?: null | string @go(MountPath,*string)

	// Indicates whether the persistent disk is a readOnly one.
	readOnlyEnabled?: null | bool @go(ReadOnlyEnabled,*bool)

	// The share name of the Azure File share.
	shareName?: null | string @go(ShareName,*string)

	// The name of the Spring Cloud Storage.
	storageName?: null | string @go(StorageName,*string)
}

#CustomPersistentDiskParameters: {
	// These are the mount options for a persistent disk.
	// +kubebuilder:validation:Optional
	mountOptions?: [...null | string] @go(MountOptions,[]*string)

	// The mount path of the persistent disk.
	// +kubebuilder:validation:Required
	mountPath?: null | string @go(MountPath,*string)

	// Indicates whether the persistent disk is a readOnly one.
	// +kubebuilder:validation:Optional
	readOnlyEnabled?: null | bool @go(ReadOnlyEnabled,*bool)

	// The share name of the Azure File share.
	// +kubebuilder:validation:Required
	shareName?: null | string @go(ShareName,*string)

	// The name of the Spring Cloud Storage.
	// +kubebuilder:validation:Required
	storageName?: null | string @go(StorageName,*string)
}

#IdentityObservation: {
	// A list of User Assigned Managed Identity IDs to be assigned to this Spring Cloud Application.
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// The Principal ID for the Service Principal associated with the Managed Service Identity of this Spring Cloud Application.
	principalId?: null | string @go(PrincipalID,*string)

	// The Tenant ID for the Service Principal associated with the Managed Service Identity of this Spring Cloud Application.
	tenantId?: null | string @go(TenantID,*string)

	// Specifies the type of Managed Service Identity that should be configured on this Spring Cloud Application. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
	type?: null | string @go(Type,*string)
}

#IdentityParameters: {
	// A list of User Assigned Managed Identity IDs to be assigned to this Spring Cloud Application.
	// +kubebuilder:validation:Optional
	identityIds?: [...null | string] @go(IdentityIds,[]*string)

	// Specifies the type of Managed Service Identity that should be configured on this Spring Cloud Application. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
	// +kubebuilder:validation:Required
	type?: null | string @go(Type,*string)
}

#IngressSettingsObservation: {
	// Specifies how ingress should communicate with this app backend service. Allowed values are GRPC and Default. Defaults to Default.
	backendProtocol?: null | string @go(BackendProtocol,*string)

	// Specifies the ingress read time out in seconds. Defaults to 300.
	readTimeoutInSeconds?: null | float64 @go(ReadTimeoutInSeconds,*float64)

	// Specifies the ingress send time out in seconds. Defaults to 60.
	sendTimeoutInSeconds?: null | float64 @go(SendTimeoutInSeconds,*float64)

	// Specifies the type of the affinity, set this to Cookie to enable session affinity. Allowed values are Cookie and None. Defaults to None.
	sessionAffinity?: null | string @go(SessionAffinity,*string)

	// Specifies the time in seconds until the cookie expires.
	sessionCookieMaxAge?: null | float64 @go(SessionCookieMaxAge,*float64)
}

#IngressSettingsParameters: {
	// Specifies how ingress should communicate with this app backend service. Allowed values are GRPC and Default. Defaults to Default.
	// +kubebuilder:validation:Optional
	backendProtocol?: null | string @go(BackendProtocol,*string)

	// Specifies the ingress read time out in seconds. Defaults to 300.
	// +kubebuilder:validation:Optional
	readTimeoutInSeconds?: null | float64 @go(ReadTimeoutInSeconds,*float64)

	// Specifies the ingress send time out in seconds. Defaults to 60.
	// +kubebuilder:validation:Optional
	sendTimeoutInSeconds?: null | float64 @go(SendTimeoutInSeconds,*float64)

	// Specifies the type of the affinity, set this to Cookie to enable session affinity. Allowed values are Cookie and None. Defaults to None.
	// +kubebuilder:validation:Optional
	sessionAffinity?: null | string @go(SessionAffinity,*string)

	// Specifies the time in seconds until the cookie expires.
	// +kubebuilder:validation:Optional
	sessionCookieMaxAge?: null | float64 @go(SessionCookieMaxAge,*float64)
}

#PersistentDiskObservation: {
	// Specifies the mount path of the persistent disk. Defaults to /persistent.
	mountPath?: null | string @go(MountPath,*string)

	// Specifies the size of the persistent disk in GB. Possible values are between 0 and 50.
	sizeInGb?: null | float64 @go(SizeInGb,*float64)
}

#PersistentDiskParameters: {
	// Specifies the mount path of the persistent disk. Defaults to /persistent.
	// +kubebuilder:validation:Optional
	mountPath?: null | string @go(MountPath,*string)

	// Specifies the size of the persistent disk in GB. Possible values are between 0 and 50.
	// +kubebuilder:validation:Required
	sizeInGb?: null | float64 @go(SizeInGb,*float64)
}

#SpringCloudAppObservation: {
	// A JSON object that contains the addon configurations of the Spring Cloud Service.
	addonJson?: null | string @go(AddonJSON,*string)

	// A custom_persistent_disk block as defined below.
	customPersistentDisk?: [...#CustomPersistentDiskObservation] @go(CustomPersistentDisk,[]CustomPersistentDiskObservation)

	// The Fully Qualified DNS Name of the Spring Application in the service.
	fqdn?: null | string @go(Fqdn,*string)

	// Is only HTTPS allowed? Defaults to false.
	httpsOnly?: null | bool @go(HTTPSOnly,*bool)

	// The ID of the Spring Cloud Application.
	id?: null | string @go(ID,*string)

	// An identity block as defined below.
	identity?: [...#IdentityObservation] @go(Identity,[]IdentityObservation)

	// An ingress_settings block as defined below.
	ingressSettings?: [...#IngressSettingsObservation] @go(IngressSettings,[]IngressSettingsObservation)

	// Does the Spring Cloud Application have public endpoint? Defaults to false.
	isPublic?: null | bool @go(IsPublic,*bool)

	// An persistent_disk block as defined below.
	persistentDisk?: [...#PersistentDiskObservation] @go(PersistentDisk,[]PersistentDiskObservation)

	// Should the App in vnet injection instance exposes endpoint which could be accessed from Internet?
	publicEndpointEnabled?: null | bool @go(PublicEndpointEnabled,*bool)

	// Specifies the name of the resource group in which to create the Spring Cloud Application. Changing this forces a new resource to be created.
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// Specifies the name of the Spring Cloud Service resource. Changing this forces a new resource to be created.
	serviceName?: null | string @go(ServiceName,*string)

	// Is End to End TLS Enabled? Defaults to false.
	tlsEnabled?: null | bool @go(TLSEnabled,*bool)

	// The public endpoint of the Spring Cloud Application.
	url?: null | string @go(URL,*string)
}

#SpringCloudAppParameters: {
	// A JSON object that contains the addon configurations of the Spring Cloud Service.
	// +kubebuilder:validation:Optional
	addonJson?: null | string @go(AddonJSON,*string)

	// A custom_persistent_disk block as defined below.
	// +kubebuilder:validation:Optional
	customPersistentDisk?: [...#CustomPersistentDiskParameters] @go(CustomPersistentDisk,[]CustomPersistentDiskParameters)

	// Is only HTTPS allowed? Defaults to false.
	// +kubebuilder:validation:Optional
	httpsOnly?: null | bool @go(HTTPSOnly,*bool)

	// An identity block as defined below.
	// +kubebuilder:validation:Optional
	identity?: [...#IdentityParameters] @go(Identity,[]IdentityParameters)

	// An ingress_settings block as defined below.
	// +kubebuilder:validation:Optional
	ingressSettings?: [...#IngressSettingsParameters] @go(IngressSettings,[]IngressSettingsParameters)

	// Does the Spring Cloud Application have public endpoint? Defaults to false.
	// +kubebuilder:validation:Optional
	isPublic?: null | bool @go(IsPublic,*bool)

	// An persistent_disk block as defined below.
	// +kubebuilder:validation:Optional
	persistentDisk?: [...#PersistentDiskParameters] @go(PersistentDisk,[]PersistentDiskParameters)

	// Should the App in vnet injection instance exposes endpoint which could be accessed from Internet?
	// +kubebuilder:validation:Optional
	publicEndpointEnabled?: null | bool @go(PublicEndpointEnabled,*bool)

	// Specifies the name of the resource group in which to create the Spring Cloud Application. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/azure/v1beta1.ResourceGroup
	// +kubebuilder:validation:Optional
	resourceGroupName?: null | string @go(ResourceGroupName,*string)

	// Specifies the name of the Spring Cloud Service resource. Changing this forces a new resource to be created.
	// +crossplane:generate:reference:type=github.com/upbound/provider-azure/apis/appplatform/v1beta1.SpringCloudService
	// +kubebuilder:validation:Optional
	serviceName?: null | string @go(ServiceName,*string)

	// Is End to End TLS Enabled? Defaults to false.
	// +kubebuilder:validation:Optional
	tlsEnabled?: null | bool @go(TLSEnabled,*bool)
}

// SpringCloudAppSpec defines the desired state of SpringCloudApp
#SpringCloudAppSpec: {
	forProvider: #SpringCloudAppParameters @go(ForProvider)
}

// SpringCloudAppStatus defines the observed state of SpringCloudApp.
#SpringCloudAppStatus: {
	atProvider?: #SpringCloudAppObservation @go(AtProvider)
}

// SpringCloudApp is the Schema for the SpringCloudApps API. Manage an Azure Spring Cloud Application.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,azure}
#SpringCloudApp: {
	spec:    #SpringCloudAppSpec   @go(Spec)
	status?: #SpringCloudAppStatus @go(Status)
}

// SpringCloudAppList contains a list of SpringCloudApps
#SpringCloudAppList: {
	items: [...#SpringCloudApp] @go(Items,[]SpringCloudApp)
}