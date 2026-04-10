VERSION    ?= 2.4.1
REGISTRY   ?= ghcr.io
NAMESPACE  ?= janvhs
IMAGE_NAME ?= stylua
TAG        ?= ${VERSION}
CONTAINER  ?= container

all:

-include config.mk

REGISTRY.COMPONENT  = ${if ${REGISTRY},${REGISTRY}/}
NAMESPACE.COMPONENT = ${if ${NAMESPACE},${NAMESPACE}/}
IMAGE_ID            = ${REGISTRY.COMPONENT}${NAMESPACE.COMPONENT}${IMAGE_NAME}

all: build

build:
	@printf "CONTAINER:	%s\n" "${IMAGE_ID}:${TAG}"
	@${CONTAINER} \
		build \
		--build-arg STYLUA_VERSION="${VERSION}" \
		--tag "${IMAGE_ID}:${TAG}" \
		.

tag-latest:
	@printf "TAG:	%s -> %s\n" "${IMAGE_ID}:${TAG}" "${IMAGE_ID}:latest"
	@${CONTAINER} \
		image \
		tag \
		"${IMAGE_ID}:${TAG}" \
		"${IMAGE_ID}:latest"
