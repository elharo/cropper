import XCTest
import AppKit

/// UI tests for the File → Open menu functionality.
/// These tests verify that the File menu's Open command correctly displays
/// the standard macOS file open dialog with expected controls.
///
/// Note: These tests require a graphical environment and cannot run in headless mode.
final class FileOpenMenuTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // For SPM executable targets, we need to find and launch the app bundle
        // Try to find the app bundle in common locations
        let possiblePaths = [
            ".build/release/Cropper.app",
            "../.build/release/Cropper.app",
            "../../.build/release/Cropper.app",
            "../../../.build/release/Cropper.app",
            "../../../../.build/release/Cropper.app",
        ]
        
        print("Current directory: \(FileManager.default.currentDirectoryPath)")
        
        var appBundleURL: URL?
        for path in possiblePaths {
            let url = URL(fileURLWithPath: path, relativeTo: URL(fileURLWithPath: FileManager.default.currentDirectoryPath))
            let absoluteURL = url.standardizedFileURL
            print("Checking path: \(absoluteURL.path)")
            if FileManager.default.fileExists(atPath: absoluteURL.path) {
                appBundleURL = absoluteURL
                print("✅ Found app bundle at: \(absoluteURL.path)")
                break
            }
        }
        
        if let bundleURL = appBundleURL {
            // Use XCUIApplication with the URL directly
            app = XCUIApplication(url: bundleURL)
            print("Initialized XCUIApplication with URL: \(bundleURL.path)")
        } else {
            // Fall back to default XCUIApplication behavior
            print("⚠️ Could not find app bundle, using default XCUIApplication()")
            app = XCUIApplication()
        }
        
        // Launch the app
        print("Launching app...")
        app.launch()
        
        print("App state after launch: \(app.state.rawValue)")
        print("App exists: \(app.exists)")
        
        // Wait for the app to be in foreground
        let launched = app.wait(for: .runningForeground, timeout: 10)
        print("App in foreground: \(launched)")
        
        if !launched {
            print("❌ App failed to reach foreground state")
            print("Current app state: \(app.state.rawValue)")
        }
        
        XCTAssertTrue(launched, "App should launch and be in foreground")
        
        // Give the app a moment to fully initialize its menu bar
        Thread.sleep(forTimeInterval: 1.0)
        
        // Wait for the File menu to exist, indicating the menu bar is initialized
        print("Waiting for File menu...")
        let fileMenu = app.menuBars.menuBarItems["File"]
        let menuReady = fileMenu.waitForExistence(timeout: 5)
        print("File menu ready: \(menuReady)")
        
        if !menuReady {
            print("❌ File menu not found")
            print("Available menu bar items:")
            for item in app.menuBars.menuBarItems.allElementsBoundByIndex {
                print("  - \(item.title)")
            }
        }
        
        XCTAssertTrue(menuReady, "File menu should exist after app launch")
    }
    
    override func tearDownWithError() throws {
        // Terminate the app
        if app != nil {
            app.terminate()
            app = nil
        }
    }
    
    /// Test that the File → Open menu item shows the standard file dialog
    /// with expected controls (Open and Cancel buttons).
    func testFileOpenMenuShowsDialog() throws {
        // Access the menu bar via app.menuBars (standard approach for macOS)
        let menuBar = app.menuBars
        
        // Try accessing via MainMenu first (as specified in requirements)
        var fileMenuItem = app.menus["MainMenu"].menuItems["File"]
        
        // If MainMenu approach doesn't work, use the standard menuBarItems approach
        if !fileMenuItem.exists {
            fileMenuItem = menuBar.menuBarItems["File"]
        }
        
        XCTAssertTrue(fileMenuItem.exists, "File menu item should exist")
        
        // Click on File menu to open it
        fileMenuItem.click()
        
        // Wait for the "Open..." menu item to appear after opening the File menu
        // Try MainMenu approach first
        var openMenuItem = app.menus["MainMenu"].menuItems["Open..."]
        // Fall back to menuBar approach if needed
        if !openMenuItem.waitForExistence(timeout: 2) {
            openMenuItem = menuBar.menuItems["Open..."]
            // Wait for existence again in case menuBar is needed
            let exists = openMenuItem.waitForExistence(timeout: 2)
            XCTAssertTrue(exists, "Open... menu item should exist in File menu after opening File menu")
        }
        
        // Fall back to menuBar approach if needed
        if !openMenuItem.exists {
            openMenuItem = menuBar.menuItems["Open..."]
        }
        
        XCTAssertTrue(openMenuItem.exists, "Open... menu item should exist in File menu")
        XCTAssertTrue(openMenuItem.isEnabled, "Open... menu item should be enabled")
        
        // Click the Open... menu item
        openMenuItem.click()
        
        // Wait for the Open dialog to appear
        // NSOpenPanel appears as a sheet or window in the accessibility hierarchy
        // Try multiple selectors as the dialog can appear in different forms
        let openDialog = app.sheets.firstMatch
        var dialogAppeared = openDialog.waitForExistence(timeout: 5)
        
        // If not found as sheet, try as dialog
        if !dialogAppeared {
            let openDialogWindow = app.dialogs.firstMatch
            dialogAppeared = openDialogWindow.waitForExistence(timeout: 2)
            XCTAssertTrue(dialogAppeared, "Open dialog should appear as sheet or dialog")
            
            // Use the window for further verification
            verifyDialogControls(openDialogWindow)
        } else {
            // Use the sheet for verification
            verifyDialogControls(openDialog)
        }
    }
    
    /// Helper method to verify the dialog has expected controls and clean up
    private func verifyDialogControls(_ dialog: XCUIElement) {
        // Verify the dialog contains expected controls
        
        // Check for Cancel button
        let cancelButton = dialog.buttons["Cancel"]
        XCTAssertTrue(cancelButton.exists, "Cancel button should exist in open dialog")
        
        // Check for Open button (may be disabled if no file is selected)
        let openButton = dialog.buttons["Open"]
        XCTAssertTrue(openButton.exists, "Open button should exist in open dialog")
        
        // Clean up by canceling the dialog
        cancelButton.click()
        
        // Wait for dialog to disappear
        let dialogDismissed = !dialog.waitForExistence(timeout: 3)
        XCTAssertTrue(dialogDismissed, "Open dialog should be dismissed after clicking Cancel")
    }
}

