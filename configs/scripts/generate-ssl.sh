#!/bin/sh

WORK_DIR=/opt/docker/squid/configs/ssl  # The working variable dir

mkdir -p ${WORK_DIR}
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
  -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
  -keyout ${WORK_DIR}/squid.key \
  -out ${WORK_DIR}/squid.crt
cat ${WORK_DIR}/squid.key ${WORK_DIR}/squid.crt > ${WORK_DIR}/squid.pem
chmod 600 ${WORK_DIR}/*