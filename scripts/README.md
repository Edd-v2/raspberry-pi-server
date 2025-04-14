# What this scripts does:

## install_docker.sh

- Updates your Raspberry Pi system.

- Installs all necessary packages.

-  Docker’s official GPG key and repository.

- Installs Docker Engine and Docker Compose plugin.

- Adds your user to the docker group (so you can run docker without sudo).

## start.sh

- It tries to run docker compose up -d.

- If it fails, it retries up to 5 times, waiting 5 seconds between attempts.

- If after 5 tries it still fails, it exits with an error message.

- Clean colored output to easily spot success ✅ or failure ❌.