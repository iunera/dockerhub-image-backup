FROM alpine:3
LABEL maintainer="christian.schmitt@iunera.com"

RUN apk add --update ca-certificates \
    curl \
    jq \
    bash \
    && \
    rm -rf /var/lib/apk/lists/* && \
    rm /var/cache/apk/*

RUN apk update && \
    apk add --no-cache docker-cli \
    && \
    rm -rf /var/lib/apk/lists/* && \
    rm /var/cache/apk/*

ADD backup.sh /usr/local/bin

ENTRYPOINT [ "backup.sh" ]
