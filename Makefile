DOCKER_NAME = dpirotte/debian-packager
VERSIONS = wheezy jessie stretch

default: ${VERSIONS}

dockerfiles: $(addsuffix /Dockerfile,$(VERSIONS))

%/Dockerfile: Dockerfile.template
	mkdir -p $* && sed "s/%%VERSION%%/$*/" Dockerfile.template > $*/Dockerfile

%: %/Dockerfile
	docker build -t ${DOCKER_NAME}:$* $*
