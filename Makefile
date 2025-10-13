SWIFT = swift
APP_NAME = Cropper
BUILD_DIR = .build
RELEASE_DIR = $(BUILD_DIR)/release
APP_BUNDLE = $(RELEASE_DIR)/$(APP_NAME).app
XCODE_PROJECT = $(APP_NAME).xcodeproj

.PHONY: all build run clean install app test generate-xcodeproj

all: app

build:
	$(SWIFT) build -c release

app: build
	@echo "Creating macOS application bundle..."
	@rm -rf $(APP_BUNDLE)
	@mkdir -p $(APP_BUNDLE)/Contents/MacOS
	@mkdir -p $(APP_BUNDLE)/Contents/Resources
	@cp $(RELEASE_DIR)/$(APP_NAME) $(APP_BUNDLE)/Contents/MacOS/
	@cp Info.plist $(APP_BUNDLE)/Contents/
	@echo "Application bundle created: $(APP_BUNDLE)"
	@echo ""
	@echo "You can now:"
	@echo "  - Open the app: open $(APP_BUNDLE)"
	@echo "  - Move it to Applications: cp -r $(APP_BUNDLE) /Applications/"

run: app
	open $(APP_BUNDLE)

generate-xcodeproj:
	@if [ ! -d "$(XCODE_PROJECT)" ]; then \
		echo "Generating Xcode project..."; \
		$(SWIFT) package generate-xcodeproj; \
	fi

test: generate-xcodeproj app
	@echo "Running UI tests (requires non-headless macOS environment)..."
	@echo "Building and testing with xcodebuild..."
	@xcodebuild test \
		-project $(XCODE_PROJECT) \
		-scheme Cropper-Package \
		-destination 'platform=macOS' \
		-only-testing:CropperUITests

clean:
	$(SWIFT) package clean
	rm -rf $(BUILD_DIR)
	rm -rf $(XCODE_PROJECT)

install: app
	cp -r $(APP_BUNDLE) ~/Applications/
	@echo "App installed to ~/Applications/$(APP_NAME).app"

.DEFAULT_GOAL := app