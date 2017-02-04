Docker-Application-Demo
======

This creates a docker container with a sample application "WildflyPetStore".
This machine contains a wildfly application server (see docker-wildfly-demo, especially logging).
The application requireds a mysql database, you can use docker-mysql-demo.
Adding a docker-link for "mysql". Port of the wildfly-server is 8080, add a port mapping for your environment.

**Open Issues**
- The database connection is setuped via standalone.xml. The username and password shoud 
  be provided via docker environment variable. 
  More on http://www.mastertheboss.com/jboss-server/jboss-configuration/how-to-use-environment-variables-in-standalone-xml-or-host-xml

**Download the application source**

```
	$ ./GetSource.sh
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

Customize standalone.xml with your connection to the mysql database.

# More resources
## MySQL for Application Server
- http://blog.arungupta.me/wildfly-javaee7-mysql-link-two-docker-container-techtip65/ 

## Adding DataSource + Driver
- https://sheemoul.wordpress.com/2014/06/17/configure-mysql-datasource-in-wildfly-8-0/
- http://stackoverflow.com/questions/31250294/wildfly-9-failing-to-load-mysql-driver-on-startup
