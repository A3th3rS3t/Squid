FROM alpine as builder
RUN apk add --no-cache squid
COPY ./configs/squid.conf /etc/squid/squid.conf
COPY ./configs/conf.d/*.conf /etc/squid/conf.d/
COPY ./configs/ssl/* /etc/squid/ssl/
RUN squid -k parse

FROM alpine
RUN apk add --no-cache squid openssl
COPY --from=builder /etc/squid/squid.conf /etc/squid/squid.conf
COPY --from=builder /var/cache/squid /var/cache/squid
VOLUME ["/var/log/squid", "/var/cache/squid"]
HEALTHCHECK --interval=30s --timeout=3s CMD squid -k check || exit 1
EXPOSE 3128 3129 3130
CMD ["squid", "-N"]