ARG PHP_VERSION=8.3
FROM php:${PHP_VERSION}-cli

# Install dependencies required for PCOV
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install PCOV extension
RUN pecl install pcov && docker-php-ext-enable pcov

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
