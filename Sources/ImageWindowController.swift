#if os(macOS)
import AppKit

class ImageWindowController: NSWindowController {
    var image: NSImage?
    private var imageView: NSImageView!
    
    init(image: NSImage, filename: String) {
        self.image = image
        
        // Calculate initial window size based on image size and available screen space
        let windowSize = ImageWindowController.calculateWindowSize(for: image)
        
        // Create window
        let window = NSWindow(
            contentRect: NSRect(origin: .zero, size: windowSize),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        
        super.init(window: window)
        
        window.title = filename
        window.center()
        
        // Create and configure image view
        imageView = NSImageView(frame: NSRect(origin: .zero, size: windowSize))
        imageView.image = image
        imageView.imageScaling = .scaleProportionallyUpOrDown
        imageView.autoresizingMask = [.width, .height]
        
        window.contentView = imageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func calculateWindowSize(for image: NSImage) -> NSSize {
        let imageSize = image.size
        
        // Get the main screen's visible frame (excluding menu bar)
        guard let screen = NSScreen.main else {
            return imageSize
        }
        
        let screenVisibleFrame = screen.visibleFrame
        let maxWidth = screenVisibleFrame.width
        let maxHeight = screenVisibleFrame.height
        
        // If image fits within screen, use its actual size
        if imageSize.width <= maxWidth && imageSize.height <= maxHeight {
            return imageSize
        }
        
        // Image is larger than screen - scale it down maintaining aspect ratio
        let widthRatio = maxWidth / imageSize.width
        let heightRatio = maxHeight / imageSize.height
        let scaleFactor = min(widthRatio, heightRatio)
        
        return NSSize(
            width: imageSize.width * scaleFactor,
            height: imageSize.height * scaleFactor
        )
    }
}
#endif
