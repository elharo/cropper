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
├── Sources/                   # Cross-platform Swift source files
│   ├── CropperApp.swift      # Main application entry point
│   └── CropperAppCore.swift  # Core application logic
├── macOS-AppKit/             # macOS-specific AppKit implementation
│   ├── CropperApp-macOS.swift # macOS AppKit main entry
│   ├── AppDelegate.swift      # AppKit application delegate
│   └── ViewController.swift   # Main view controller
├── Info.plist                # macOS app bundle information
├── Makefile                  # Build automation
├── build.sh                  # Build script
└── README.md                 # This documentation
```

## Building and Running

### Prerequisites

- macOS 11.0 or later (for GUI version)
- Swift 5.8 or later
- Xcode Command Line Tools (for macOS)

### Build Methods

#### Option 1: Using Swift Package Manager (Recommended)

```bash
# Build the application
swift build

# Run the application
./.build/debug/Cropper

# Build in release mode
swift build -c release
./.build/release/Cropper
```

#### Option 2: Using Make

```bash
# Build the application
make build

# Build and run
make run

# Clean build artifacts
make clean

# Install to ~/Applications (macOS only)
make install
```

#### Option 3: Using the Build Script

```bash
# Make the build script executable
chmod +x build.sh

# Build the application
./build.sh

# Build and run immediately
./build.sh run
```

### macOS GUI Version

On macOS with AppKit support, you can build the full GUI version:

1. **Using Xcode:**
   - Open the project in Xcode
   - Replace the main source files with those from `macOS-AppKit/`
   - Build and run normally (⌘R)

2. **Command Line with AppKit:**
   ```bash
   # Copy macOS files to Sources directory
   cp macOS-AppKit/* Sources/
   
   # Build and run
   swift build && ./.build/debug/Cropper
   ```

## Development

### Code Structure

The application follows standard Swift and macOS development patterns:

- **Separation of Concerns**: Core logic separated from UI implementation
- **Cross-Platform Compatibility**: Foundation-based core with platform-specific UI
- **Standard Conventions**: Follows Apple's coding guidelines and naming conventions
- **Menu Structure**: Implements Apple's Human Interface Guidelines for menus

### Adding New Features

To add functionality to the menu items:

1. Implement the feature in `CropperAppCore.swift` (for CLI version)
2. Implement the corresponding AppKit version in `AppDelegate.swift`
3. Update the menu item's `isEnabled` property to `true`
4. Add appropriate keyboard shortcuts and validation

### Testing the Application

The application includes a command-line interface for testing menu functionality:

```bash
# Run the app
./build/debug/Cropper

# Try different commands
Cropper> help      # Show all available commands
Cropper> about     # Show about dialog
Cropper> new       # Test File → New (disabled)
Cropper> copy      # Test Edit → Copy (disabled)
Cropper> quit      # Exit application
```

## Architecture

### Cross-Platform Design

The application is designed to work across different environments:

- **Foundation-based Core**: Uses only Foundation framework for maximum compatibility
- **AppKit UI Layer**: Separate macOS-specific GUI implementation
- **Command-Line Interface**: Provides functionality testing without GUI requirements
- **Modular Structure**: Easy to extend with platform-specific implementations

### Standards Compliance

- **Apple Human Interface Guidelines**: Menu structure follows macOS conventions
- **Swift Style Guide**: Code follows Swift community standards
- **macOS App Lifecycle**: Proper application delegate and window management
- **Keyboard Shortcuts**: Standard macOS key combinations

## Troubleshooting

### Common Issues

1. **Build Errors on Non-macOS Systems:**
   - The cross-platform version will work anywhere with Swift
   - AppKit-specific features require macOS

2. **Missing Xcode:**
   - Swift Package Manager works without Xcode
   - GUI features require Xcode or command line tools

3. **Permission Issues:**
   - Make sure build script is executable: `chmod +x build.sh`
   - Check write permissions for build directory

### Platform-Specific Notes

- **macOS**: Full GUI functionality available
- **Linux/Windows**: Command-line simulation mode only
- **iOS**: Would require UIKit adaptation (not included)

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
- Swift Package Manager for cross-platform compatibility
