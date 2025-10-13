import XCTest

/// UI tests for the File → Open menu functionality.
/// These tests verify that the File menu's Open command correctly displays
/// the standard macOS file open dialog with expected controls.
///
/// Note: These tests require a graphical environment and cannot run in headless mode.
final class FileOpenMenuTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // Initialize the application
        // For SPM projects, XCUIApplication() will use the app bundle built by the test
        app = XCUIApplication()
        
        // Set launch arguments if needed for testing
        app.launchArguments = []
        
        // Launch the app
        app.launch()
        
        // Wait for the app to fully launch and become active
        let launched = app.wait(for: .runningForeground, timeout: 10)
        XCTAssertTrue(launched, "App should launch and be in foreground")
        
        // Give the app a moment to fully initialize its menu bar
        Thread.sleep(forTimeInterval: 1.0)
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
        
        // Give the menu a moment to open
        Thread.sleep(forTimeInterval: 0.5)
        
        // Find and verify the "Open..." menu item
        // Try MainMenu approach first
        var openMenuItem = app.menus["MainMenu"].menuItems["Open..."]
        
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

