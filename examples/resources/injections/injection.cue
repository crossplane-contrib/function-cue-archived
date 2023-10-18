#env string @tag("provider")

if #env == "aws" {
	apiVersion: "eks.nobu.dev/v1beta"
}
if #env == "gcp" {
	apiVersion: "gke.nobu.dev/v1beta1"
}

kind: "XNodepool"
metadata: name: "TestNodepool"
spec: parameters: {
	autoscaling: [{
		maxNodeCount: 1
		minNodeCount: 1
	}]
	clusterName: "example-injections"
	region: "us-east-2"
}
