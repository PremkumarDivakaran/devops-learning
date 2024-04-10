#!/bin/bash

# Function to check if a package is installed
is_package_installed() {
  if dpkg-l "$1" | grep -q "$1"; then
    return 0  # Package is installed
  else
    return 1  # Package is not installed
  fi
}

# Update package list
sudo apt-get update

# Install Java if not already installed
if ! is_package_installed openjdk-11-jdk; then
    echo 'Installing Java 11'
    sudo apt-get install openjdk-11-jdk -y
else
    echo 'Java is already installed'    
fi

# Install Maven if not already installed
if ! is_package_installed maven; then
    echo 'Installing Maven'
    sudo apt-get install -y maven
else
    echo 'Maven is already installed'      
fi

# Install xvfb if not already installed
if ! is_package_installed xvfb; then
    echo 'Installing xvfb'
    sudo apt-get install -y xvfb
    Xvfb :99&
    export DISPLAY=:99
else
    echo 'xvfb is already installed'      
fi

# Install Chrome if not already installed
if ! is_package_installed google-chrome-stable; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt --fix-broken install -y
    rm google-chrome-stable_current_amd64.deb
else
    echo 'Chrome is already installed'      
fi

echo "Installation complete."
