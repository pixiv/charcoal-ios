// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CharcoalUIKitSample",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CharcoalUIKitSample",
            targets: ["CharcoalUIKitSample"]
        )
    ],
    dependencies: [
        .package(name: "charcoal-ios", path: "../")
    ],
    targets: [
        .target(
            name: "CharcoalUIKitSample",
            dependencies: [
                .product(name: "Charcoal", package: "charcoal-ios")
            ],
            resources: [
                .copy("Storyboards/Content.storyboard"),
            ]
        )
    ]
)
