#!/usr/bin/env bash
set -e

APP_NAME="UtilDraw"
REPO="gabex47/UtilDraw"
INSTALL_DIR="/Applications"
TMP_DIR="/tmp/$APP_NAME"

echo "Installing $APP_NAME..."

mkdir -p "$TMP_DIR"

echo "Downloading..."
curl -L -o "$TMP_DIR/$APP_NAME.zip" \
"https://github.com/$REPO/releases/latest/download/$APP_NAME.zip"

echo "Unzipping..."
unzip -o "$TMP_DIR/$APP_NAME.zip" -d "$TMP_DIR"

echo "Removing macOS quarantine..."
xattr -dr com.apple.quarantine "$TMP_DIR/$APP_NAME.app" || true

echo "Closing old UtilDraw (if open)..."
pkill -x "UtilDraw" || true

echo "Installing..."
rm -rf "$INSTALL_DIR/$APP_NAME.app"
mv "$TMP_DIR/$APP_NAME.app" "$INSTALL_DIR/"

echo "Cleaning..."
rm -rf "$TMP_DIR"

echo "UtilDraw installed/updated successfully 🚀"
open "$INSTALL_DIR/$APP_NAME.app"


