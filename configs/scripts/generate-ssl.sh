#!/bin/sh
mkdir -p /etc/squid/ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
  -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
  -keyout /etc/squid/ssl/squid.key \
  -out /etc/squid/ssl/squid.crt
cat /etc/squid/ssl/squid.key /etc/squid/ssl/squid.crt > /etc/squid/ssl/squid.pem
chmod 600 /etc/squid/ssl/*