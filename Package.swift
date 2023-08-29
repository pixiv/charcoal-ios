// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Charcoal",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "CharcoalSwiftUI",
            targets: ["CharcoalSwiftUI"]
        ),
        .library(
            name: "CharcoalUIKit",
            targets: ["CharcoalUIKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CharcoalSwiftUI",
            dependencies: ["CharcoalShared"]
        ),
        .target(
            name: "CharcoalUIKit",
            dependencies: ["CharcoalShared"]
        ),
        .target(
            name: "CharcoalShared",
            dependencies: [],
            resources: [
                .process("Generated/CharcoalFoundation.json")
            ]
        )
    ]
)
