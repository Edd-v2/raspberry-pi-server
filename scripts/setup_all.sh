#!/bin/bash

GREEN="\\033[0;32m"
RED="\\033[0;31m"
NC="\\033[0m"

echo -e "${GREEN}🚀 Starting full Raspberry Pi server setup...${NC}"

# Stop if any script fails
set -e

# Step 1: Install Docker
echo -e "${GREEN}🔧 Installing Docker...${NC}"
./scripts/install_docker.sh

# Step 2: Install UFW and configure firewall
echo -e "${GREEN}🛡️  Configuring firewall...${NC}"
./scripts/setup_firewall.sh

# Step 3: Install Nginx (optional, in case you also want it outside Docker)
echo -e "${GREEN}🌐 Installing Nginx (optional)...${NC}"
./scripts/install_nginx.sh || echo -e "${RED}Skipped Nginx host install.${NC}"

# Step 4: Copy Nginx Docker configs
echo -e "${GREEN}📂 Copying Nginx Docker configs...${NC}"
./scripts/setup_nginx_conf.sh

# Step 5: Start services
echo -e "${GREEN}🚀 Starting services via Docker Compose...${NC}"
./scripts/start.sh

echo -e "${GREEN}✅ All done! Your Raspberry Pi server is fully set up.${NC}"
