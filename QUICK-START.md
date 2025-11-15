# Errorfect Quick Start Guide

## 🚀 Start Your Site

### Option 1: Quick Start Script
```bash
cd /Users/br14r/Downloads/errorfect
./start-server.sh
```

### Option 2: Manual Start
```bash
cd /Users/br14r/Downloads/errorfect

# Start MariaDB (if not running)
brew services start mariadb

# Start PHP server
php -S localhost:8000
```

## 📍 Important URLs

- **Homepage:** http://localhost:8000
- **WordPress Admin:** http://localhost:8000/wp-admin
  - Username: `admin`
  - Password: `admin123`
- **Glossary Page:** http://localhost:8000/?page_id=17

## 🛑 Stop Server

Press `Ctrl+C` in the terminal where the server is running.

## 🔧 Troubleshooting

### Server won't start?
1. Check if port 8000 is in use:
   ```bash
   lsof -i :8000
   ```
2. Use a different port:
   ```bash
   php -S localhost:8080
   ```

### Database connection error?
```bash
brew services start mariadb
```

### Can't access wp-admin?
- Make sure WordPress URLs are set correctly:
  ```bash
  php wp option get siteurl
  php wp option get home
  ```
- If they're wrong, update them:
  ```bash
  php wp option update home http://localhost:8000
  php wp option update siteurl http://localhost:8000
  ```

## 📝 Next Steps

1. ✅ Start server: `./start-server.sh`
2. ✅ Visit: http://localhost:8000
3. ✅ View glossary: http://localhost:8000/?page_id=17
4. ✅ Customize theme and content

