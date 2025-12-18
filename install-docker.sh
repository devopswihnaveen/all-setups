#!/bin/bash
set -e

echo "========================================"
echo " Installing Docker (Production Safe) "
echo "========================================"

# Variables
USERS=("ubuntu" "jenkins")

echo "[1/8] Updating system..."
sudo apt update -y

echo "[2/8] Installing prerequisites..."
sudo apt install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  apt-transport-https

echo "[3/8] Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "[4/8] Adding Docker repository..."
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[5/8] Updating apt cache..."
sudo apt update -y

echo "[6/8] Installing Docker Engine..."
sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

echo "[7/8] Enabling & starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "[8/8] Fixing Docker permissions..."

# Add users to docker group
for user in "${USERS[@]}"; do
  if id "$user" &>/dev/null; then
    sudo usermod -aG docker "$user"
    echo "Added $user to docker group"
  fi
done

# Ensure docker socket permissions
sudo chown root:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock

echo "========================================"
echo " Docker Installation Completed "
echo "========================================"

echo "IMPORTANT:"
echo " - Logout/login or restart Jenkins service"
echo " - Reboot recommended for group changes"
