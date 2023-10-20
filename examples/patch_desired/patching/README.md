# [xrender](https://github.com/crossplane-contrib/xrender)

#### Run
```bash
$ xrender xr.yaml composition.yaml functions.yaml
```

#### Produces
```yaml
---
apiVersion: nopexample.org/v1
kind: XSubnetwork
metadata:
  name: test-xrender
---
apiVersion: s3.aws.upbound.io/v1beta1
kind: Bucket
metadata:
  annotations:
    crossplane.io/composition-resource-name: prime-objects-test-bucket
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: test-bucket
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XSubnetwork
    name: test-xrender
    uid: ""
spec:
  forProvider:
    policy: some-bucket-policy
    region: us-east-2
---
apiVersion: ec2.aws.upbound.io/v1beta1
kind: Instance
metadata:
  annotations:
    crossplane.io/composition-resource-name: prime-objects-someinstance
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: someinstance
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XSubnetwork
    name: test-xrender
    uid: ""
spec:
  forProvider:
    ami: ami-0d9858aa3c6322f73
    instanceType: t2.micro
    region: us-east-2
---
apiVersion: xrender.crossplane.io/v1beta1
kind: Result
message: created resource "someinstance:Instance"
severity: SEVERITY_NORMAL
step: prime-objects
---
apiVersion: xrender.crossplane.io/v1beta1
kind: Result
message: created resource "test-bucket:Bucket"
severity: SEVERITY_NORMAL
step: prime-objects
---
apiVersion: xrender.crossplane.io/v1beta1
kind: Result
message: updated resource "test-bucket:Bucket"
severity: SEVERITY_NORMAL
step: patch-storage-bucket
```
