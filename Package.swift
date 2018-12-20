// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftToolbox",
    products: [
        .library(
            name: "SwiftToolbox",
            targets: ["SwiftToolbox"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftToolbox",
            dependencies: []),
        .testTarget(
            name: "SwiftToolboxTests",
            dependencies: ["SwiftToolbox"]),
    ]
)
