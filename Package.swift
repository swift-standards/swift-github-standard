// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-github-standard",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "GitHub Standard",
            targets: ["GitHub Standard"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-standards/swift-emailaddress-standard.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-ietf/swift-rfc-3339.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-ietf/swift-rfc-3986.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "GitHub Standard",
            dependencies: [
                .product(
                    name: "EmailAddress Standard",
                    package: "swift-emailaddress-standard"
                ),
                .product(name: "RFC 3339", package: "swift-rfc-3339"),
                .product(name: "RFC 3986", package: "swift-rfc-3986"),

                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .testTarget(
            name: "GitHub Standard Tests",
            dependencies: ["GitHub Standard"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
