#!/bin/bash

# Jenkins installation script for Ubuntu 20.04

set -e

echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing Java..."
sudo apt-get install -y openjdk-11-jdk

echo "Adding Jenkins repository..."
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

echo "Installing Jenkins..."
sudo apt-get update
sudo apt-get install -y jenkins

echo "Starting Jenkins..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Jenkins installation completed!"
echo "Access Jenkins at http://localhost:8080"
echo "Retrieve initial admin password with: sudo cat /var/lib/jenkins/secrets/initialAdminPassword"