import AppKit

class ViewController: NSViewController {
    
    override func loadView() {
        let contentView = NSView(frame: NSRect(x: 0, y: 0, width: 600, height: 400))
        contentView.wantsLayer = true
        contentView.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        
        // Create the main content
        setupUI(in: contentView)
        
        self.view = contentView
    }
    
    private func setupUI(in containerView: NSView) {
        // App icon (using system image)
        let iconImageView = NSImageView()
        if let cropImage = NSImage(systemSymbolName: "crop.rotate", accessibilityDescription: "Crop") {
            iconImageView.image = cropImage
            iconImageView.imageScaling = .scaleProportionallyUpOrDown
            iconImageView.contentTintColor = .systemBlue
        }
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(iconImageView)
        
        // App title
        let titleLabel = NSTextField(labelWithString: "Cropper")
        titleLabel.font = NSFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.alignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        // App subtitle
        let subtitleLabel = NSTextField(labelWithString: "Simple Image Editing Tools")
        subtitleLabel.font = NSFont.systemFont(ofSize: 18, weight: .medium)
        subtitleLabel.textColor = .secondaryLabelColor
        subtitleLabel.alignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subtitleLabel)
        
        // Instructions
        let instructionsLabel = NSTextField(labelWithString: "Use the menu bar to get started")
        instructionsLabel.font = NSFont.systemFont(ofSize: 14)
        instructionsLabel.textColor = .tertiaryLabelColor
        instructionsLabel.alignment = .center
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(instructionsLabel)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            // Icon
            iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -60),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Title
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -20),
            
            // Subtitle
            subtitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -20),
            
            // Instructions
            instructionsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            instructionsLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            instructionsLabel.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 20),
            instructionsLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -20),
        ])
    }
}