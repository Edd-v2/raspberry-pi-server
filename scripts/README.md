
# Scripts Overview

This directory contains utility scripts to install, configure, and manage your Raspberry Pi server environment.

---

## install_docker.sh

Installs Docker and Docker Compose on your Raspberry Pi.  
Includes all required dependencies, sets up the repository, and adds your user to the docker group.

---

## install_nginx.sh

Installs Nginx on the host machine (if needed).  
Useful for users who wish to use native Nginx instead of the Docker container version.

---

## start.sh

Runs `docker compose up -d` to launch all services.  
Retries up to 5 times with delays in case of failure.  
Exits with an error if startup continues to fail.

---

## setup_check.sh

Basic health check script template.  
Intended to test running services or validate setup (can be customized).

---

## setup_firewall.sh

Configures UFW (Uncomplicated Firewall) with secure defaults.  
Allows only SSH (22), HTTP (80), and HTTPS (443) access.  
Denies all other incoming traffic and enables UFW.

---

## setup_nginx_conf.sh

Copies Nginx config files to the correct location.  
Reloads the Nginx container to apply changes if it's running.

---

## search_text.sh

Searches recursively for a given text string in all files starting from the current directory.  
Useful for quickly finding config references or environment variables in the project.

