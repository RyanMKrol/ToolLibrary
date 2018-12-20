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
        .package(url: "https://github.com/scinfu/SwiftSoup.git", .upToNextMajor(from: "1.7.4")),
    ],
    targets: [
        .target(
            name: "SwiftToolbox",
            dependencies: ["SwiftSoup"]),
        .testTarget(
            name: "SwiftToolboxTests",
            dependencies: ["SwiftToolbox"]),
    ]
)
