#!/bin/bash

# Open the Swift Package in Xcode for testing
set -e

echo "🔧 Opening Swift Package in Xcode..."

PACKAGE="Package.swift"

if [ ! -f "$PACKAGE" ]; then
    echo "❌ Package.swift not found"
    exit 1
fi

# Open the package in Xcode
open "$PACKAGE"

echo "✅ Package opened in Xcode"
echo ""
echo "📝 To run UI tests in Xcode:"
echo "  1. Wait for Xcode to open the package"
echo "  2. Select the CropperUITests scheme"
echo "  3. Press Cmd+U to run tests"
echo ""
echo "Or from command line:"
echo "  make test"

