# Installing Plugins for Errorfect

## Important: Plugins are NOT in Git

Plugins are excluded from git (see `.gitignore`) because they contain third-party code and test keys. Install them using WP-CLI instead.

## Required Plugins for Monetization

### Already Installed (if you ran the commands):
- ✅ Easy Digital Downloads
- ✅ WooCommerce  
- ✅ Mailchimp for WP
- ✅ WPForms Lite

### To Reinstall After Cloning:

```bash
cd /Users/br14r/Downloads/errorfect

# Install monetization plugins
php wp plugin install easy-digital-downloads --activate
php wp plugin install woocommerce --activate
php wp plugin install mailchimp-for-wp --activate
php wp plugin install wpforms-lite --activate
```

## Additional Recommended Plugins

### For Email Marketing:
```bash
# ConvertKit (if you prefer it over Mailchimp)
# Note: Must be installed via WordPress admin or downloaded manually
# Visit: https://wordpress.org/plugins/convertkit/
```

### For Lead Generation:
```bash
php wp plugin install optinmonster --activate
# Or
php wp plugin install convertbox --activate
```

### For Membership:
```bash
# MemberPress (paid plugin - download from memberpress.com)
# Or
php wp plugin install paid-memberships-pro --activate
```

## Plugin Management

### List Installed Plugins:
```bash
php wp plugin list
```

### Update All Plugins:
```bash
php wp plugin update --all
```

### Deactivate a Plugin:
```bash
php wp plugin deactivate plugin-name
```

### Delete a Plugin:
```bash
php wp plugin delete plugin-name
```

## Why Plugins Aren't in Git

1. **Size**: Plugins are large and change frequently
2. **Security**: Some plugins contain test API keys (like Stripe test keys)
3. **Updates**: Plugins should be updated via WordPress admin or WP-CLI
4. **Best Practice**: Only commit custom code, not third-party plugins

## After Fresh Install

When setting up on a new machine or after cloning:

1. Install WordPress: `php wp core download` (if needed)
2. Configure database: See `DATABASE-INFO.md`
3. Install plugins: Run the commands above
4. Configure plugins: Visit `/wp-admin` to set up each plugin

