// swift-tools-version:5.9
import PackageDescription

let swiftSettings: [SwiftSetting] = [.enableExperimentalFeature("StrictConcurrency=complete")]

let package = Package(
    name: "swift-w3c-trace-context",
    products: [
        .library(name: "W3CTraceContext", targets: ["W3CTraceContext"]),
    ],
    dependencies: [
        .package(url: "https://github.com/candlefinance/swift-collections.git", branch: "fix-candle-1.1.4"),
    ],
    targets: [
        .target(
            name: "W3CTraceContext",
            dependencies: [
                .product(name: "OrderedCollections", package: "swift-collections"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "W3CTraceContextTests",
            dependencies: [.target(name: "W3CTraceContext")],
            swiftSettings: swiftSettings
        ),
    ],
    swiftLanguageVersions: [.version("6"), .v5]
)
