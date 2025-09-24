#!/bin/bash

# Script to set up the project for macOS GUI development
set -e

echo "🔧 Setting up Cropper for macOS GUI development..."

# Create Xcode project
echo "📦 Generating Xcode project..."
swift package generate-xcodeproj

# Copy macOS-specific files to Sources for GUI version
echo "📁 Setting up macOS AppKit files..."
cp macOS-AppKit/CropperApp-macOS.swift Sources/CropperApp-macOS.swift
cp macOS-AppKit/AppDelegate.swift Sources/AppDelegate-macOS.swift  
cp macOS-AppKit/ViewController.swift Sources/ViewController-macOS.swift

echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Open Cropper.xcodeproj in Xcode"
echo "2. Replace CropperApp.swift with CropperApp-macOS.swift as the main entry point"
echo "3. Build and run the project (⌘R)"
echo ""
echo "Or build from command line:"
echo "swift build && ./.build/debug/Cropper"