// swift-tools-version:5.9
import PackageDescription

let swiftSettings: [SwiftSetting] = [.enableExperimentalFeature("StrictConcurrency=complete")]

let package = Package(
    name: "candle-swift-w3c-trace-context",
    products: [
        .library(name: "CandleW3CTraceContext", targets: ["CandleW3CTraceContext"]),
    ],
    dependencies: [
        .package(name: "candle-swift-collections", url: "https://github.com/candlefinance/swift-collections.git", branch: "fix-candle-1.1.4"),
    ],
    targets: [
        .target(
            name: "CandleW3CTraceContext",
            dependencies: [
                .product(name: "CandleOrderedCollections", package: "candle-swift-collections"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "W3CTraceContextTests",
            dependencies: [.target(name: "CandleW3CTraceContext")],
            swiftSettings: swiftSettings
        ),
    ],
    swiftLanguageVersions: [.version("6"), .v5]
)
