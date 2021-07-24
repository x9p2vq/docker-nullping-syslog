FROM alpine:latest
LABEL maintainer="Jason Mitchell <jason@nullping.net>"
LABEL description="syslog server"

# create necessary user and group first
RUN addgroup -g 10001 -S syslog
RUN adduser -G syslog -H -D -S -u 10001 syslog

# setup unbound directories and files
RUN mkdir -p /nullping 
COPY ./config /nullping

# update image and install required packages
RUN apk update
RUN apk add syslog-ng syslog-ng-scl py3-syslog-ng syslog-ng-json syslog-ng-map-value-pairs syslog-ng-tags-parser syslog-ng-http

# expose necesssary ports
EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

# final steps and clean up
RUN rm -rf /var/cache/apk/*
RUN chown -R syslog.syslog /nullping
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
