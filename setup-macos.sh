#!/bin/bash

# Script to set up the project for macOS GUI development
set -e

echo "🔧 Setting up Cropper for macOS GUI development..."

# Create Xcode project
echo "📦 Generating Xcode project..."
swift package generate-xcodeproj

echo "✅ Setup complete!"
echo ""
echo "📝 The project is now ready to use!"
echo ""
echo "The application automatically uses the GUI version on macOS and"
echo "simulation mode on other platforms - no manual setup required."
echo ""
echo "Next steps:"
echo "1. Open Cropper.xcodeproj in Xcode"
echo "2. Build and run the project (⌘R)"
echo ""
echo "Or build from command line:"
echo "  swift build && ./.build/debug/Cropper"