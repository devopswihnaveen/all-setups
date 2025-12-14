#!/bin/bash

# Verify End-to-End Java Application Requirements and Dependencies on Ubuntu 20.04

echo "=== Verifying Java Application Setup ==="
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_command() {
    if command -v "$1" &> /dev/null; then
        version=$("$1" --version 2>&1 | head -n 1)
        echo -e "${GREEN}✓${NC} $1: $version"
        return 0
    else
        echo -e "${RED}✗${NC} $1: NOT INSTALLED"
        return 1
    fi
}

# Check Java
echo "--- Java Runtime ---"
check_command java

# Check Maven
echo ""
echo "--- Build Tools ---"
check_command mvn
check_command gradle

# Check Git
echo ""
echo "--- Version Control ---"
check_command git

# Check Docker
echo ""
echo "--- Containerization ---"
check_command docker
check_command docker-compose

# Check AWS CLI
echo ""
echo "--- AWS Tools ---"
check_command aws

# Check Terraform
echo ""
echo "--- Infrastructure as Code ---"
check_command terraform

# Check Node.js (optional)
echo ""
echo "--- Optional Dependencies ---"
check_command node
check_command npm

# Check system resources
echo ""
echo "--- System Resources ---"
echo "CPU Cores: $(nproc)"
echo "Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "Disk Space: $(df -h / | awk 'NR==2 {print $4}')"

echo ""
echo "=== Verification Complete ==="