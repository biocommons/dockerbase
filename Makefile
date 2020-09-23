.SUFFIXES:
.DELETE_ON_ERROR:
.PHONY: FORCE

TAG:=$(shell git describe --tags)
SLUG:=biocommons/dockerbase
OTHER_TAGS:=latest


default:
	@echo 'No default target; use `make build` or `make push`'


build: FORCE
	docker build --rm=true -t ${SLUG}:${TAG} .

tag:
	@for t in ${OTHER_TAGS}; do (set -x; docker tag ${SLUG}:${TAG} ${SLUG}:$$t); done

push:
	@for t in ${TAG} ${OTHER_TAGS}; do (set -x; docker push ${SLUG}:$$t); done


# Local Variables:
# tab-width: 4
# End:
