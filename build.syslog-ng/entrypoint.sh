#!/bin/sh

# set script name for loggin purposes.
me=$(basename $0)

# setup runtime environment
mkdir -p /runtime/syslog-ng /runtime/syslog-ng/logs
cp -R -u /nullping/* /runtime/syslog-ng/.

# ensure runtime permissions are correct.
chown -R syslog.syslog /runtime/syslog-ng

# Start Unbound
#
echo "$me: starting syslog-ng..."
/usr/sbin/syslog-ng -f /runtime/syslog-ng/syslog-ng.conf -F --no-caps
