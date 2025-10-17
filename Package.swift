// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Cropper",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "Cropper", targets: ["Cropper"])
    ],
    targets: [
        .executableTarget(
            name: "Cropper",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "CropperUITests",
            dependencies: [],
            path: "Tests/CropperUITests"
        )
    ]
)