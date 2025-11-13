# Email Marketing Setup for Errorfect

## ConvertKit Alternative

The ConvertKit plugin isn't available in the WordPress repository. Here are your options:

### Option 1: ConvertKit Official Plugin (Recommended)
1. Download from: https://wordpress.org/plugins/convertkit/
2. Or install via WordPress admin: Plugins → Add New → Search "ConvertKit"
3. The official plugin name is different - try searching for "ConvertKit" in the plugin directory

### Option 2: Mailchimp (Installed)
- **Plugin:** Mailchimp for WordPress
- **Setup:** Get API key from mailchimp.com
- **Good for:** Email automation, segmentation, free tier available

### Option 3: WPForms Lite (Installed)
- **Plugin:** WPForms Lite
- **Setup:** Create forms, connect to email services
- **Good for:** Lead capture forms, integrates with many email services

### Option 4: Contact Form 7 (Alternative)
- **Plugin:** Contact Form 7
- **Setup:** Simple form builder
- **Good for:** Basic email collection

## Recommended Setup for Errorfect

### For Lead Magnets (Free PDF):
1. **WPForms Lite** - Create email capture form
2. **Mailchimp** - Store and automate emails
3. **Or ConvertKit** - If you prefer their platform

### Integration Steps:

1. **Get ConvertKit API Key** (if using ConvertKit):
   - Sign up at convertkit.com
   - Go to Settings → Advanced → API Secret
   - Add to WordPress plugin settings

2. **Get Mailchimp API Key** (if using Mailchimp):
   - Sign up at mailchimp.com
   - Go to Account → Extras → API keys
   - Add to Mailchimp for WP plugin

3. **Create Lead Magnet Form**:
   - Use WPForms or Mailchimp form builder
   - Add to homepage, blog posts, popup
   - Connect to email service

## Quick Setup Commands

```bash
# If ConvertKit plugin becomes available:
php wp plugin install convertkit --activate

# Or use Mailchimp (already installed):
# Just configure in WordPress admin → Mailchimp for WP

# Or use WPForms (already installed):
# Create forms in WordPress admin → WPForms
```

## Next Steps

1. Visit http://localhost:8000/wp-admin
2. Complete EDD setup wizard (if prompted)
3. Configure email marketing plugin of choice
4. Create your first lead magnet form

