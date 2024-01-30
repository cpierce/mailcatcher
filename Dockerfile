FROM ruby:3.3-alpine

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        libstdc++ sqlite-libs gcompat build-base sqlite-dev \
    && gem install sqlite3 --no-document --platform ruby \
    && gem install mailcatcher --no-document \
    && apk del .build-deps

# expose ports
EXPOSE 1025 1080

CMD ["mailcatcher", "--no-quit", "-f", "--ip=0.0.0.0"]
