FROM ruby:3.2-alpine

RUN set -xe \
    && apk add --no-cache \
        build-base sqlite-dev sqlite-libs \
    && ( [ "$(uname -m)" != "aarch64" ] || gem install sqlite3 \
         --version="~>1.3" --no-document --platform ruby ) \
    && gem install mailcatcher --version "~>0.9.0" --no-document \
    && apk del --rdepends --purge build-base sqlite-dev

# expose ports
EXPOSE 1025 1080

CMD ["mailcatcher", "--no-quit", "--foreground", "--ip=0.0.0.0"]
