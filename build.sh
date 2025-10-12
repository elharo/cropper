#!/bin/bash

# Build script for Cropper macOS app
set -e

APP_NAME="Cropper"
BUILD_MODE="release"
BUILD_DIR=".build/$BUILD_MODE"
APP_BUNDLE="$BUILD_DIR/$APP_NAME.app"

echo "Building $APP_NAME..."

# Clean previous builds
swift package clean

# Build the project
echo "Compiling Swift code..."
swift build -c $BUILD_MODE

# Create .app bundle structure
echo "Creating macOS application bundle..."
rm -rf "$APP_BUNDLE"
mkdir -p "$APP_BUNDLE/Contents/MacOS"
mkdir -p "$APP_BUNDLE/Contents/Resources"

# Copy executable
cp "$BUILD_DIR/$APP_NAME" "$APP_BUNDLE/Contents/MacOS/"

# Copy Info.plist
cp Info.plist "$APP_BUNDLE/Contents/"

echo "Build completed successfully!"
echo "Application bundle: $APP_BUNDLE"
echo ""
echo "You can now:"
echo "  - Open the app: open $APP_BUNDLE"
echo "  - Move it to Applications: cp -r $APP_BUNDLE /Applications/"

# Optional: Run the app if requested
if [ "$1" == "run" ]; then
    echo ""
    echo "Running $APP_NAME..."
    open "$APP_BUNDLE"
fi