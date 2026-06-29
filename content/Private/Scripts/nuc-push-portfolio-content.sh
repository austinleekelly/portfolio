#!/bin/bash

# Define source and destination paths
SOURCE_DIR="/home/akelly/Documents/writing/Austin Work Portfolio/"
DEST_DIR="/home/akelly/Documents/quartz-portfolio/portfolio/content/"
QUARTZ_DIR="/home/akelly/Documents/quartz-portfolio/portfolio"

echo "🔄 Starting one-way sync from Writing Vault to Quartz Content..."

# Run rsync
# -a: archive mode (preserves times, permissions, etc.)
# -v: verbose output
# --delete: deletes files in destination if they were deleted in source
# --exclude: keeps obsidian system files out of your web build
rsync -av --delete \
  --exclude=".obsidian/" \
  --exclude=".trash/" \
  "$SOURCE_DIR" "$DEST_DIR"

echo "✅ Sync complete!"
echo "🚀 Triggering local Quartz rebuild..."

# Move to the quartz directory and run a one-time build
cd "$QUARTZ_DIR" || exit
npx quartz build

echo "✨ All done! Your updated content is ready."