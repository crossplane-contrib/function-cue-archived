#Version: =~"^v[0-9.]+$"

#Repos: {
	"provider-aws": [...#Version]
	"provider-azure": [...#Version]
	"provider-gcp": [...#Version]
}

#org: {
	"crossplane-contrib": #Repos
	upbound:              #Repos
}

orgs: #org & {
	"crossplane-contrib": {
		"provider-aws": [
			"v0.45.0",
			"v0.44.0",
			"v0.43.0",
			"v0.42.0",
			"v0.41.0",
			"v0.40.0",
		]
		"provider-azure": [
			"v0.20.0",
		]
		"provider-gcp": [
			"v0.22.0",
		]
	}
	upbound: {
		"provider-aws": [
			"v0.34.0",
			"v0.33.0",
			"v0.32.0",
			"v0.31.0",
			"v0.30.0",
			"v0.29.0",
		]
		"provider-azure": [
			"v0.38.0",
			"v0.37.0",
			"v0.36.0",
			"v0.35.0",
			"v0.34.0",
			"v0.33.0",
		]
		"provider-gcp": [
			"v0.38.0",
			"v0.37.0",
			"v0.36.0",
			"v0.35.0",
			"v0.34.0",
			"v0.33.0",
		]
	}
}
