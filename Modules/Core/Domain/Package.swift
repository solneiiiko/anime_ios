// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDomain",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CoreDomain",
            targets: ["CoreDomain"]
        ),
    ],
    targets: [
        .target(
            name: "CoreDomain"
        ),
    ],
    swiftLanguageModes: [.v6],
)
