
# All-Setups README

## Overview
This repository contains automated setup scripts for installing and configuring essential tools for end-to-end AWS infrastructure management and Kubernetes deployments.

## Prerequisites
- Linux-based OS (Ubuntu 20.04+)
- Sudo privileges
- Internet connectivity

## Packages Installed

- **Jenkins** - CI/CD automation server
- **Docker** - Container runtime
- **Kubelet** - Kubernetes node agent
- **Kube-proxy** - Kubernetes network proxy
- **AWS CLI** - AWS command-line interface
- **eksctl** - EKS cluster management tool
- **zip/unzip** - Compression utilities

## Installation

### Quick Start
```bash
chmod +x setup.sh
./setup.sh
```

### Individual Package Installation
```bash
# Jenkins
./install-jenkins.sh

# Docker
./install-docker.sh

# Kubernetes Components
./install-kubernetes.sh

# AWS Tools
./install-aws-tools.sh
```

## Verification
Run the verification script to confirm all installations:
```bash
./verify-setup.sh
```

## Usage
After setup completion, verify all services are running and configured properly before deploying applications.

## Support
Refer to individual package documentation for detailed configuration.

