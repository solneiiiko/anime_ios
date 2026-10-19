// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreRepository",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CoreRepository",
            targets: ["CoreRepository"]
        ),
    ],
    dependencies: [
        .package(path: "../Network"),
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "CoreRepository",
            dependencies: [
                .product(name: "CoreNetwork", package: "Network"),
                .product(name: "CoreDomain", package: "Domain"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6],
)
