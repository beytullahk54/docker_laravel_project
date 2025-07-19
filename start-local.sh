#!/bin/bash
echo "🚀 Laravel Local Development başlatılıyor..."

# Local environment için
docker-compose -f docker-compose.local.yml down
docker-compose -f docker-compose.local.yml up -d

echo "✅ Local development hazır!"
echo "🌐 Web: http://localhost:8000"
echo "🗄️  MySQL: localhost:3306 (root/root)"
echo "📦 Redis: localhost:6379"