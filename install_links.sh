#!/bin/bash

# Set the source and target directories
SOURCE_DIR="/home/ln1/Projects/oh-my-rime"
TARGET_DIR="$HOME/.local/share/fcitx5/rime"

# Create the target directory if it doesn't exist
echo "Ensuring target directory exists: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Change to the source directory for easier linking
cd "$SOURCE_DIR" || {
  echo "Failed to change to source directory"
  exit 1
}

# Create symbolic links for specified items
echo "Creating symbolic links in $TARGET_DIR"
for item in *.yaml rime.lua dicts lua opencc; do
  if [ -e "$item" ] || [ -L "$item" ]; then
    # Use -f to force overwrite existing links if the script is run again
    ln -sf "$SOURCE_DIR/$item" "$TARGET_DIR/"
    echo "  -> Linked $item"
  else
    echo "  -> Skipping $item (not found)"
  fi
done

echo "Symbolic linking complete."
