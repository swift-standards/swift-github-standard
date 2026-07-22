// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-github-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "GitHub Standard",
            targets: ["GitHub Standard"]
        )
    ],
    targets: [
        .target(name: "GitHub Standard"),
        .testTarget(
            name: "GitHub Standard Tests",
            dependencies: ["GitHub Standard"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
