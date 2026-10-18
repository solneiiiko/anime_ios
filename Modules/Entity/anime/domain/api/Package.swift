// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EntityDomainApiAnime",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "EntityDomainApiAnime",
            targets: ["EntityDomainApiAnime"]
        ),
    ],
    dependencies: [
        .package(path: "../../../../Core/Domain"),
    ],
    targets: [
        .target(
            name: "EntityDomainApiAnime",
            dependencies: [
                .product(name: "CoreDomain", package: "Domain"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6],
)
