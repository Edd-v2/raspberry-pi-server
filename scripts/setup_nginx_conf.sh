#!/bin/bash

echo "📂 Setting up Nginx configuration..."

SRC_DIR="./infra/config"
NGINX_DIR="/etc/nginx"
VHOST_DIR="$NGINX_DIR/conf.d"

# Verifica esistenza
if [ ! -f "$SRC_DIR/nginx.conf" ]; then
  echo "❌ nginx.conf not found in $SRC_DIR"
  exit 1
fi

# Backup nginx.conf esistente
sudo cp "$NGINX_DIR/nginx.conf" "$NGINX_DIR/nginx.conf.bak"

# Copia nginx.conf principale
sudo cp "$SRC_DIR/nginx.conf" "$NGINX_DIR/nginx.conf"

# Crea conf.d se non esiste
sudo mkdir -p "$VHOST_DIR"

# Copia virtual hosts
for f in "$SRC_DIR"/*.conf; do
  filename=$(basename "$f")
  if [ "$filename" != "nginx.conf" ]; then
    sudo cp "$f" "$VHOST_DIR/$filename"
    echo "→ Copied $filename to $VHOST_DIR/"
  fi
done

# Test e reload
echo "🔍 Testing Nginx config..."
if sudo nginx -t; then
  echo "✅ Nginx config OK! Reloading..."
  sudo systemctl reload nginx
else
  echo "❌ Config error. Check your .conf files."
fi
