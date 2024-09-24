// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Charcoal",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "Charcoal",
            targets: ["Charcoal"]
        ),
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
            name: "Charcoal",
            dependencies: ["CharcoalShared", "CharcoalSwiftUI", "CharcoalUIKit"]
        ),
        .target(
            name: "CharcoalShared",
            dependencies: []
        ),
        .target(
            name: "CharcoalSwiftUI",
            dependencies: ["CharcoalShared"]
        ),
        .target(
            name: "CharcoalUIKit",
            dependencies: ["CharcoalShared"]
        ),
        .testTarget(
            name: "charcoal-iosUIKitTests",
            dependencies: ["CharcoalUIKit"]
        )
    ]
)
