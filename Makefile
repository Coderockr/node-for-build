all: build

IMAGE=coderockr/node-for-build
TAG=$(shell git branch | grep \* | cut -d ' ' -f2)

build:
	docker build --pull . -t $(IMAGE):$(TAG)

push: build
	docker push $(IMAGE):$(TAG)

