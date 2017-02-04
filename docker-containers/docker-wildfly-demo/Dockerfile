FROM jboss/wildfly:9.0.2.Final
MAINTAINER Denis Wirries

# Set the build variables
ENV JBOSS_HOME /opt/jboss/wildfly

# Setup gelf logging ...
ADD logstash-gelf-1.11.0-logging-module.zip $JBOSS_HOME/modules/system/layers/base/logstash-gelf-1.11.0-logging-module.zip
RUN unzip $JBOSS_HOME/modules/system/layers/base/logstash-gelf-1.11.0-logging-module.zip -d $JBOSS_HOME/modules/system/layers/base/
RUN rm $JBOSS_HOME/modules/system/layers/base/logstash-gelf-1.11.0-logging-module.zip
ADD standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml

# Build done.
