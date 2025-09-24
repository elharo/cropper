#!/bin/bash

# Build script for Cropper macOS app
set -e

APP_NAME="Cropper"
BUILD_MODE="release"

echo "Building $APP_NAME..."

# Clean previous builds
swift package clean

# Build the project
echo "Compiling Swift code..."
swift build -c $BUILD_MODE

echo "Build completed successfully!"
echo "Executable location: .build/$BUILD_MODE/$APP_NAME"

# Optional: Run the app if requested
if [ "$1" == "run" ]; then
    echo "Running $APP_NAME..."
    .build/$BUILD_MODE/$APP_NAME
fi