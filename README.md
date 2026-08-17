# pest
PHP Docker image for running Pest tests

This repository builds Docker images for running [Pest](https://pestphp.com/) tests for PHP applications. Each image includes the PCOV extension for code coverage.

## Available Images

Images are built for all publicly available PHP 8.x versions:
- PHP 8.0
- PHP 8.1
- PHP 8.2
- PHP 8.3
- PHP 8.4

## Features

- Based on official `php:8.x-cli` images
- PCOV extension pre-installed for code coverage
- Composer pre-installed
- Git, zip, and unzip utilities included

## Usage

The images are built automatically via GitHub Actions whenever changes are pushed to the repository.

### Building Locally

To build an image locally:

```bash
docker build --build-arg PHP_VERSION=8.3 -t pest-php:8.3 .
```

### Running Tests

```bash
docker run --rm -v $(pwd):/app pest-php:8.3 vendor/bin/pest
```

### Running with Coverage

```bash
docker run --rm -v $(pwd):/app pest-php:8.3 vendor/bin/pest --coverage
```

