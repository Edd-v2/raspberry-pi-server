#!/bin/bash

echo "Setting up Nginx configuration..."

# Define source and destination
SRC_DIR="./infra/config/nginx"
DEST_DIR="./infra/config/nginx"

# Create destination directories if they don't exist
mkdir -p ${DEST_DIR}/conf.d
mkdir -p ${DEST_DIR}/html

# Copy main nginx.conf
if [ -f "${SRC_DIR}/nginx.conf" ]; then
    echo "📄 Copying nginx.conf..."
    cp ${SRC_DIR}/nginx.conf ${DEST_DIR}/nginx.conf
else
    echo "❌ nginx.conf not found in ${SRC_DIR}"
    exit 1
fi

# Copy all virtual hosts
if [ "$(ls -A ${SRC_DIR}/conf.d/)" ]; then
    echo "Copying virtual hosts (conf.d)..."
    cp ${SRC_DIR}/conf.d/*.conf ${DEST_DIR}/conf.d/
else
    echo "⚠️ No virtual hosts found in ${SRC_DIR}/conf.d"
fi

# Set safe permissions
chmod 644 ${DEST_DIR}/nginx.conf
chmod 644 ${DEST_DIR}/conf.d/*.conf

# If nginx container exists, reload it
if docker ps --filter "name=nginx" --filter "status=running" | grep nginx; then
    echo "🔄 Reloading Nginx container..."
    docker exec nginx nginx -s reload
    echo "✅ Nginx reloaded successfully!"
else
    echo "⚠️ Nginx container not running. It will pick up changes on next start."
fi

echo "Nginx configuration setup completed!"
