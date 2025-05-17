# Squid
Web proxy

Структура файлов:
/squid
│── /configs
│   ├── squid.conf
│   ├── /conf.d
│   │   ├── acl.conf
│   │   ├── cache.conf
│   │   └── ssl.conf
│── /scripts
│   ├── generate-ssl.sh
│   ├── entrypoint.sh
├── Dockerfile
├── docker-compose.yml
├── README.md