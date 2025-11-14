# Custom Page Template Setup

## ✅ Templates Created

I've created custom page templates for your hero section:

1. **`front-page-hero.php`** - Automatically used for your front page
2. **`home-hero.php`** - Custom template you can assign to any page
3. **`functions-hero.php`** - Template registration functions

## How to Use

### Option 1: Front Page (Automatic)

The `front-page-hero.php` template will automatically be used for your front page. Just:

1. Go to WordPress Admin → Settings → Reading
2. Set "Your homepage displays" to "A static page"
3. Select your front page
4. The hero section will appear automatically!

### Option 2: Assign to Any Page

1. Create or edit a page in WordPress Admin
2. In the page editor, look for "Page Attributes" in the sidebar
3. Under "Template", select "Home with Hero"
4. Save and view the page

## Files Created

- `wp-content/themes/twentytwentyfive/front-page-hero.php`
- `wp-content/themes/twentytwentyfive/home-hero.php`
- `wp-content/themes/twentytwentyfive/functions-hero.php`

## Testing

1. Visit your site: http://localhost:8000
2. The hero section with logo cycler should appear
3. Click the logo to cycle through all 26 variations

## Customization

Edit `hero-section.php` to customize:
- Colors and styling
- Text content
- Button links
- Layout

The logo cycler is already integrated and will work automatically!

