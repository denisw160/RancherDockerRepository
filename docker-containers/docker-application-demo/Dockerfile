FROM localhost:5000/docker-wildfly-demo
MAINTAINER Denis Wirries

# Set the build variables
ENV JBOSS_HOME /opt/jboss/wildfly

# Adding application ...
ADD petstore.war  $JBOSS_HOME/standalone/deployments/petstore.war

# Adding mysql-connector and datasource configuration ...
ADD mysql-connector-java-5.1.40-module.zip $JBOSS_HOME/modules/system/layers/base/mysql-connector-java-5.1.40-module.zip
RUN unzip $JBOSS_HOME/modules/system/layers/base/mysql-connector-java-5.1.40-module.zip -d $JBOSS_HOME/modules/system/layers/base/
RUN rm $JBOSS_HOME/modules/system/layers/base/mysql-connector-java-5.1.40-module.zip
ADD standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml

# Build done.
