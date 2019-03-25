# In production, this would be something like docker.io or gcr.io
REGISTRY?=localhost
USER?=cloudnativenordics
IMAGE_NAME?=nodejs-app
VERSION?=v0.1.0
IMAGE=$(REGISTRY)/$(USER)/$(IMAGE_NAME):$(VERSION)

build:
	docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)
