// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APIRequests",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "APIRequests",
            targets: ["APIRequests"]),
    ],
    dependencies: [
        .package(path: "../Configurations/Configuration"),
        .package(path: "APIClient"),
        .package(path: "Models"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "APIRequests",
            dependencies: [
                "Configuration",
                "APIClient",
                "Models"
            ]
        ),
        .testTarget(
            name: "APIRequestsTests",
            dependencies: ["APIRequests"]),
    ]
)
