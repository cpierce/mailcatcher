FROM ruby:3.2.2-alpine

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        libstdc++ sqlite-libs build-base sqlite-dev \
    && gem install mailcatcher \
    && apk del .build-deps

# expose ports
EXPOSE 1025 1080

CMD ["mailcatcher", "--no-quit", "-f", "--ip=0.0.0.0"]
