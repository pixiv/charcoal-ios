// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CharcoalSwiftUISample",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "CharcoalSwiftUISample",
            targets: ["CharcoalSwiftUISample"]
        )
    ],
    dependencies: [
        .package(name: "charcoal-ios", path: "../")
    ],
    targets: [
        .target(
            name: "CharcoalSwiftUISample",
            dependencies: [
                .product(name: "Charcoal", package: "charcoal-ios")
            ]
        )
    ]
)
