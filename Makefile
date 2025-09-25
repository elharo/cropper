SWIFT = swift
APP_NAME = Cropper
BUILD_DIR = .build
RELEASE_DIR = $(BUILD_DIR)/release

.PHONY: all build run clean

all: build

build:
	$(SWIFT) build -c release

run: build
	$(RELEASE_DIR)/$(APP_NAME)

clean:
	$(SWIFT) package clean
	rm -rf $(BUILD_DIR)

install: build
	mkdir -p ~/Applications/$(APP_NAME).app/Contents/MacOS
	mkdir -p ~/Applications/$(APP_NAME).app/Contents/Resources
	cp $(RELEASE_DIR)/$(APP_NAME) ~/Applications/$(APP_NAME).app/Contents/MacOS/
	cp Info.plist ~/Applications/$(APP_NAME).app/Contents/
	@echo "App installed to ~/Applications/$(APP_NAME).app"

.DEFAULT_GOAL := build