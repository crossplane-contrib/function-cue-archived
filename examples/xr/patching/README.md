# [xrender](https://github.com/crossplane-contrib/xrender)

#### Run
```bash
$ xrender xr.yaml composition.yaml functions.yaml
```

#### Produces
```yaml
apiVersion: nopexample.org/v1
kind: XSubnetwork
metadata:
  annotations:
    nobu:
      dev/app: someapp
      dev/cueified: "true"
  name: test-xrender
spec:
  forProvider:
    network: somenetwork
```