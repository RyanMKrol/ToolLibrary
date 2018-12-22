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
        .package(url: "https://github.com/IBM-Swift/Configuration.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "4.2.0")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", .upToNextMajor(from: "1.7.4")),
    ],
    targets: [
        .target(
            name: "SwiftToolbox",
            dependencies: ["SwiftSoup", "Configuration", "SwiftyJSON"]),
        .testTarget(
            name: "SwiftToolboxTests",
            dependencies: ["SwiftToolbox"]),
    ]
)
