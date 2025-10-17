import XCTest

/// UI tests for the File → Open menu functionality.
/// These tests verify that the File menu's Open command correctly displays
/// the standard macOS file open dialog with expected controls.
final class FileOpenMenuTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        
        // Initialize and launch the application
        app = XCUIApplication()
        app.launch()
        
        // Wait for app to be ready
        _ = app.wait(for: .runningForeground, timeout: 10)
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
        // Access the menu bar via app.menus["MainMenu"].menuItems["File"] as specified
        let mainMenu = app.menus["MainMenu"]
        let fileMenuItem = mainMenu.menuItems["File"]
        
        // Wait for File menu to exist and click it
        XCTAssertTrue(fileMenuItem.waitForExistence(timeout: 5), "File menu should exist")
        fileMenuItem.click()
        
        // Find and click Open... menu item
        let openMenuItem = mainMenu.menuItems["Open..."]
        XCTAssertTrue(openMenuItem.waitForExistence(timeout: 3), "Open... menu item should exist")
        XCTAssertTrue(openMenuItem.isEnabled, "Open... menu item should be enabled")
        openMenuItem.click()
        
        // Wait for the Open dialog/sheet to appear
        let openDialog = app.sheets.firstMatch
        let dialogAppeared = openDialog.waitForExistence(timeout: 5)
        
        // If not a sheet, try as a dialog window
        if !dialogAppeared {
            let dialogWindow = app.dialogs.firstMatch
            XCTAssertTrue(dialogWindow.waitForExistence(timeout: 2), "Open dialog should appear")
            verifyDialogControls(dialogWindow)
        } else {
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

