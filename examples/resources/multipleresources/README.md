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
kind: Nodepool
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-example-nodepools
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: example-nodepools
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XBucket
    name: test-xrender
    uid: ""
---
apiVersion: nobu.dev/v1
kind: Cluster
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-example-cluster
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: example-cluster
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XBucket
    name: test-xrender
    uid: ""
---
apiVersion: nobu.dev/v1
kind: Network
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-example-network
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: example-network
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XBucket
    name: test-xrender
    uid: ""
---
apiVersion: nobu.dev/v1
kind: Memorystore
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-example-memorystore
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: example-memorystore
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XBucket
    name: test-xrender
    uid: ""
---
apiVersion: nobu.dev/v1
kind: Firewalls
metadata:
  annotations:
    crossplane.io/composition-resource-name: multiple-objects-example-firewalls
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: example-firewalls
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XBucket
    name: test-xrender
    uid: ""
```