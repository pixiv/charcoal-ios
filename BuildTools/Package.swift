// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.52.4"),
        .package(url: "https://github.com/realm/SwiftLint", from: "0.52.4"),
        .package(url: "https://github.com/SwiftGen/SwiftGen", .upToNextMajor(from: "6.6.2"))
    ],
    targets: [
        .target(name: "BuildTools", path: "")
    ]
)
