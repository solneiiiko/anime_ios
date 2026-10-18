// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CatalogFeature",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "CatalogFeature",
            targets: ["CatalogFeature"]
        ),
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../Core/Di"),
    ],
    targets: [
        .target(
            name: "CatalogFeature",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "CoreDI", package: "Di"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6],
)
