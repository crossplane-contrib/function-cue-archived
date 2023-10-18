# [xrender](https://github.com/crossplane-contrib/xrender)

#### Run
```bash
$ xrender xr.yaml composition.yaml functions.yaml
```

#### Produces
```yaml
apiVersion: nopexample.org/v1
kind: XBucket
metadata:
  name: test-xrender
---
apiVersion: eks.nobu.dev/v1beta
kind: XNodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: conditional
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: TestNodepool
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XBucket
    name: test-xrender
    uid: ""
spec:
  parameters:
    autoscaling:
    - maxNodeCount: 1
      minNodeCount: 1
    clusterName: example1
    region: us-east-2
```