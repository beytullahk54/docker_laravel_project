FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git unzip zip libzip-dev libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql zip mbstring exif pcntl bcmath gd

# Composer'ı resmi composer image'dan kopyala
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
