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
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "4.3.0")),
        .package(url: "https://github.com/IBM-Swift/Swift-SMTP.git", .upToNextMajor(from: "5.1.0")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", .upToNextMajor(from: "1.7.4")),
    ],
    targets: [
        .target(
            name: "SwiftToolbox",
            dependencies: ["SwiftSoup", "Configuration", "SwiftyJSON", "SwiftSMTP"]),
        .testTarget(
            name: "SwiftToolboxTests",
            dependencies: ["SwiftToolbox"]),
    ]
)
