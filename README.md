# pest
PHP Docker image for running Pest tests with PCOV extension installed

## Usage

```bash
docker run --rm -v $(pwd):/app rpungello/pest
```

This image includes:
- PHP 8.3 CLI
- [PCOV](https://github.com/krakjoe/pcov) extension for code coverage
- Composer

The default command runs `./vendor/bin/pest` in the `/app` working directory.
