#!/bin/bash

# Script to add hero section to WordPress theme

THEME_DIR="wp-content/themes"
ACTIVE_THEME=$(php wp theme list --status=active --field=name --format=csv | tail -n +2 | head -1)

if [ -z "$ACTIVE_THEME" ]; then
    echo "❌ No active theme found. Please activate a theme first."
    exit 1
fi

THEME_PATH="$THEME_DIR/$ACTIVE_THEME"
echo "📦 Active theme: $ACTIVE_THEME"
echo "📁 Theme path: $THEME_PATH"

# Check if theme exists
if [ ! -d "$THEME_PATH" ]; then
    echo "❌ Theme directory not found: $THEME_PATH"
    exit 1
fi

# Copy hero section PHP file
echo "📝 Adding hero section to theme..."
cp hero-section.php "$THEME_PATH/hero-section.php"

# Copy logo cycler files
echo "📝 Adding logo cycler files..."
cp logo-cycler.js "$THEME_PATH/logo-cycler.js"
cp logo-cycler-wordpress.php "$THEME_PATH/functions-logo-cycler.php"

# Check if functions.php exists
if [ -f "$THEME_PATH/functions.php" ]; then
    # Check if already included
    if ! grep -q "functions-logo-cycler.php" "$THEME_PATH/functions.php"; then
        echo "" >> "$THEME_PATH/functions.php"
        echo "// Errorfect Logo Cycler" >> "$THEME_PATH/functions.php"
        echo "require_once get_template_directory() . '/functions-logo-cycler.php';" >> "$THEME_PATH/functions.php"
        echo "✅ Added logo cycler to functions.php"
    else
        echo "ℹ️  Logo cycler already in functions.php"
    fi
else
    echo "⚠️  functions.php not found. Creating it..."
    echo "<?php" > "$THEME_PATH/functions.php"
    echo "// Errorfect Logo Cycler" >> "$THEME_PATH/functions.php"
    echo "require_once get_template_directory() . '/functions-logo-cycler.php';" >> "$THEME_PATH/functions.php"
fi

# Check if header.php exists
if [ -f "$THEME_PATH/header.php" ]; then
    echo ""
    echo "✅ Files added to theme!"
    echo ""
    echo "📝 Next steps:"
    echo "1. Open: $THEME_PATH/header.php"
    echo "2. Add this line where you want the hero section:"
    echo "   <?php get_template_part('hero-section'); ?>"
    echo ""
    echo "Or add the hero section HTML directly to your header.php"
else
    echo "⚠️  header.php not found. You'll need to add the hero section manually."
fi

echo ""
echo "✅ Hero section files added to theme: $ACTIVE_THEME"

