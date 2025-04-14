#!/bin/bash

echo "🚀 Setting up services..."

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "❌ Docker is not installed. Please run install_docker.sh first."
    exit 1
fi

# Check if docker-compose is installed
if ! command -v docker compose &> /dev/null
then
    echo "❌ Docker Compose plugin is missing. Install it before continuing."
    exit 1
fi

# Pull latest images
echo "📦 Pulling latest Docker images..."
docker compose pull

# Create the backend network if it doesn't exist
if ! docker network ls | grep -q "backend"; then
    echo "🌐 Creating backend network..."
    docker network create backend
else
    echo "🌐 Network 'backend' already exists."
fi

# Launch containers
echo "🚀 Starting containers with Docker Compose..."
docker compose up -d

# Show status
echo "✅ Containers are up and running!"
docker compose ps

echo "🎉 Setup completed successfully!"
