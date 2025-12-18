#!/bin/bash
set -e

echo "=============================="
echo " Installing Trivy Scanner "
echo "=============================="

echo "[1/5] Updating system packages..."
sudo apt update -y

echo "[2/5] Installing prerequisites..."
sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

echo "[3/5] Adding Trivy GPG key..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key \
| gpg --dearmor \
| sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

echo "[4/5] Adding Trivy APT repository..."
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" \
| sudo tee /etc/apt/sources.list.d/trivy.list > /dev/null

echo "[5/5] Installing Trivy..."
sudo apt update -y
sudo apt install -y trivy

echo "=============================="
echo " Trivy Installation Complete "
echo "=============================="

echo "Verifying Trivy installation..."
trivy --version
