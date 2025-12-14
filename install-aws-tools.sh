#!/bin/bash

set -e

echo "Checking for zip and unzip..."
if ! command -v zip &> /dev/null; then
    echo "Installing zip..."
    sudo apt-get update && sudo apt-get install -y zip
fi

if ! command -v unzip &> /dev/null; then
    echo "Installing unzip..."
    sudo apt-get install -y unzip
fi

echo "Checking for AWS CLI..."
if ! command -v aws &> /dev/null; then
    echo "Installing AWS CLI v2..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf awscliv2.zip aws/
else
    echo "AWS CLI is already installed"
fi

echo "Verification complete!"
aws --version
zip --version
unzip -v