.SUFFIXES:
.DELETE_ON_ERROR:
.PHONY: FORCE

SLUG:=biocommons/dockerbase

GIT_DESCRIBE:=$(shell git describe --tags)
TAG:=$(firstword $(subst -, ,${GIT_DESCRIBE}))
TAG_PARTS:=$(subst ., ,${TAG})
OTHER_TAGS:=$(word 1,${TAG_PARTS}).$(word 2,${TAG_PARTS}) $(word 1,${TAG_PARTS}) latest


default:
	@echo 'No default target; use `make build` or `make push`'
	@echo GIT_DESCRIBE=${GIT_DESCRIBE}
	@echo TAG=${TAG}
	@echo OTHER_TAGS=${OTHER_TAGS}

build: FORCE
	docker build --rm=true -t ${SLUG}:${TAG} .

tag:
	@for t in ${OTHER_TAGS}; do (set -x; docker tag ${SLUG}:${TAG} ${SLUG}:$$t); done

push:
	@for t in ${TAG} ${OTHER_TAGS}; do (set -x; docker push ${SLUG}:$$t); done


# Local Variables:
# tab-width: 4
# End:
