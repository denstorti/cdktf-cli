REPO ?= denstorti

CDKTF_VERSION ?= 0.0.12
TF_VERSION ?= 0.12.29

IMAGE_NAME ?= cdktf-cli
DOCKER_HUB_TOKEN ?=

all: build run push

build:
	docker build \
		--build-arg CDKTF_VERSION=${CDKTF_VERSION} \
		--build-arg TF_VERSION=${TF_VERSION} \
		--tag "${IMAGE_NAME}:${CDKTF_VERSION}" \
		--tag "${IMAGE_NAME}:latest" \
		--tag "${REPO}/${IMAGE_NAME}:latest" \
		--tag "${REPO}/${IMAGE_NAME}:${CDKTF_VERSION}" \
		- < Dockerfile

push:
	docker login --username ${REPO} --password ${DOCKER_HUB_TOKEN}
	docker push ${REPO}/${IMAGE_NAME}:${CDKTF_VERSION}
	docker push ${REPO}/${IMAGE_NAME}:latest

run: 
	docker run --rm ${IMAGE_NAME}:${CDKTF_VERSION} cdktf
	docker run --rm ${IMAGE_NAME}:${CDKTF_VERSION} terraform
