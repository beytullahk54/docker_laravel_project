#!/bin/bash

echo "Laravel projesi kuruluyor..."

# Laravel projesini composer ile kur
docker run --rm -v $(pwd):/app composer create-project laravel/laravel temp-laravel

# Dosyaları taşı
mv temp-laravel/* .
mv temp-laravel/.* . 2>/dev/null || true
rmdir temp-laravel

# .env dosyasını ayarla
cp .env.example .env

echo "Laravel projesi başarıyla kuruldu!"
echo "Şimdi 'docker-compose up -d' komutunu çalıştırabilirsin."