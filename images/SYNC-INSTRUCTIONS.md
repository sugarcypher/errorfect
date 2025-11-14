# Image Sync Instructions

## Local Path

Put your images in:
```
/Users/br14r/Downloads/errorfect/images/
```

## Automatic Syncing to GitHub

### Option 1: Manual Git Commit (Recommended for Images)

Since images are large files, it's best to commit them manually:

```bash
cd /Users/br14r/Downloads/errorfect

# Add specific images
git add images/art/normal-perfect-flaming-letters.jpg
git commit -m "Add NORMAL/PERFECT art piece"
git push
```

### Option 2: Add All New Images

```bash
cd /Users/br14r/Downloads/errorfect

# Add all new/modified images
git add images/
git commit -m "Update images"
git push
```

### Option 3: Watch Folder (Advanced)

If you want automatic syncing, you can set up a file watcher:

**Using fswatch (install via Homebrew):**
```bash
brew install fswatch

# Watch images folder and auto-commit
fswatch -o images/ | xargs -n1 -I{} sh -c 'cd /Users/br14r/Downloads/errorfect && git add images/ && git commit -m "Auto-sync images" && git push'
```

**Or use a Git GUI tool** like:
- GitHub Desktop
- SourceTree
- GitKraken

These can watch for changes and sync automatically.

## Recommended Workflow

1. **Add images** to `/Users/br14r/Downloads/errorfect/images/`
2. **Review changes**: `git status`
3. **Commit when ready**: `git add images/ && git commit -m "Add new images"`
4. **Push to GitHub**: `git push`

## Folder Structure

Organize your images like this:
```
/Users/br14r/Downloads/errorfect/images/
├── art/
│   └── normal-perfect-flaming-letters.jpg
├── blog/
│   └── word-breakdown-featured.jpg
├── products/
│   └── workbook-cover.jpg
├── social/
│   └── instagram-post.jpg
└── workshops/
    └── workshop-promo.jpg
```

## Note

Large image files (>100MB) should be optimized before committing. Consider:
- Compressing images
- Using WebP format
- Storing very large files in cloud storage (S3, Cloudinary) instead

