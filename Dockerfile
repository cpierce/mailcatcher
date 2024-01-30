FROM ruby:3.1.2-alpine

# Create and set the /app directory as the working directory
WORKDIR /app

# Set GEM_HOME to /app
ENV GEM_HOME=/app

# Add /app/bin to PATH
ENV PATH="${GEM_HOME}/bin:${PATH}"

# Copy environment files
COPY . .

RUN set -xe \
    && apk add --no-cache \
        libstdc++ sqlite-libs \
    && apk add --no-cache --virtual .build-deps \
        build-base sqlite-dev \
    && bundle install \
    && apk del .build-deps

# expose ports
EXPOSE 1025 1080

CMD ["mailcatcher", "--no-quit", "-f", "--ip=0.0.0.0"]
