variable "SOURCE_DATE_EPOCH" {
	default = 0
}

target "default" {
	tags = ["davidkarlsson416/scout-demo-service:v1"]
	output = ["type=image,push=true"]
	platforms = ["linux/amd64", "linux/arm64"]
	attest = [
		"type=provenance,mode=max",
		"type=sbom"
	]
	annotations = ["org.opencontainers.image.authors=dvdksn"]
	args = {
		SOURCE_DATE_EPOCH = SOURCE_DATE_EPOCH
	}
}
