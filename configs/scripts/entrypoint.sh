#!/bin/sh

# Initialize SSL
if [ ! -f "/etc/squid/ssl/squid.pem" ]; then
  /scripts/generate-ssl.sh
fi

# Verify config
squid -k parse

# Create cache dir
if [ ! -d "/var/cache/squid/00" ]; then
  squid -z
fi

exec "$@"