#!/bin/bash

# Jenkins installation script for Ubuntu 20.04

set -e

echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing Java..."
sudo apt-get install -y openjdk-11-jdk

echo "Adding Jenkins repository..."
sudo mkdir -p /usr/share/keyrings
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins-archive-keyring.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/jenkins-archive-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list'

echo "Installing Jenkins..."
sudo apt-get update
sudo apt-get install -y jenkins

echo "Starting Jenkins..."
sudo systemctl restart jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

echo "Jenkins installation completed!"
echo "Access Jenkins at http://localhost:8080"
echo "Retrieve initial admin password with: sudo cat /var/lib/jenkins/secrets/initialAdminPassword"