#!/bin/bash

# Script to set up the project for macOS GUI development
set -e

echo "🔧 Setting up Cropper for macOS GUI development..."

# Modern Xcode can open Package.swift directly - no need to generate .xcodeproj
echo "📦 Setting up for Xcode..."
echo ""
echo "ℹ️  Modern Xcode (11+) can open Package.swift files directly."
echo "   The 'generate-xcodeproj' command has been removed from Swift Package Manager."
echo ""

# Check if we're on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Check if we can open Xcode
    if command -v xed &> /dev/null; then
        echo "Opening Package.swift in Xcode..."
        xed .
    elif command -v open &> /dev/null; then
        echo "Opening Package.swift in Xcode..."
        open Package.swift
    else
        echo "⚠️  Could not find 'xed' or 'open' command to launch Xcode."
    fi
else
    echo "⚠️  This script is designed for macOS. You appear to be on a different platform."
    echo "   On macOS, you would run: open Package.swift"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 The project is now ready to use!"
echo ""
echo "The application automatically uses the GUI version on macOS and"
echo "simulation mode on other platforms - no manual setup required."
echo ""
echo "Next steps:"
echo "1. Open Package.swift in Xcode (File → Open... → select Package.swift)"
echo "   Or run: open Package.swift"
echo "2. Build and run the project (⌘R)"
echo ""
echo "Or build from command line:"
echo "  swift build && ./.build/debug/Cropper"