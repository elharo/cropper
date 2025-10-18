# Testing Documentation

## XCUITest Setup

This project includes UI tests using Apple's XCUITest framework.

### Running Tests

#### From Terminal

```bash
make test
```

This command:
1. Generates the Xcode project if needed (via `generate_xcode_project.py`)
2. Runs `xcodebuild test` with the Cropper scheme
3. Reports test results

#### Manual Test Execution

If you prefer to run tests manually:

```bash
./run-ui-tests.sh
```

Or directly with xcodebuild:

```bash
xcodebuild test \
    -project Cropper.xcodeproj \
    -scheme Cropper \
    -destination 'platform=macOS'
```

### Test Structure

- **CropperUITests/** - Contains UI test files
  - `CropperUITests.swift` - Main UI test class with XCUITest cases

### Current Tests

- `testSimpleArithmetic` - Verifies basic functionality (1+1=2) within the XCUITest framework

### Adding New Tests

To add new UI tests:

1. Open `CropperUITests/CropperUITests.swift`
2. Add new test methods following the pattern:
   ```swift
   func testMyNewFeature() throws {
       // Test code here
   }
   ```
3. Run `make test` to verify

### Xcode Project

The project uses a generated Xcode project (`Cropper.xcodeproj`) that includes:
- Main application target (`Cropper`)
- UI test target (`CropperUITests`)

If you need to regenerate the project:

```bash
python3 generate_xcode_project.py
```

### CI Integration

Tests are automatically run in CI on every push and pull request. See `.github/workflows/ci.yml` for details.

### Requirements

- macOS 13.0 or later
- Xcode Command Line Tools
- Swift 6.0 or later

### Troubleshooting

**Tests don't run:**
- Ensure you're on macOS (XCUITest requires macOS)
- Verify xcodebuild is installed: `xcodebuild -version`
- Check that the Xcode project exists: `ls Cropper.xcodeproj`

**Project regeneration:**
If the Xcode project becomes corrupted, regenerate it:
```bash
rm -rf Cropper.xcodeproj
python3 generate_xcode_project.py
```
