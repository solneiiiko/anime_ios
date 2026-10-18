// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EntityDataImplAnime",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "EntityDataImplAnime",
            targets: ["EntityDataImplAnime"]
        ),
    ],
    dependencies: [
        .package(path: "../../domain/api"),
        .package(path: "../../../../Core/Network"),
        .package(path: "../../../../Core/Di"),
        .package(path: "../../../../Core/Domain"),
        .package(path: "../../../../Core/Repository"),
    ],
    targets: [
        .target(
            name: "EntityDataImplAnime",
            dependencies: [
                .product(name: "EntityDomainApiAnime", package: "api"),
                .product(name: "CoreNetwork", package: "Network"),
                .product(name: "CoreDI", package: "Di"),
                .product(name: "CoreDomain", package: "Domain"),
                .product(name: "CoreRepository", package: "Repository"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6],
)
