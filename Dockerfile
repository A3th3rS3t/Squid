# Этап сборки: проверка конфигурации
FROM alpine as builder

RUN apk add --no-cache squid

# Проверка синтаксиса конфига
RUN squid -k parse

# Финальный образ
FROM alpine

RUN apk add --no-cache squid

# Копируем ВСЮ конфигурацию и SSL-сертификаты из builder
COPY --from=builder /etc/squid/ /etc/squid/

# HEALTHCHECK с проверкой работы Squid
HEALTHCHECK --interval=30s --timeout=3s \
  CMD nc -z localhost 3128 || exit 1

# Открываем только нужные порты (3128 по умолчанию)
EXPOSE 3128

# Запуск в foreground-режиме
CMD ["squid", "-N"]