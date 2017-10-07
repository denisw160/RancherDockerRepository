Repository for Docker and Rancher
======

A Repository for Docker and Rancher Tests

# Installing Docker on Ubuntu Server 16.04

A few steps for installing docker on Ubuntu.

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install apt-transport-https ca-certificates mc htop iftop screen

$ sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

$ echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

$ sudo apt update
$ sudo apt upgrade
$ sudo apt-cache policy docker-engine
$ sudo apt install linux-image-extra-$(uname -r) linux-image-extra-virtual
$ sudo apt-get autoremove 

$ sudo apt install docker-engine
$ sudo service docker start

$ sudo docker run hello-world

$ sudo usermod -aG docker [user for docker]
```

## Adding Docker Compose

```
$ sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)"
$ sudo chmod +x /usr/local/bin/docker-compose
$ docker-compose -v
```

# Management Tools

## Standalone 

Using Web-UI for manage docker: http://portainer.io/install.html

```
$ sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
```

## Rancher

Enterprise tool for Docker: http://rancher.io/

```
$ sudo docker run -d --restart=unless-stopped -p 8080:8080 --name rancher-server rancher/server
```

For more install option see http://docs.rancher.com/rancher/v1.2/en/installing-rancher/installing-server/#single-container

# Rancher Catalog

This Repository contains a few samples for Rancher. The Rancher catalog service can import this 
repository into the Rancher server. 

To import this into Rancher see http://docs.rancher.com/rancher/v1.3/en/catalog/

## Structure for the templates

The templates for the catalog found in the folders:
 - Cattle orchestration: Entries in the UI are from the templates folder
 - Kubernetes orchestration: Entries in the UI are from the kubernetes-templates folder
 - Swarm orchestration: Entries in the UI are from the swarm-templates folder
 - Mesos orchestration: Entries in the UI are from the mesos-templates folder

## Sample structure 

```
-- templates (Or any of templates folder)
  |-- app
  |   |-- 0
  |   |   |-- docker-compose.yml
  |   |   |-- rancher-compose.yml
  |   |-- 1
  |   |   |-- docker-compose.yml
  |   |   |-- rancher-compose.yml
  |   |-- catalogIcon-app.svg
  |   |-- config.yml
...
```

More on http://docs.rancher.com/rancher/v1.3/en/catalog/private-catalog/

# Useful commands for Docker and Ansible

## Install docker

```
  $ ansible-playbook [-u remote-user] --ask-become-pass install-docker.yml
```


## Show runing containers

```
  $ ansible dockers -a "docker ps"
```

## Adding cleanup for docker

```
  $ ansible dockers -a "docker run -v /var/run/docker.sock:/var/run/docker.sock:rw -v /var/lib/docker:/var/lib/docker:rw --name docker-cleanup meltwater/docker-cleanup:latest"
```

## Install Rancher Client

```
  $ ansible dockers -a "docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.1.0 {rancher-server-url}"
```
