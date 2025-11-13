# Errorfect

**Language Spellbreaking & Lexicon Alchemy**

> A method for breaking open loaded English words ("normal," "perfect," "crazy," etc.) to expose their hidden rules and rewrite how people think and feel.

## What is Errorfect?

**Errorfect** is born from the art piece where "PERFECT" had its first letter removed, revealing **"error-fect"** — exposing that perfection is built from error, not free from it.

The method deconstructs weaponized words through:
- **Etymology** - Tracing words to their original meanings
- **Wordplay** - Breaking words apart to reveal hidden structures (normal → or/mal, perfect → error-fect)
- **Epistemology** - Understanding how language shapes thought and reality

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

## 💰 Monetization Setup

This project is configured for monetization from day one. See:

- **MONETIZATION-QUICKSTART.md** - Step-by-step guide to start earning
- **MONETIZATION-SETUP.md** - Complete monetization strategy and plugins
- **PROJECT-VISION.md** - Full project vision and revenue streams

### Revenue Streams
1. **Digital Products** ($10-30) - PDFs, workbooks, mini-courses
2. **Live Workshops** ($50-150) - Group sessions and labs
3. **1:1 Coaching** ($200-500/session) - Personalized language deprogramming
4. **Membership** ($20-50/month) - Premium content and community
5. **Affiliate/Partnerships** - Book and tool recommendations

### Quick Monetization Setup
```bash
# Install essential monetization plugins
php wp plugin install easy-digital-downloads --activate
php wp plugin install woocommerce --activate
php wp plugin install convertkit --activate
```

## Files

- `wp` - WordPress CLI executable (use with `php wp`)
- `setup-wordpress.sh` - Initial setup script
- `connect-wordpress.sh` - WordPress connection helper
- `wp-plugins-setup.sh` - Monetization plugins guide
- `wp-config-example.php` - Example WordPress configuration file
- `MONETIZATION-QUICKSTART.md` - **Start here for monetization**
- `MONETIZATION-SETUP.md` - Complete monetization strategy
- `PROJECT-VISION.md` - Project vision and roadmap
- `CONTENT-OUTLINE.md` - Content plan and blog post ideas

