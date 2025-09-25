// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "Cropper",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
    ],
    products: [
        .executable(name: "Cropper", targets: ["Cropper"])
    ],
    targets: [
        .executableTarget(
            name: "Cropper",
            dependencies: [],
            path: "Sources"
        )
    ]
)