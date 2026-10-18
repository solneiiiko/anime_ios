// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreNetwork",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CoreNetwork",
            targets: ["CoreNetwork"]
        ),
    ],
    targets: [
        .target(
            name: "CoreNetwork"
        ),
    ],
    swiftLanguageModes: [.v6],
)
