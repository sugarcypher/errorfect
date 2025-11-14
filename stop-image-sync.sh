#!/bin/bash

# Stop Image Auto-Sync

PID_FILE="/Users/br14r/Downloads/errorfect/image-sync.pid"

if [ ! -f "$PID_FILE" ]; then
    echo "⚠️  Image sync is not running"
    exit 1
fi

PID=$(cat "$PID_FILE")

if ps -p "$PID" > /dev/null 2>&1; then
    kill "$PID"
    rm "$PID_FILE"
    echo "✅ Image auto-sync stopped"
else
    rm "$PID_FILE"
    echo "⚠️  Process not found (may have already stopped)"
fi

