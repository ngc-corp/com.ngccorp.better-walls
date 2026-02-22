#!/usr/bin/env bash

set -e

# ---- Configuration ----
MOD_NAME="NGC_Corp_Better_Walls"
VERSION=$(grep '"Version"' manifest.json | sed -E 's/.*"Version": *"([^"]+)".*/\1/')
OUTPUT_DIR="dist"
ZIP_NAME="${MOD_NAME}-${VERSION}.zip"

# ---- Create dist folder ----
mkdir -p "$OUTPUT_DIR"

echo "Building $ZIP_NAME..."

# ---- Create zip ----
zip -r "$OUTPUT_DIR/$ZIP_NAME" . \
  -x "Assets/*" \
  -x "*.bbmodel" \
  -x ".editorconfig" \
  -x "LICENSE" \
  -x "README.md" \
  -x ".git/*" \
  -x "dist/*" \
  -x "build.sh"

echo "Build complete: $OUTPUT_DIR/$ZIP_NAME"
