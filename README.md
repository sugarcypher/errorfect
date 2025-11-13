# Errorfect

WordPress development project.

## ✅ Setup Complete

### Installed Components
- ✅ PHP 8.4.14 (via Homebrew)
- ✅ WordPress CLI (WP-CLI) 2.12.0 (local installation)
- ✅ Git repository initialized
- ✅ GitHub repository created

## Quick Start

### Using WordPress CLI

The project includes a local WP-CLI installation. Use it with:

```bash
php wp <command>
```

For example:
```bash
php wp --info
php wp core download
php wp plugin list
```

### Connect to WordPress

Run the connection helper script:
```bash
./connect-wordpress.sh
```

Or manually:

1. **Download WordPress core:**
```bash
php wp core download
```

2. **Create database configuration:**
```bash
php wp config create --dbname=errorfect_db --dbuser=root --dbpass=YOUR_PASSWORD
```

3. **Install WordPress:**
```bash
php wp core install --url=http://localhost/errorfect --title='Errorfect' --admin_user=admin --admin_password=YOUR_PASSWORD --admin_email=admin@example.com
```

### Connect to Existing WordPress Site

If you have an existing WordPress installation:

```bash
php wp core download --path=/path/to/wordpress
cd /path/to/wordpress
php wp config create --dbname=DB_NAME --dbuser=DB_USER --dbpass=DB_PASS
```

## Common WP-CLI Commands

```bash
# Plugin management
php wp plugin list
php wp plugin install <plugin-name>
php wp plugin activate <plugin-name>

# Theme management
php wp theme list
php wp theme install <theme-name>
php wp theme activate <theme-name>

# Database operations
php wp db export backup.sql
php wp db import backup.sql

# User management
php wp user list
php wp user create username email@example.com --role=administrator
```

## GitHub Repository
🔗 https://github.com/sugarcypher/errorfect

## Files

- `wp` - WordPress CLI executable (use with `php wp`)
- `setup-wordpress.sh` - Initial setup script
- `connect-wordpress.sh` - WordPress connection helper
- `wp-config-example.php` - Example WordPress configuration file

