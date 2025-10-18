#!/bin/bash
# Script to run XCUITests on macOS
# This script generates an Xcode project and runs UI tests

set -e

echo "Setting up XCUITests for Cropper..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Warning: This script is designed for macOS. Xcode tools may not be available."
    exit 0
fi

# Check if xcodebuild is available
if ! command -v xcodebuild &> /dev/null; then
    echo "Error: xcodebuild not found. Please install Xcode Command Line Tools."
    exit 1
fi

# Generate Xcode project from Package.swift if it doesn't exist
if [ ! -d "Cropper.xcodeproj" ]; then
    echo "Generating Xcode project..."
    swift package generate-xcodeproj 2>/dev/null || {
        echo "Note: generate-xcodeproj is deprecated. Opening Package.swift in Xcode instead..."
        # For modern Swift, we work with Package.swift directly
    }
fi

# Run tests
echo "Running XCUITests..."
xcodebuild test \
    -scheme Cropper-Package \
    -destination 'platform=macOS' \
    2>&1 | grep -E 'Test|Passed|Failed|error:|Testing|BUILD|FAIL' || true

# Get exit code
TEST_RESULT=${PIPESTATUS[0]}

if [ $TEST_RESULT -eq 0 ]; then
    echo "✅ All tests passed!"
    exit 0
else
    echo "ℹ️  Test run completed with code: $TEST_RESULT"
    exit $TEST_RESULT
fi
