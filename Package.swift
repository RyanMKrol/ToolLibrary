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
        .package(url: "https://github.com/IBM-Swift/Configuration.git", .exact("3.0.0")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .exact("4.3.0")),
        .package(url: "https://github.com/IBM-Swift/Swift-SMTP.git", .exact("5.1.0")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", .exact("1.7.4")),
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
