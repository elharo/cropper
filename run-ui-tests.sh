#!/bin/bash
# Script to run XCUITests on macOS
# This script uses the Xcode project to run UI tests

set -e

echo "Setting up XCUITests for Cropper..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Warning: This script is designed for macOS. Skipping tests on non-macOS systems."
    exit 0
fi

# Check if xcodebuild is available
if ! command -v xcodebuild &> /dev/null; then
    echo "Error: xcodebuild not found. Please install Xcode Command Line Tools."
    exit 1
fi

# Generate Xcode project if it doesn't exist
if [ ! -f "Cropper.xcodeproj/project.pbxproj" ]; then
    echo "Generating Xcode project..."
    python3 generate_xcode_project.py
fi

# Run tests
echo "Running XCUITests..."
xcodebuild test \
    -project Cropper.xcodeproj \
    -scheme Cropper \
    -destination 'platform=macOS' \
    2>&1 | tee /tmp/xcode_test_output.log

# Get exit code
TEST_RESULT=${PIPESTATUS[0]}

if [ $TEST_RESULT -eq 0 ]; then
    echo "✅ All tests passed!"
    exit 0
else
    echo "Test run completed with exit code: $TEST_RESULT"
    # Show relevant parts of the log
    grep -E 'Test|Passed|Failed|error:' /tmp/xcode_test_output.log || true
    exit $TEST_RESULT
fi
