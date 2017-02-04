#!/bin/bash

# Starting rsyslogd in background
/usr/sbin/rsyslogd

# Create a dummy log entry and start cron in foreground
logger Starting on $HOSTNAME
echo Started on $HOSTNAME at $(date)
exec /usr/sbin/cron -f
