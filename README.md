Repository for Docker and Rancher
======

A Repository for Docker and Rancher Tests


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

More on http://docs.rancher.com/rancher/v1.3/en/catalog/private-catalog/