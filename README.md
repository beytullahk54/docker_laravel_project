# Laravel Projesi

Bu proje Laravel framework'ü kullanılarak geliştirilmiş bir web uygulamasıdır.

## Gereksinimler

- Docker
- Docker Compose
- Git

## Kurulum

### 1. Docker Kurulumu

Docker'ın resmi kurulum scriptini kullanarak Docker'ı kurun:

```bash
# Docker'ın resmi kurulum scripti
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# User'ı docker grubuna ekle (sudo olmadan kullanmak için)
sudo usermod -aG docker $USER

# Servisi başlat
sudo systemctl enable docker
sudo systemctl start docker
```

### 2. Docker Compose Kurulumu

```bash
# Docker Compose'u indir
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Çalıştırma izni ver
sudo chmod +x /usr/local/bin/docker-compose

# Kurulumu test et
docker-compose --version
```

### 3. Proje Kurulumu

```bash
# Projeyi klonla
git clone [repository-url]
cd [project-directory]

# Environment dosyasını kopyala
cp .env.example .env

# Docker container'ları başlat (production)
docker-compose -f docker-compose.prod.yml up -d

# Composer bağımlılıklarını yükle
docker-compose exec app composer install

# Uygulama anahtarını oluştur
docker-compose exec app php artisan key:generate

# Veritabanı migration'larını çalıştır
docker-compose exec app php artisan migrate
```

## Kullanım

### Geliştirme Ortamı

```bash
# Tüm servisleri başlat (production)
docker-compose -f docker-compose.prod.yml up -d

# Logları görüntüle
docker-compose logs -f

# Container'a bağlan
docker-compose exec app bash
```

### Yararlı Komutlar

```bash
# Artisan komutları
docker-compose exec app php artisan [command]

# Composer komutları
docker-compose exec app composer [command]

# NPM komutları (eğer frontend build gerekiyorsa)
docker-compose exec app npm [command]
```

## Servisler

- **Web Uygulaması**: http://localhost:8000
- **Veritabanı**: MySQL (Port: 3306)
- **Redis**: Port 6379 (eğer kullanılıyorsa)
