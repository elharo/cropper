#if os(macOS)
import AppKit

@main
struct CropperApp {
    static func main() {
        let app = NSApplication.shared
        let delegate = AppDelegate()
        app.delegate = delegate
        app.run()
    }
}
#else
import Foundation

@main
struct CropperApp {
    static func main() {
        print("🍎 Cropper - Simple Image Editing Tools")
        print("=========================================")
        print("")
        print("This is a macOS application skeleton.")
        print("On macOS, this would launch a full GUI application with:")
        print("")
        print("📋 Menu Structure:")
        print("  • File Menu: New, Open, Close, Save, Save As")
        print("  • Edit Menu: Undo, Redo, Cut, Copy, Paste, Delete, Select All")
        print("  • Window Menu: Minimize, Zoom")
        print("  • Help Menu: Cropper Help")
        print("")
        print("🚀 To build and run on macOS:")
        print("  1. Open this project in Xcode")
        print("  2. Or use: swift build && ./.build/debug/Cropper")
        print("  3. Or use: make build && make run")
        print("")
        print("Note: Currently running in simulation mode.")
        print("The actual GUI will only work on macOS with AppKit support.")
        
        // Simulate some basic app functionality
        let app = CropperAppCore()
        app.run()
    }
}
#endif