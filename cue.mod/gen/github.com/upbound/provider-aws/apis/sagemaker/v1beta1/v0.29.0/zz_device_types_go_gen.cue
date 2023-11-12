// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/sagemaker/v1beta1

package v1beta1

#DeviceDeviceObservation: {
}

#DeviceDeviceParameters: {
	// A description for the device.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The name of the device.
	// +kubebuilder:validation:Required
	deviceName?: null | string @go(DeviceName,*string)

	// Amazon Web Services Internet of Things (IoT) object name.
	// +kubebuilder:validation:Optional
	iotThingName?: null | string @go(IotThingName,*string)
}

#DeviceObservation: {
	agentVersion?: null | string @go(AgentVersion,*string)

	// The Amazon Resource Name (ARN) assigned by AWS to this Device.
	arn?: null | string @go(Arn,*string)

	// The id is constructed from device-fleet-name/device-name.
	id?: null | string @go(ID,*string)
}

#DeviceParameters: {
	// The device to register with SageMaker Edge Manager. See Device details below.
	// +kubebuilder:validation:Required
	device: [...#DeviceDeviceParameters] @go(Device,[]DeviceDeviceParameters)

	// The name of the Device Fleet.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/sagemaker/v1beta1.DeviceFleet
	// +kubebuilder:validation:Optional
	deviceFleetName?: null | string @go(DeviceFleetName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// DeviceSpec defines the desired state of Device
#DeviceSpec: {
	forProvider: #DeviceParameters @go(ForProvider)
}

// DeviceStatus defines the observed state of Device.
#DeviceStatus: {
	atProvider?: #DeviceObservation @go(AtProvider)
}

// Device is the Schema for the Devices API. Provides a SageMaker Device resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Device: {
	spec:    #DeviceSpec   @go(Spec)
	status?: #DeviceStatus @go(Status)
}

// DeviceList contains a list of Devices
#DeviceList: {
	items: [...#Device] @go(Items,[]Device)
}