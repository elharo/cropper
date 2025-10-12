#if os(macOS)
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var contentViewController: ViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the main window
        let windowRect = NSMakeRect(100, 100, 600, 400)
        window = NSWindow(contentRect: windowRect,
                         styleMask: [.titled, .closable, .miniaturizable, .resizable],
                         backing: .buffered,
                         defer: false)
        
        window.title = "Cropper"
        window.center()
        
        // Create and set the content view controller
        contentViewController = ViewController()
        window.contentViewController = contentViewController
        
        // Set up the menu bar
        setupMenuBar()
        
        // Show the window
        window.makeKeyAndOrderFront(nil)
        
        // Bring app to front
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }
    
    private func setupMenuBar() {
        let mainMenu = NSMenu()
        
        // App Menu (Cropper)
        let appMenuItem = NSMenuItem()
        mainMenu.addItem(appMenuItem)
        let appMenu = NSMenu()
        appMenuItem.submenu = appMenu
        
        appMenu.addItem(withTitle: "About Cropper", action: #selector(showAbout), keyEquivalent: "")
        appMenu.addItem(NSMenuItem.separator())
        appMenu.addItem(withTitle: "Quit Cropper", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        
        // File Menu
        let fileMenuItem = NSMenuItem(title: "File", action: nil, keyEquivalent: "")
        mainMenu.addItem(fileMenuItem)
        let fileMenu = NSMenu(title: "File")
        fileMenuItem.submenu = fileMenu
        
        let newItem = fileMenu.addItem(withTitle: "New", action: #selector(newFile), keyEquivalent: "n")
        newItem.isEnabled = false
        fileMenu.addItem(NSMenuItem.separator())
        let openItem = fileMenu.addItem(withTitle: "Open...", action: #selector(openFile), keyEquivalent: "o")
        openItem.isEnabled = false
        fileMenu.addItem(NSMenuItem.separator())
        fileMenu.addItem(withTitle: "Close", action: #selector(closeWindow), keyEquivalent: "w")
        fileMenu.addItem(NSMenuItem.separator())
        let saveItem = fileMenu.addItem(withTitle: "Save", action: #selector(saveFile), keyEquivalent: "s")
        saveItem.isEnabled = false
        let saveAsItem = fileMenu.addItem(withTitle: "Save As...", action: #selector(saveAsFile), keyEquivalent: "S")
        saveAsItem.isEnabled = false
        
        // Edit Menu
        let editMenuItem = NSMenuItem(title: "Edit", action: nil, keyEquivalent: "")
        mainMenu.addItem(editMenuItem)
        let editMenu = NSMenu(title: "Edit")
        editMenuItem.submenu = editMenu
        
        let undoItem = editMenu.addItem(withTitle: "Undo", action: #selector(undo), keyEquivalent: "z")
        undoItem.isEnabled = false
        let redoItem = editMenu.addItem(withTitle: "Redo", action: #selector(redo), keyEquivalent: "Z")
        redoItem.isEnabled = false
        editMenu.addItem(NSMenuItem.separator())
        let cutItem = editMenu.addItem(withTitle: "Cut", action: #selector(cut), keyEquivalent: "x")
        cutItem.isEnabled = false
        let copyItem = editMenu.addItem(withTitle: "Copy", action: #selector(performCopy), keyEquivalent: "c")
        copyItem.isEnabled = false
        let pasteItem = editMenu.addItem(withTitle: "Paste", action: #selector(paste), keyEquivalent: "v")
        pasteItem.isEnabled = false
        let deleteItem = editMenu.addItem(withTitle: "Delete", action: #selector(delete), keyEquivalent: "")
        deleteItem.isEnabled = false
        editMenu.addItem(NSMenuItem.separator())
        let selectAllItem = editMenu.addItem(withTitle: "Select All", action: #selector(selectAll), keyEquivalent: "a")
        selectAllItem.isEnabled = false
        
        // Window Menu
        let windowMenuItem = NSMenuItem(title: "Window", action: nil, keyEquivalent: "")
        mainMenu.addItem(windowMenuItem)
        let windowMenu = NSMenu(title: "Window")
        windowMenuItem.submenu = windowMenu
        
        windowMenu.addItem(withTitle: "Minimize", action: #selector(NSWindow.miniaturize(_:)), keyEquivalent: "m")
        windowMenu.addItem(withTitle: "Zoom", action: #selector(NSWindow.zoom(_:)), keyEquivalent: "")
        
        // Help Menu
        let helpMenuItem = NSMenuItem(title: "Help", action: nil, keyEquivalent: "")
        mainMenu.addItem(helpMenuItem)
        let helpMenu = NSMenu(title: "Help")
        helpMenuItem.submenu = helpMenu
        
        helpMenu.addItem(withTitle: "Cropper Help", action: #selector(showHelp), keyEquivalent: "?")
        
        NSApp.mainMenu = mainMenu
    }
    
    // MARK: - Menu Actions
    
    @objc func showAbout() {
        let alert = NSAlert()
        alert.messageText = "Cropper"
        alert.informativeText = "Simple Image Editing Tools\n\nVersion 1.0\n\nCopyright © 2025 Elliotte Rusty Harold"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    @objc func newFile() {
        // TODO: Implement new file functionality
    }
    
    @objc func openFile() {
        // TODO: Implement open file functionality
    }
    
    @objc func closeWindow() {
        window.performClose(nil)
    }
    
    @objc func saveFile() {
        // TODO: Implement save file functionality
    }
    
    @objc func saveAsFile() {
        // TODO: Implement save as file functionality
    }
    
    @objc func undo() {
        // TODO: Implement undo functionality
    }
    
    @objc func redo() {
        // TODO: Implement redo functionality
    }
    
    @objc func cut() {
        // TODO: Implement cut functionality
    }
    
    @objc func performCopy() {
        // TODO: Implement copy functionality
    }
    
    @objc func paste() {
        // TODO: Implement paste functionality
    }
    
    @objc func delete() {
        // TODO: Implement delete functionality
    }
    
    @objc func selectAll() {
        // TODO: Implement select all functionality
    }
    
    @objc func showHelp() {
        let alert = NSAlert()
        alert.messageText = "Cropper Help"
        alert.informativeText = "Cropper is a simple image editing tool.\n\nUse the File menu to open and save images.\nUse the Edit menu to modify your images."
        alert.alertStyle = .informational
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}
#endif