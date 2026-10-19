// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreMVI",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CoreMVI",
            targets: ["CoreMVI"]
        ),
    ],
    targets: [
        .target(
            name: "CoreMVI"
        ),
    ],
    swiftLanguageModes: [.v6],
)
