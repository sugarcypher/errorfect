# Database Information

## ✅ Database Setup Complete

### Connection Details
- **Database Name:** `errorfect_db`
- **Username:** `errorfect_user`
- **Password:** `errorfect_pass_2024`
- **Host:** `localhost`
- **Character Set:** `utf8mb4`
- **Collation:** `utf8mb4_unicode_ci`

### WordPress Admin
- **URL:** http://localhost/errorfect/wp-admin
- **Username:** `admin`
- **Password:** `admin123`
- **Email:** admin@errorfect.local

⚠️ **IMPORTANT:** Change these passwords before going to production!

## Database Management

### Connect to Database
```bash
mysql -u errorfect_user -p errorfect_db
# Password: errorfect_pass_2024
```

### Backup Database
```bash
mysqldump -u errorfect_user -p errorfect_db > backup.sql
```

### Restore Database
```bash
mysql -u errorfect_user -p errorfect_db < backup.sql
```

### Using WP-CLI
```bash
# Export database
php wp db export backup.sql

# Import database
php wp db import backup.sql

# Reset database (WARNING: deletes all data)
php wp db reset --yes
```

## MariaDB Service

### Start/Stop Service
```bash
# Start
brew services start mariadb

# Stop
brew services stop mariadb

# Restart
brew services restart mariadb

# Check status
brew services list | grep mariadb
```

## Troubleshooting

### If database connection fails:
1. Check MariaDB is running: `brew services list | grep mariadb`
2. Start MariaDB: `brew services start mariadb`
3. Verify connection: `mysql -u errorfect_user -p errorfect_db`

### Reset Database
```bash
# Drop and recreate
mysql -u errorfect_user -p <<EOF
DROP DATABASE IF EXISTS errorfect_db;
CREATE DATABASE errorfect_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
EOF

# Then reinstall WordPress
php wp core install --url=http://localhost/errorfect --title='Errorfect' --admin_user=admin --admin_password=admin123 --admin_email=admin@errorfect.local
```

