// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Charcoal",
    platforms: [
        .iOS(.v11),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "Charcoal",
            targets: ["Charcoal"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Charcoal",
            dependencies: [],
            resources: [
                .process("Generated/CharcoalFoundation.json")
            ]
        )
    ]
)
