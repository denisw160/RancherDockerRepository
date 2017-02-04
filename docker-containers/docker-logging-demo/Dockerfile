FROM ubuntu:latest
MAINTAINER Denis Wirries

# Updating ...
RUN apt-get update
RUN apt-get -y install rsyslog cron

# Setup rsyslog ...
ADD ./10-rsyslog.conf /etc/rsyslog.d/10-rsyslog.conf

# Setup crontab ...
RUN echo "*/15 * * * * logger This is a message from $HOSTNAME" > ~/cronjobs
RUN crontab ~/cronjobs
RUN rm ~/cronjobs

# Run the command on container startup
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# Build done.