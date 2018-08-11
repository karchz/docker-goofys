#!/bin/sh
syslog-ng
goofys -f --endpoint $ENDPOINT --stat-cache-ttl $STAT_CACHE_TTL --type-cache-ttl $TYPE_CACHE_TTL --dir-mode $DIR_MODE --file-mode $FILE_MODE --profile ${PROFILE} $BUCKET $MOUNT_DIR

