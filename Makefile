SWIFT = swift
APP_NAME = Cropper
BUILD_DIR = .build
RELEASE_DIR = $(BUILD_DIR)/release
APP_BUNDLE = $(RELEASE_DIR)/$(APP_NAME).app

.PHONY: all build run clean install app test

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

test:
	@echo "Running XCUITests..."
	@./run-ui-tests.sh

clean:
	$(SWIFT) package clean
	rm -rf $(BUILD_DIR)

install: app
	cp -r $(APP_BUNDLE) ~/Applications/
	@echo "App installed to ~/Applications/$(APP_NAME).app"

.DEFAULT_GOAL := app