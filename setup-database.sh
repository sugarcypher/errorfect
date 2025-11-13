#!/bin/bash

# Errorfect Database Setup Script

echo "🗄️  Setting up Errorfect database..."
echo ""

# Check if MariaDB is running
if ! brew services list | grep -q "mariadb.*started"; then
    echo "Starting MariaDB..."
    brew services start mariadb
    sleep 3
fi

echo "Attempting to create database..."
echo ""

# Try different connection methods
DB_CREATED=false

# Method 1: Try as current user (socket auth)
if /opt/homebrew/bin/mysql -u $(whoami) -e "SELECT 1;" &>/dev/null 2>&1; then
    echo "✅ Connected via socket authentication"
    /opt/homebrew/bin/mysql -u $(whoami) <<EOF
CREATE DATABASE IF NOT EXISTS errorfect_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'errorfect_user'@'localhost' IDENTIFIED BY 'errorfect_pass_2024';
GRANT ALL PRIVILEGES ON errorfect_db.* TO 'errorfect_user'@'localhost';
FLUSH PRIVILEGES;
EOF
    DB_CREATED=true
fi

# Method 2: Try as root without password
if [ "$DB_CREATED" = false ] && /opt/homebrew/bin/mysql -u root -e "SELECT 1;" &>/dev/null 2>&1; then
    echo "✅ Connected as root (no password)"
    /opt/homebrew/bin/mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS errorfect_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'errorfect_user'@'localhost' IDENTIFIED BY 'errorfect_pass_2024';
GRANT ALL PRIVILEGES ON errorfect_db.* TO 'errorfect_user'@'localhost';
FLUSH PRIVILEGES;
EOF
    DB_CREATED=true
fi

if [ "$DB_CREATED" = true ]; then
    echo ""
    echo "✅ Database setup complete!"
    echo ""
    echo "📝 Database credentials:"
    echo "   Database: errorfect_db"
    echo "   Username: errorfect_user"
    echo "   Password: errorfect_pass_2024"
    echo "   Host: localhost"
    echo ""
    echo "⚠️  IMPORTANT: Change the password in production!"
    echo ""
    echo "Next: Configure WordPress"
    echo "cd /Users/br14r/Downloads/errorfect"
    echo "php wp config create --dbname=errorfect_db --dbuser=errorfect_user --dbpass=errorfect_pass_2024"
else
    echo "⚠️  Could not connect automatically. Please run manually:"
    echo ""
    echo "Option 1: If you have a root password:"
    echo "  mysql -u root -p"
    echo ""
    echo "Option 2: If no password is set, try:"
    echo "  mysql -u root"
    echo ""
    echo "Then run these SQL commands:"
    echo ""
    echo "CREATE DATABASE errorfect_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    echo "CREATE USER 'errorfect_user'@'localhost' IDENTIFIED BY 'errorfect_pass_2024';"
    echo "GRANT ALL PRIVILEGES ON errorfect_db.* TO 'errorfect_user'@'localhost';"
    echo "FLUSH PRIVILEGES;"
    echo "EXIT;"
    echo ""
    echo "Or reset root password:"
    echo "  mysql_secure_installation"
fi
