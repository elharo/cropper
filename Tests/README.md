# Cropper UI Tests

This directory contains UI tests for the Cropper application using XCUITest framework.

## Overview

The tests verify the macOS GUI functionality of Cropper, including menu interactions and dialog behaviors.

## Test Files

- `CropperUITests/FileOpenMenuTests.swift` - Tests for the File → Open menu functionality

## Running Tests

### Prerequisites

- macOS 13.0 or later
- Xcode Command Line Tools
- Non-headless environment (UI tests require a graphical interface)

### From Command Line

```bash
# Run all UI tests
make test
```

This command will:
1. Generate an Xcode project (if not already present)
2. Build the application bundle
3. Run the UI tests using xcodebuild

### From Xcode

```bash
# Generate Xcode project
swift package generate-xcodeproj

# Open in Xcode
open Cropper.xcodeproj
```

Then:
1. Select the CropperUITests scheme
2. Press Cmd+U to run tests

## Test Structure

### FileOpenMenuTests

Tests the File → Open menu functionality:

- **testFileOpenMenuShowsDialog()**: Verifies that clicking File → Open... displays the standard macOS file open dialog with expected controls (Open and Cancel buttons)

The test:
1. Launches the Cropper app
2. Accesses the menu bar
3. Clicks File → Open...
4. Waits for the open dialog to appear
5. Verifies the dialog contains Open and Cancel buttons
6. Cleans up by canceling the dialog

## CI/CD

UI tests run in GitHub Actions on macOS runners. Note that:
- UI tests require a graphical environment
- GitHub Actions macOS runners provide a GUI environment
- Tests may be skipped in headless environments

## Troubleshooting

### Tests Fail to Launch App

If tests fail with app launch errors:
1. Ensure the app bundle is built: `make app`
2. Verify the bundle exists: `ls -la .build/release/Cropper.app`
3. Check Xcode project was generated: `ls -la Cropper.xcodeproj`

### Tests Timeout

If tests timeout waiting for UI elements:
- The app may not have fully launched
- The menu structure may have changed
- Increase timeout values in the test code

### Headless Environment Errors

UI tests cannot run in headless mode. Ensure you have:
- A macOS environment with GUI support
- Active window server (check with `ps aux | grep WindowServer`)
