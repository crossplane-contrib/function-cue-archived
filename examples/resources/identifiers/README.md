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
apiVersion: nobu.dev/v1
kind: XCluster
metadata:
  annotations:
    crossplane.io/composition-resource-name: identifier
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: cluster
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XBucket
    name: test-xrender
    uid: ""
spec:
  forProvider:
    masterAuthorizedNetworksConfig:
      cidrBlocks:
      - cidrBlock: 10.0.0.0/18
        name: somevpc
      - cidrBlock: 1.0.0.0/32
        name: vpn
    network: somenetwork
```