FROM php:8.2-cli

RUN apt-get update && \
    apt-get install -y libgearman-dev libgearman8 && \
    pecl install gearman && \
    docker-php-ext-enable gearman

WORKDIR /app
COPY . /app
