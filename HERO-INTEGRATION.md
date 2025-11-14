# Hero Section Integration Guide

## ✅ Files Added to Theme

The following files have been added to your active theme (`twentytwentyfive`):

1. **`hero-section.php`** - Hero section template with logo cycler
2. **`logo-cycler.js`** - JavaScript for logo cycling
3. **`functions-logo-cycler.php`** - WordPress integration (enqueued in functions.php)

## How to Add Hero Section to Your Theme

### Option 1: Using Template Part (Recommended)

Add this to your theme's `header.php` or `front-page.php`:

```php
<?php get_template_part('hero-section'); ?>
```

### Option 2: Direct Include

Add this where you want the hero section:

```php
<?php include get_template_directory() . '/hero-section.php'; ?>
```

### Option 3: WordPress Block Theme (Twenty Twenty-Five)

Since you're using a block theme, you can:

1. **Create a custom template:**
   - Go to WordPress Admin → Appearance → Editor → Templates
   - Create a new template or edit "Home"
   - Add a "Custom HTML" block with:

```html
<?php get_template_part('hero-section'); ?>
```

2. **Or use the shortcode:**
   ```php
   [errorfect_logo class="hero-logo"]
   ```

## Logo Cycler Features

- ✅ Automatically detects all 26 logos in `images/branding/logos/`
- ✅ Cycles through logos on click
- ✅ Smooth fade transition
- ✅ Hover effects
- ✅ Responsive design
- ✅ Works with WordPress and standalone

## Testing

1. Visit your homepage: http://localhost:8000
2. The hero section should appear with the logo
3. Click the logo to cycle through all 26 variations
4. Check browser console for any errors

## Customization

Edit `hero-section.php` to customize:
- Colors and gradients
- Typography
- Button styles
- Layout and spacing
- Logo size and positioning

## Files Location

- Theme files: `wp-content/themes/twentytwentyfive/`
- Logo images: `images/branding/logos/` (26 PNG files)
- JavaScript: `wp-content/themes/twentytwentyfive/logo-cycler.js`

