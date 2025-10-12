# Cropper

[![CI](https://github.com/elharo/cropper/actions/workflows/ci.yml/badge.svg)](https://github.com/elharo/cropper/actions/workflows/ci.yml)

Simple Image Editing Tools - A macOS Skeleton Application

## Overview

Cropper is a skeleton macOS application written in Swift that demonstrates the standard menu structure and application lifecycle patterns used in Mac applications. It includes all the customary menu items that almost all Mac apps share, with menu items properly disabled until functionality is implemented.

## Features

### Menu Structure

The application implements a complete menu bar with the following structure:

#### 🗂 File Menu
- **New** (⌘N) - Create a new image (disabled)
- **Open...** (⌘O) - Open an image file (disabled)
- **Close** (⌘W) - Close current window
- **Save** (⌘S) - Save current image (disabled)
- **Save As...** (⇧⌘S) - Save image with new name (disabled)

#### ✏️ Edit Menu
- **Undo** (⌘Z) - Undo last action (disabled)
- **Redo** (⇧⌘Z) - Redo last undone action (disabled)
- **Cut** (⌘X) - Cut selection (disabled)
- **Copy** (⌘C) - Copy selection (disabled)
- **Paste** (⌘V) - Paste from clipboard (disabled)
- **Delete** - Delete selection (disabled)
- **Select All** (⌘A) - Select all content (disabled)

#### 🪟 Window Menu
- **Minimize** (⌘M) - Minimize window
- **Zoom** - Zoom window

#### ℹ️ Help Menu
- **About Cropper** - Show about dialog
- **Cropper Help** (⌘?) - Show help information

## Project Structure

```
cropper/
├── Package.swift              # Swift Package Manager configuration
├── Sources/                   # Source files
│   ├── CropperApp.swift      # Main entry point
│   ├── AppDelegate.swift     # AppKit application delegate
│   └── ViewController.swift  # Main view controller
├── macOS-AppKit/             # Reference implementation files
│   ├── CropperApp-macOS.swift # Reference: macOS AppKit main entry
│   ├── AppDelegate.swift      # Reference: AppKit application delegate
│   └── ViewController.swift   # Reference: Main view controller
├── Info.plist                # macOS app bundle information
├── Makefile                  # Build automation
├── build.sh                  # Build script
└── README.md                 # This documentation
```

The application is macOS-only and uses AppKit for the GUI. The `macOS-AppKit/` directory contains reference files showing the implementation.

## Building and Running

### Prerequisites

- macOS 11.0 or later
- Swift 5.8 or later
- Xcode Command Line Tools

### Build Methods

#### Option 1: Using Make (Recommended)

```bash
# Build the application bundle
make

# This creates .build/release/Cropper.app which you can:
# - Double-click to launch
# - Move to /Applications for permanent installation

# Build and run immediately
make run

# Install to ~/Applications
make install

# Clean build artifacts
make clean
```

#### Option 2: Using the Build Script

```bash
# Build the application bundle
./build.sh

# This creates .build/release/Cropper.app

# Build and open immediately
./build.sh run
```

#### Option 3: Using Swift Package Manager Directly

```bash
# Build just the executable (not recommended - doesn't create .app)
swift build -c release

# The executable will be at ./.build/release/Cropper
# For a proper Mac app bundle, use Make or build.sh instead
```

### Running the Application

The build process creates a complete macOS application bundle (`.app`) that can be:

1. **Double-clicked from Finder** to launch
2. **Moved to /Applications** for permanent installation
3. **Opened from Terminal**:

```bash
# Using Make
make run

# Using build script
./build.sh run

# Directly
open .build/release/Cropper.app
```

The GUI will display a window with the Cropper interface and functional menu bar.

## Development

### Code Structure

The application follows standard Swift and macOS development patterns:

- **Separation of Concerns**: Core logic separated from UI implementation
- **Standard Conventions**: Follows Apple's coding guidelines and naming conventions
- **Menu Structure**: Implements Apple's Human Interface Guidelines for menus

### Adding New Features

To add functionality to the menu items:

1. Implement the feature in `AppDelegate.swift`
2. Update the menu item's `isEnabled` property to `true`
3. Add appropriate keyboard shortcuts and validation

### Testing the Application

Build and run the application to test menu functionality through the GUI interface.

## Architecture

The application is built as a native macOS application using AppKit:

- **AppKit UI Layer**: Full GUI with AppKit
- **Single Source Tree**: All code in one place

### Standards Compliance

- **Apple Human Interface Guidelines**: Menu structure follows macOS conventions
- **Swift Style Guide**: Code follows Swift community standards
- **macOS App Lifecycle**: Proper application delegate and window management
- **Keyboard Shortcuts**: Standard macOS key combinations

## Troubleshooting

### Common Issues

1. **Missing Xcode Command Line Tools:**
   - Swift Package Manager works without Xcode
   - Install with: `xcode-select --install`

2. **Permission Issues:**
   - Make sure build script is executable: `chmod +x build.sh`
   - Check write permissions for build directory

### Platform-Specific Notes

- **macOS**: This application is macOS-only and requires macOS 11.0 or later
- **Other Platforms**: The application will not build on Linux/Windows as it requires AppKit

## Contributing

This skeleton app provides a foundation for image editing functionality. Key areas for development:

1. **Image Processing**: Add Core Image or similar frameworks
2. **File I/O**: Implement image file reading/writing
3. **Edit Operations**: Add crop, rotate, filter operations
4. **UI Components**: Enhance the interface with image views and tools
5. **Preferences**: Add application settings and preferences

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built following Apple's macOS app development guidelines
- Menu structure based on Apple's Human Interface Guidelines
- Swift Package Manager for dependency management
