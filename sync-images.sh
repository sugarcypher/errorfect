#!/bin/bash

# Auto-sync Images File Watcher
# Watches the images folder and automatically commits/pushes changes

IMAGES_DIR="/Users/br14r/Downloads/errorfect/images"
REPO_DIR="/Users/br14r/Downloads/errorfect"

echo "🖼️  Starting image auto-sync watcher..."
echo "📁 Watching: $IMAGES_DIR"
echo "🔄 Changes will be auto-committed and pushed to GitHub"
echo "⏹️  Press Ctrl+C to stop"
echo ""

# Check if fswatch is installed
if ! command -v fswatch &> /dev/null; then
    echo "❌ fswatch not found. Installing..."
    brew install fswatch
fi

# Function to sync images
sync_images() {
    cd "$REPO_DIR" || exit
    
    # Check if there are changes
    if git diff --quiet --exit-code images/ 2>/dev/null && git diff --cached --quiet --exit-code images/ 2>/dev/null; then
        return 0
    fi
    
    echo ""
    echo "📸 Images changed! Syncing..."
    
    # Add all image changes
    git add images/
    
    # Commit with timestamp
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    git commit -m "Auto-sync images: $TIMESTAMP" 2>&1 | grep -v "^$"
    
    # Push to GitHub
    if git push origin main 2>&1 | grep -q "error\|fatal"; then
        echo "⚠️  Push failed. Check your git status."
    else
        echo "✅ Images synced to GitHub!"
    fi
    
    echo ""
}

# Watch for changes
fswatch -o "$IMAGES_DIR" | while read f; do
    sync_images
done

