# Copilot Instructions for Cropper

## Project Overview

Cropper is a simple image editing tools project focused on Swift development. This repository provides utilities for basic image manipulation and cropping functionality.

## Development Guidelines

### Code Style and Standards

- Follow Swift naming conventions and coding standards
- Use meaningful variable and function names that clearly describe their purpose
- Prefer explicit code over clever code for maintainability
- Write self-documenting code with clear logic flow

### Architecture Patterns

- Use appropriate Swift design patterns (MVC, MVVM, etc.)
- Implement proper separation of concerns
- Keep image processing logic separate from UI components
- Use dependency injection where appropriate

### Image Processing Best Practices

- Always handle image memory management carefully to prevent memory issues
- Validate image inputs and handle edge cases gracefully
- Implement error handling for image operations that may fail
- Consider performance implications of image processing operations
- Use appropriate image formats and compression settings

### Testing Approach

- Write unit tests for core image processing functions
- Test edge cases like empty images, invalid formats, or extreme dimensions
- Mock external dependencies in tests
- Ensure tests are fast and reliable
- Use XCUITest to test the GUI

### Documentation Requirements

- Document public APIs with clear descriptions and parameter explanations
- Include usage examples for complex functions
- Document any performance considerations or limitations
- Keep README updated with current functionality

### Security Considerations

- Validate all image inputs to prevent malicious file processing
- Handle file I/O operations safely
- Be cautious with user-provided image data
- Don't expose sensitive system information in error messages

### Performance Guidelines

- Use appropriate data structures for image manipulation
- Implement lazy loading where beneficial

### Build Guidelines

- Code is typically built and run from the terminal.
- Code can be edited, built, and run from the command line.
- Xcode might be used to work on this project but is never required. 

## Specific to This Project

- Focus on simplicity and ease of use
- Prioritize core cropping functionality over advanced features
- Ensure compatibility with common image formats (JPEG, PNG, etc.)
- Design APIs that are intuitive for other developers to use
- This is only for Mac OS X. It only runs and builds on Mac OS X. It should not have any code or features meant for other platforms like Linux ir iOS.
- It is a GUI application, not a command line application. It can build at the command line but it only launches in a GUI.
- Use Swift 6.2.
