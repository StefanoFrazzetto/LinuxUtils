#!/bin/sh

# Install
sudo pacman -Syu docker

# Add user to docker group
sudo usermod -aG docker $USER

# Enable service
systemctl enable docker
systemctl start docker

docker --version

# Install latest release of Compose
sudo curl -L https://github.com/docker/compose/releases/download/latest/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
