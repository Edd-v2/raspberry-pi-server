
#!/bin/bash

# Colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

echo -e "${GREEN} Starting Docker Compose services...${NC}"

# Retry mechanism
MAX_RETRIES=5
RETRY_DELAY=5  # seconds
COUNT=0

until docker compose up -d
do
  COUNT=$((COUNT + 1))
  echo -e "${RED}⚠️  Attempt $COUNT failed. Retrying in $RETRY_DELAY seconds...${NC}"
  sleep $RETRY_DELAY
  
  if [ "$COUNT" -ge "$MAX_RETRIES" ]; then
    echo -e "${RED}❌ Failed to start services after $MAX_RETRIES attempts. Exiting.${NC}"
    exit 1
  fi
done

echo -e "${GREEN}✅ All services started successfully!${NC}"
