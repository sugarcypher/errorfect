#!/bin/bash

# Start WordPress Development Server

cd /Users/br14r/Downloads/errorfect

echo "🚀 Starting Errorfect WordPress server..."
echo ""
echo "Server will run at: http://localhost:8000"
echo "Press Ctrl+C to stop"
echo ""

# Check if MariaDB is running
if ! brew services list | grep -q "mariadb.*started"; then
    echo "⚠️  Starting MariaDB..."
    brew services start mariadb
    sleep 2
fi

# Start PHP development server
php -S localhost:8000

