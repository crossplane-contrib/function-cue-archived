# [xrender](https://github.com/crossplane-contrib/xrender)

#### Run
```bash
$ xrender xr.yaml composition.yaml functions.yaml
```

#### Produces
```yaml
apiVersion: nopexample.org/v1
kind: XResource
metadata:
  name: test-xrender
---
apiVersion: nobu.dev/v1
kind: Bucket
metadata:
  annotations:
    crossplane.io/composition-resource-name: test-bucket
    nobu.dev/app: someapp
    nobu.dev/cueified: "true"
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: test-bucket
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XResource
    name: test-xrender
    uid: ""
spec:
  forProvider:
    policy: some-bucket-policy
---
apiVersion: nobu.dev/v1
kind: User
metadata:
  annotations:
    crossplane.io/composition-resource-name: test-user
    nobu.dev/app: someapp
    nobu.dev/cueified: "true"
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: test-user
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XResource
    name: test-xrender
    uid: ""
spec:
  forProvider:
    name: somename
---
apiVersion: nobu.dev/v1
kind: Role
metadata:
  annotations:
    crossplane.io/composition-resource-name: test-role
    nobu.dev/app: someapp
    nobu.dev/cueified: "true"
  generateName: test-xrender-
  labels:
    crossplane.io/composite: test-xrender
  name: test-role
  ownerReferences:
  - apiVersion: nopexample.org/v1
    blockOwnerDeletion: true
    controller: true
    kind: XResource
    name: test-xrender
    uid: ""
spec:
  forProvider:
    policy: some-role-policy
```
