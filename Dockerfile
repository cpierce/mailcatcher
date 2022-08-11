FROM ruby:3.1.2-alpine3.16

RUN set -xe \
    && apk add --no-cache \
        libstdc++ sqlite-libs \
    && apk add --no-cache --virtual .build-deps \
        build-base sqlite-dev \
    && gem install mailcatcher \
    && apk del .build-deps

# expose ports
EXPOSE 1025 1080

CMD ["mailcatcher", "--no-quit", "-f", "--ip=0.0.0.0"]
