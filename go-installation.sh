#!/bin/bash

# Determine the latest Go version
LATEST_GO=$(curl -s https://golang.org/dl/ | grep -oP 'go[0-9]+\.[0-9]+\.[0-9]+.linux-amd64.tar.gz' | head -1)

# Download the latest Go version
echo "Downloading $LATEST_GO..."
wget https://golang.org/dl/$LATEST_GO

# Remove any previous Go installation
sudo rm -rf /usr/local/go

# Extract Go archive
sudo tar -C /usr/local -xzf $LATEST_GO

# Clean up downloaded archive
rm $LATEST_GO

# Set Go environment variables for the current session
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

echo "Go installation complete. Version details:"
go version

# Add Go environment variables to .bashrc for future sessions
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

# Apply .bashrc changes to the current session
source ~/.bashrc

echo "Go environment variables added to ~/.bashrc for future sessions."
