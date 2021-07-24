#!/bin/sh

# set script name for logging purposes.
me=$(basename $0)

# setup runtime environment
mkdir -p /runtime/syslog /runtime/syslog/logs
cp -R -u /nullping/* /runtime/syslog/.

# ensure runtime permissions are correct.
chown -R syslog.syslog /runtime/syslog

# Start Syslog Server
#
echo "$me: starting syslog..."
/usr/sbin/syslog-ng -f /runtime/syslog/syslog.conf -F --no-caps
