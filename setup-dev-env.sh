#!/bin/bash

# --------------------------------------
# DevOps Setup Script: LAMP Environment
# Author: Roei Dubin
# Description: Installs Apache, MySQL, PHP, curl if not already installed
# --------------------------------------

# Write log to file
exec > >(tee "setup-log.txt") 2>&1

# Validate OS
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "❌ This script only runs on Linux."
    exit 1
fi

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "❌ Please run this script as root (e.g., sudo ./setup-dev-env.sh)"
    exit 1
fi

echo "🔄 Updating package list..."
apt update

# Install Apache if not installed
if ! command -v apache2 >/dev/null 2>&1; then
    echo "📦 Installing Apache..."
    apt install apache2 -y
else
    echo "✅ Apache is already installed"
fi

# Install MySQL if not installed
if ! command -v mysql >/dev/null 2>&1; then
    echo "📦 Installing MySQL..."
    apt install mysql-server -y
else
    echo "✅ MySQL is already installed"
fi

# Install PHP if not installed
if ! command -v php >/dev/null 2>&1; then
    echo "📦 Installing PHP..."
    apt install php libapache2-mod-php php-mysql -y
else
    echo "✅ PHP is already installed"
fi

# Start Apache if not running
if ! systemctl is-active --quiet apache2; then
    echo "▶️ Starting Apache..."
    systemctl start apache2
else
    echo "🔁 Apache is already running"
fi

# Enable Apache on boot
systemctl enable apache2

# Install curl if not installed
if ! command -v curl >/dev/null 2>&1; then
    echo "📦 Installing curl for health check..."
    apt install curl -y
else
    echo "✅ curl is already installed"
fi

# Test Apache
echo "🌐 Testing Apache server..."
status=$(curl -Is http://localhost | head -n 1)
echo "🔍 Apache response: $status"

echo "✅ LAMP development environment is ready!"
