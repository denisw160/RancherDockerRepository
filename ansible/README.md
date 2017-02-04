Using ansible for automation
======

# Installation
## Ubuntu 14/16

```
	$ sudo apt-add-repository -y ppa:ansible/ansible
	$ sudo apt-get update
	$ sudo apt-get install -y ansible
```

# Managing Servers
Ansible has a default inventory file used to define which servers it will be managing. 
After installation, there's an example one you can reference at /etc/ansible/hosts.

In my case I have two host groups "dockers" (nodes for dockers) and "rpnodes" (nodes of Raspberry PIs).

## Setup ssh-key for authentication
```
	$ mkdir ~/.ssh
	$ chmod 700 ~/.ssh
	$ ssh-keygen -t rsa
```

## Copy ssh-key to remote server
```
	$ ssh-copy-id sysadm@[name oder ip-addres]
```

## Preparing all nodes for ansible

Test and setup the nodes with ansible requirements (see python).

```
	$ ansible dockers -m raw -a "echo hello"
	$ ansible dockers --become --become-user=root --ask-become-pass -m raw -a "apt install -y python-simplejson"
	$ ansible all -m ping
```

# Playbook examples

## Upgrading servers
This playbook upgrades all servers and restarted the servers.

```
	$ ansible-playbook [-u remote-user] --ask-become-pass upgrade-restart.yml
```

## Shutdown servers
This playbook shutdown the server group.

```
	$ ansible-playbook [-u remote-user] --extra-vars "hosts=group" --ask-become-pass shutdown.yml
```

## Adding nfs share
Adding a nfs share for the docker servers.

```
	$ ansible-playbook [-u remote-user] --extra-vars "hosts=group share=server:/var/nfs/directory target=/mnt/directory" --ask-become-pass nfs-client.yml
```

# Useful commands for docker

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
