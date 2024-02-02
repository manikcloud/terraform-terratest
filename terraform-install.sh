#!/bin/bash

# Fetch the latest Terraform version
LATEST_VERSION=$(curl -sL https://releases.hashicorp.com/terraform/ | grep -oE '/terraform/[0-9]+\.[0-9]+\.[0-9]+/' | head -1 | awk -F'/' '{print $3}')

# Download the latest Terraform version
echo "Downloading Terraform version $LATEST_VERSION..."
curl -sLo terraform_${LATEST_VERSION}_linux_amd64.zip "https://releases.hashicorp.com/terraform/${LATEST_VERSION}/terraform_${LATEST_VERSION}_linux_amd64.zip"

# Unzip and install
echo "Installing Terraform..."
unzip terraform_${LATEST_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Clean up
rm terraform_${LATEST_VERSION}_linux_amd64.zip

# Check the installation
echo "Terraform has been installed:"
terraform version
