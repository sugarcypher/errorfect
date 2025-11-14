#!/bin/bash

# Start Image Auto-Sync (Background Process)
# This runs the file watcher in the background

SCRIPT_DIR="/Users/br14r/Downloads/errorfect"
SYNC_SCRIPT="$SCRIPT_DIR/sync-images.sh"
LOG_FILE="$SCRIPT_DIR/image-sync.log"
PID_FILE="$SCRIPT_DIR/image-sync.pid"

# Check if already running
if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE")
    if ps -p "$OLD_PID" > /dev/null 2>&1; then
        echo "⚠️  Image sync is already running (PID: $OLD_PID)"
        echo "   Stop it with: ./stop-image-sync.sh"
        exit 1
    else
        rm "$PID_FILE"
    fi
fi

# Start in background
nohup "$SYNC_SCRIPT" > "$LOG_FILE" 2>&1 &
SYNC_PID=$!

# Save PID
echo $SYNC_PID > "$PID_FILE"

echo "✅ Image auto-sync started!"
echo "   PID: $SYNC_PID"
echo "   Log: $LOG_FILE"
echo "   Stop with: ./stop-image-sync.sh"
echo ""
echo "📁 Watching: /Users/br14r/Downloads/errorfect/images/"
echo "🔄 Changes will auto-commit and push to GitHub"

