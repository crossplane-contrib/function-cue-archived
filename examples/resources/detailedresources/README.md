# [xrender](https://github.com/crossplane-contrib/xrender)

#### Run
```bash
$ xrender xr.yaml composition.yaml functions.yaml
```

#### Produces
```yaml
---
apiVersion: nopexample.org/v1
kind: XCluster
metadata:
  name: test-xrender
---
apiVersion: nobu.dev/v1
kind: XBucket
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-bucket1
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    policy: default-policy-arn
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass5-c512xlarge-3
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.12xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass3-m6gd4xlarge-1
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: m6gd.4xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass2-m52xlarge-0
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: m5.2xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XBucket
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-bucket2
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    policy: default-policy-arn
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass4-c54xlarge-3
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.4xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: Cluster
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-mycluster
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  forProvider:
    name: cluster-name
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XFirewall
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-myfirewall
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass5-c512xlarge-0
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.12xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass3-m6gd4xlarge-0
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: m6gd.4xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass5-c512xlarge-2
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.12xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass4-c54xlarge-1
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.4xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XBucket
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-bucket3
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    policy: default-policy-arn
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass5-c512xlarge-1
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.12xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XVpc
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-mynetwork
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    region: us-east-2
    visibility: private
---
apiVersion: nobu.dev/v1
kind: XBucket
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-bucket4
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    policy: default-policy-arn
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass4-c54xlarge-0
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.4xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass5-c512xlarge-4
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.12xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass4-c54xlarge-2
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: c5.4xlarge
    region: us-east-2
---
apiVersion: nobu.dev/v1
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-someclass-m5large-0
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XCluster
    name: test-xrender
    uid: ""
spec:
  parameters:
    cluster: cluster-name
    machineType: m5.large
    region: us-east-2
```
