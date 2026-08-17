ARG PHP_VERSION=8.3
FROM php:${PHP_VERSION}-cli

# Install dependencies required for building PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    ca-certificates \
    wget \
    $PHPIZE_DEPS \
    && rm -rf /var/lib/apt/lists/*

# Download and install PCOV extension from source
RUN cd /tmp && \
    wget --no-check-certificate https://github.com/krakjoe/pcov/archive/refs/tags/v1.0.11.tar.gz -O pcov.tar.gz && \
    tar -xzf pcov.tar.gz && \
    cd pcov-1.0.11 && \
    phpize && \
    ./configure --enable-pcov && \
    make && \
    make install && \
    echo "extension=pcov.so" > /usr/local/etc/php/conf.d/pcov.ini && \
    cd / && rm -rf /tmp/pcov*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
