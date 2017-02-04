Docker-MySql-Demo
======

This creates a docker container with custom configuration for MySql 5.7.

** Build the container **
```
	$ make
```

** Push the container ** 
```
	$ make push
```
	
** Run the container **
Run the container locally. The MySql-Root password is: password
```
	$ make run 
	or
	$ make start
```

** Customize Container **
With these docker parameters, you can setup the user and passwords.
```
	MYSQL_ROOT_PASSWORD=your-root-password
	MYSQL_DATABASE=your-database
	MYSQL_USER=your-user
	MYSQL_PASSWORD=your-user-password
```	

To save your data, create a volume for /var/lib/mysql
