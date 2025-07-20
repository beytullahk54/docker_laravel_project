# Laravel

# Kurulum

# Docker'ın resmi kurulum scripti
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# User'ı docker grubuna ekle (sudo olmadan kullanmak için)
sudo usermod -aG docker $USER

# Servisi başlat
sudo systemctl enable docker
sudo systemctl start docker

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Çalıştırma izni ver
sudo chmod +x /usr/local/bin/docker-compose

# Test et
docker-compose --version