#!/bin/bash

# WordPress Connection Helper Script

echo "🔗 WordPress Connection Setup"
echo ""

# Check if WordPress is already downloaded
if [ ! -d "wp" ]; then
    echo "📥 Downloading WordPress core..."
    php wp core download
    echo "✅ WordPress downloaded"
else
    echo "✅ WordPress core already exists"
fi

echo ""
echo "📝 Next steps:"
echo ""
echo "1. Create a database (if you haven't already):"
echo "   mysql -u root -p"
echo "   CREATE DATABASE errorfect_db;"
echo ""
echo "2. Configure WordPress:"
echo "   php wp config create --dbname=errorfect_db --dbuser=root --dbpass=YOUR_PASSWORD"
echo ""
echo "3. Install WordPress:"
echo "   php wp core install --url=http://localhost/errorfect --title='Errorfect' --admin_user=admin --admin_password=YOUR_PASSWORD --admin_email=admin@example.com"
echo ""
echo "Or connect to an existing WordPress installation:"
echo "   php wp core download --path=/path/to/wordpress"
echo "   cd /path/to/wordpress"
echo "   php wp config create --dbname=DB_NAME --dbuser=DB_USER --dbpass=DB_PASS"

