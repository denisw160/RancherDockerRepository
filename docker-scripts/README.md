Useful scripts for Docker
======

Updating all images to latest
```
  $ docker images | awk '{print $1}' | grep -v 'none' | grep -iv 'repo' | xargs -n1 docker pull
```
