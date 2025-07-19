#!/bin/bash
echo "🚀 Laravel Production başlatılıyor..."

# Production environment için
docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d

# Production optimizasyonları
echo "⚙️  Production optimizasyonları yapılıyor..."
docker exec -it laravel-app-prod composer install --optimize-autoloader --no-dev
docker exec -it laravel-app-prod php artisan config:cache
docker exec -it laravel-app-prod php artisan route:cache
docker exec -it laravel-app-prod php artisan view:cache
docker exec -it laravel-app-prod chmod -R 775 storage bootstrap/cache
docker exec -it laravel-app-prod chown -R www-data:www-data storage bootstrap/cache

echo "✅ Production environment hazır!"
echo "🌐 Web: http://your-domain.com"