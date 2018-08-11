goofys -f --use-content-type -o allow_other --debug_fuse --debug_s3 --endpoint ${ENDPOINT} --stat-cache-ttl ${STAT_CACHE_TTL} --type-cache-ttl ${TYPE_CACHE_TTL} --dir-mode ${DIR_MODE} --file-mode ${FILE_MODE} --profile ${PROFILE} ${BUCKET} ${MOUNT_DIR}

