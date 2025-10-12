#if os(macOS)
import AppKit

class ViewController: NSViewController {
    private var splashView: NSView?
    
    override func loadView() {
        let contentView = NSView(frame: NSRect(x: 0, y: 0, width: 600, height: 400))
        contentView.wantsLayer = true
        contentView.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        
        // Create the main content
        setupUI(in: contentView)
        
        self.view = contentView
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        // Hide splash screen after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.hideSplashScreen()
        }
    }
    
    private func setupUI(in containerView: NSView) {
        // Create a container view for the splash screen
        let splashContainer = NSView(frame: containerView.bounds)
        splashContainer.autoresizingMask = [.width, .height]
        containerView.addSubview(splashContainer)
        self.splashView = splashContainer
        
        // App icon (using system image)
        let iconImageView = NSImageView()
        if let cropImage = NSImage(systemSymbolName: "crop.rotate", accessibilityDescription: "Crop") {
            iconImageView.image = cropImage
            iconImageView.imageScaling = .scaleProportionallyUpOrDown
            iconImageView.contentTintColor = .systemBlue
        }
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        splashContainer.addSubview(iconImageView)
        
        // App title
        let titleLabel = NSTextField(labelWithString: "Cropper")
        titleLabel.font = NSFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.alignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        splashContainer.addSubview(titleLabel)
        
        // App subtitle
        let subtitleLabel = NSTextField(labelWithString: "Simple Image Editing Tools")
        subtitleLabel.font = NSFont.systemFont(ofSize: 18, weight: .medium)
        subtitleLabel.textColor = .secondaryLabelColor
        subtitleLabel.alignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        splashContainer.addSubview(subtitleLabel)
        
        // Instructions
        let instructionsLabel = NSTextField(labelWithString: "Use the menu bar to get started")
        instructionsLabel.font = NSFont.systemFont(ofSize: 14)
        instructionsLabel.textColor = .tertiaryLabelColor
        instructionsLabel.alignment = .center
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        splashContainer.addSubview(instructionsLabel)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            // Icon
            iconImageView.centerXAnchor.constraint(equalTo: splashContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: splashContainer.centerYAnchor, constant: -60),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Title
            titleLabel.centerXAnchor.constraint(equalTo: splashContainer.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: splashContainer.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: splashContainer.trailingAnchor, constant: -20),
            
            // Subtitle
            subtitleLabel.centerXAnchor.constraint(equalTo: splashContainer.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: splashContainer.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: splashContainer.trailingAnchor, constant: -20),
            
            // Instructions
            instructionsLabel.centerXAnchor.constraint(equalTo: splashContainer.centerXAnchor),
            instructionsLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            instructionsLabel.leadingAnchor.constraint(greaterThanOrEqualTo: splashContainer.leadingAnchor, constant: 20),
            instructionsLabel.trailingAnchor.constraint(lessThanOrEqualTo: splashContainer.trailingAnchor, constant: -20),
        ])
    }
    
    private func hideSplashScreen() {
        guard let splash = splashView else { return }
        
        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.5
            splash.animator().alphaValue = 0.0
        } completionHandler: {
            splash.removeFromSuperview()
        }
    }
}
#endif