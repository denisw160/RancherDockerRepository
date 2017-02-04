Docker-Logging-Demo
======

This creates a docker container with a wildfly application server.
The application server used GELF for remote logging on server "gelf-server" on udp port 12201.
So add a link-alias for "gelf-server" to your gelf-server.

This container used wildfly-9.0.2. If you need the release of this application server you can
download it from

```
	$ wget https://download.jboss.org/wildfly/9.0.2.Final/wildfly-9.0.2.Final.tar.gz
```

**Build the container**

```
	$ make
```

**Push the container** 

```
	$ make push
```
	
**Run the container**

```
	$ make run 
	or
	$ make start
```

**Customize Container**

Customize standalone.xml with your gelf-server or add a link-alias for hostname "gelf-server".

# More resources
## Configure Wildfly with GELF
- https://github.com/mp911de/logstash-gelf
- http://logging.paluch.biz/examples/wildfly.html

## Configure Docker with GELF
- https://docs.docker.com/engine/admin/logging/overview/

## Configure Wildfly with Commandline
- https://goldmann.pl/blog/2014/07/18/logging-with-the-wildfly-docker-image/
- https://goldmann.pl/blog/2014/07/23/customizing-the-configuration-of-the-wildfly-docker-image/#_using_code_jboss_cli_sh_code
- https://docs.jboss.org/author/display/WFLY8/CLI+Recipes

# Samples for Configuration
- https://github.com/goldmann/wildfly-docker-configuration

# Dockerfile for Wildfly
- https://github.com/jboss-dockerfiles/wildfly
