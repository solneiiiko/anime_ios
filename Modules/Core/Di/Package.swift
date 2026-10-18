// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDI",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CoreDI",
            targets: ["CoreDI"]
        ),
    ],
    targets: [
        .target(
            name: "CoreDI"
        ),
    ],
    swiftLanguageModes: [.v6],
)
