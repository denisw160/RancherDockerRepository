NS = localhost:5000
VERSION ?= latest

REPO = docker-wildfly-demo
NAME = docker-wildfly-demo
INSTANCE = default

.PHONY: build push shell run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

shell:
	docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(NS)/$(REPO):$(VERSION) /bin/bash

run:
	docker run --rm -p 8181:8080 --name $(NAME)-$(INSTANCE) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d -p 8181:8080 --name $(NAME)-$(INSTANCE) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(INSTANCE)

release: build
	 make push -e VERSION=$(VERSION)

default: build
