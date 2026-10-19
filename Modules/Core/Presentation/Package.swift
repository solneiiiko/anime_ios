// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CorePresentation",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CorePresentation",
            targets: ["CorePresentation"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../../DesignSystem"),
    ],
    targets: [
        .target(
            name: "CorePresentation",
            dependencies: [
                .product(name: "CoreDomain", package: "Domain"),
                .product(name: "DesignSystem", package: "DesignSystem"),
            ],
            resources: [
                .process("Resources")
            ]
        ),
    ],
    swiftLanguageModes: [.v6],
)
