FROM alpine as builder
RUN apk add --no-cache squid
COPY squid.conf /etc/squid/squid.conf
RUN squid -k parse

FROM alpine
RUN apk add --no-cache squid openssl
COPY --from=builder /etc/squid/squid.conf /etc/squid/squid.conf
COPY --from=builder /var/cache/squid /var/cache/squid
VOLUME ["/var/log/squid", "/var/cache/squid"]
HEALTHCHECK --interval=30s --timeout=3s CMD squid -k check || exit 1
EXPOSE 3128 3129 3130
CMD ["squid", "-N"]