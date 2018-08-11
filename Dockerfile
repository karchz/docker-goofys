FROM golang:1.10-alpine

LABEL MAINTAINER kometchtech <kometch@gmail.com>

RUN apk update && \
    apk add syslog-ng gcc ca-certificates openssl musl-dev git fuse &&\
    # Goofys
    go get github.com/kahing/goofys && \
    go install github.com/kahing/goofys && \
    # clear cache
    apk del --purge gcc git && \
    rm -rf /var/cache/apk/* /usr/local/share/man /var/rmp/* && \
    # remove goofys dir
    rm -rf go && \
    # add syslog-ng (syslog required by Goofys)
    echo "@version: 3.8" > /etc/syslog-ng/syslog-ng.conf && \
    echo "source s_local {internal();network(transport("udp"));unix-dgram("/dev/log");};" >> /etc/syslog-ng/syslog-ng.conf && \
    echo "destination d_local {file("/var/log/messages");};" >> /etc/syslog-ng/syslog-ng.conf && \
    echo "log {source(s_local);destination(d_local);};" >> /etc/syslog-ng/syslog-ng.conf

RUN mkdir /mnt/mnt_point

ENV MOUNT_DIR=/mnt/mnt_point \
    ENDPOINT=eu-west-1 \
    BUCKET=my-bucket \
    STAT_CACHE_TTL=1m0s \
    TYPE_CACHE_TTL=1m0s \
    DIR_MODE=0755 \
    FILE_MODE=0644 \
    PROFILE=default

ADD ./bin/run.sh /root/run.sh

ENTRYPOINT ["sh"]
CMD ["/root/run.sh"]
