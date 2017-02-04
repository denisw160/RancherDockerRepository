NS = localhost:5000
VERSION ?= latest

REPO = docker-mysql-demo
NAME = docker-mysql-demo
INSTANCE = default

.PHONY: build push shell run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

shell:
	docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(NS)/$(REPO):$(VERSION) /bin/bash

run:
	docker run --rm -p 33060:3306 -e MYSQL_ROOT_PASSWORD=password --name $(NAME)-$(INSTANCE) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d -p 33060:3306 -e MYSQL_ROOT_PASSWORD=password --name $(NAME)-$(INSTANCE) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(INSTANCE)

release: build
	 make push -e VERSION=$(VERSION)

default: build
