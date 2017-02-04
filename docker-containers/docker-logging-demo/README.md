Docker-Logging-Demo
======

This creates a docker container with a remote logging demonstration.
This machine logs all messages via rsyslog to a rsyslog-server.
Every 15 min. a log entry is created.

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

Customize 10-rsyslog.conf with your rsyslog server or add a link-alias for hostname "rsyslog-server".
