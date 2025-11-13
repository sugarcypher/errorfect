# Errorfect

WordPress development project.

## Setup

### Prerequisites
- PHP 7.4 or higher
- MySQL/MariaDB
- WordPress CLI (WP-CLI)

### Installation

1. Install PHP (if not already installed):
```bash
brew install php
```

2. Install WP-CLI globally:
```bash
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
```

Or use the local version:
```bash
./wp --info
```

3. Connect to WordPress:
```bash
# Download WordPress core
wp core download

# Create wp-config.php
wp config create --dbname=your_db_name --dbuser=your_db_user --dbpass=your_db_pass

# Or connect to existing WordPress installation
wp core download --path=wp
```

## GitHub Repository
Repository: https://github.com/sugarcypher/errorfect

