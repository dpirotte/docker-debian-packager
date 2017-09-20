DOCKER_NAME = dpirotte/debian-packager
VERSIONS = wheezy jessie stretch

.PHONY: default
default: $(addsuffix /image,$(VERSIONS))

.PHONY: dockerfiles
dockerfiles: $(addsuffix /Dockerfile,$(VERSIONS))

.PHONY: $(addsuffix /image,$(VERSIONS))
%/image: %/Dockerfile
	docker build -t ${DOCKER_NAME}:$* $*

%/Dockerfile: Dockerfile.template
	mkdir -p $* && sed "s/%%VERSION%%/$*/" Dockerfile.template > $*/Dockerfile
