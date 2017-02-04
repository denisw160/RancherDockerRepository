NS = localhost:5000
VERSION ?= latest

REPO = docker-application-demo
NAME = docker-application-demo
INSTANCE = default

.PHONY: build push shell run start stop rm release

build:
	cd WildflyPetStore;mvn -DskipTests clean package
	cp WildflyPetStore/target/applicationPetstore.war petstore.war
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
