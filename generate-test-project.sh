#!/bin/bash

# Generate Xcode project with UI testing configuration
set -e

echo "🔧 Generating Xcode project for testing..."

# Generate the base Xcode project
swift package generate-xcodeproj

PROJECT="Cropper.xcodeproj"

if [ ! -d "$PROJECT" ]; then
    echo "❌ Failed to generate Xcode project"
    exit 1
fi

echo "✅ Xcode project generated: $PROJECT"
echo ""
echo "📝 To run UI tests:"
echo "  1. Open $PROJECT in Xcode"
echo "  2. Select the CropperUITests scheme"
echo "  3. Press Cmd+U to run tests"
echo ""
echo "Or from command line:"
echo "  make test"

