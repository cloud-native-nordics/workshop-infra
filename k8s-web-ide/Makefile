all: build
build:
	docker build --pull -t luxas/k8s-web-ide .

push: build
	docker push luxas/k8s-web-ide
