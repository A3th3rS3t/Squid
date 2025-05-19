#!/bin/sh

WORK_DIR=/opt/docker/squid/configs/ssl/squid.pem  # The working variable dir

# Initialize SSL
if [ ! -f "${WORK_DIR}" ]; then
  /scripts/generate-ssl.sh
fi

# Verify config
squid -k parse

# Create cache dir
if [ ! -d "/var/cache/squid/00" ]; then
  squid -z
fi

exec "$@"