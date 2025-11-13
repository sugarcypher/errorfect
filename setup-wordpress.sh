#!/bin/bash

# Errorfect WordPress Setup Script

echo "🚀 Setting up WordPress for Errorfect..."

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo "❌ PHP is not installed. Installing via Homebrew..."
    brew install php
else
    echo "✅ PHP is installed: $(php -v | head -n 1)"
fi

# Check if WP-CLI is installed globally
if ! command -v wp &> /dev/null; then
    echo "📥 Installing WP-CLI globally..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp
    echo "✅ WP-CLI installed globally"
else
    echo "✅ WP-CLI is already installed: $(wp --version)"
fi

# Verify WP-CLI
echo ""
echo "🔍 Verifying WP-CLI installation..."
wp --info

echo ""
echo "✅ Setup complete! You can now use WordPress CLI commands."
echo ""
echo "Common commands:"
echo "  wp core download          - Download WordPress core"
echo "  wp core install           - Install WordPress"
echo "  wp plugin list            - List installed plugins"
echo "  wp theme list             - List installed themes"
echo ""
echo "To connect to an existing WordPress site:"
echo "  wp core download --path=wp"
echo "  wp config create --dbname=DB_NAME --dbuser=DB_USER --dbpass=DB_PASS"

