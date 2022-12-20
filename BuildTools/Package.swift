// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.1"),
        .package(url: "https://github.com/realm/SwiftLint", from: "0.45.1"),
        .package(url: "https://github.com/SwiftGen/SwiftGen", .upToNextMajor(from: "6.5.0"))
    ],
    targets: [
        .target(name: "BuildTools", path: "")
    ]
)
