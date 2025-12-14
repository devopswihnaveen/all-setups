#!/bin/bash

set -e

# Install kubectl
install_kubectl() {
    echo "Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
    kubectl version --client
    echo "kubectl installed successfully"
}

# Install kube-proxy
install_kube_proxy() {
    echo "Installing kube-proxy..."
    KUBE_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    curl -LO "https://dl.k8s.io/release/${KUBE_VERSION}/bin/linux/amd64/kube-proxy"
    chmod +x kube-proxy
    sudo mv kube-proxy /usr/local/bin/
    echo "kube-proxy installed successfully"
}

# Main
main() {
    install_kubectl
    install_kube_proxy
    echo "All components installed successfully"
}

main