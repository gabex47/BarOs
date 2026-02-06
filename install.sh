#!/bin/bash

set -e

APP_NAME="UtilDraw"
TMP_DIR="/tmp/$APP_NAME"
ZIP_URL="https://github.com/gabex47/UtilDraw/releases/latest/download/UtilDraw.zip"

echo "Installing $APP_NAME..."
echo "Downloading..."

rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

curl -L "$ZIP_URL" -o "$TMP_DIR/$APP_NAME.zip"

echo "Unzipping..."
unzip -q "$TMP_DIR/$APP_NAME.zip" -d "$TMP_DIR"

echo "Installing to /Applications..."
TMP_DIR=" /tmp/UtilDraw"
cp -R "$TMP_DIR/UtilDraw.app"  /Applications/

echo "Cleaning..."
rm -rf "$TMP_DIR"

echo "Done! Launching $APP_NAME 🚀"
open "/Applications/$APP_NAME.app"
