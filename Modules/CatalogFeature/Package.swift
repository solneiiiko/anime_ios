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
        .package(path: "../Core/MVI"),
        .package(path: "../Core/Domain"),
        .package(path: "../Core/Presentation"),
        .package(path: "../Entity/anime/domain/api"),
    ],
    targets: [
        .target(
            name: "CatalogFeature",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "CoreMVI", package: "MVI"),
                .product(name: "CoreDomain", package: "Domain"),
                .product(name: "CorePresentation", package: "Presentation"),
                .product(name: "EntityDomainApiAnime", package: "api"),
            ],
            resources: [
                .process("Resources")
            ]
        ),
    ],
    swiftLanguageModes: [.v6],
)
