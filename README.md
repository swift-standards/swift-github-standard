# swift-github-standard

[![CI](https://github.com/swift-standards/swift-github-standard/actions/workflows/ci.yml/badge.svg)](https://github.com/swift-standards/swift-github-standard/actions/workflows/ci.yml)

Foundation-free Swift value types for GitHub REST API contracts.

## Ecosystem

This package belongs to the Swift Institute Standards layer. It preserves GitHub's
published wire vocabulary while leaving transport, authentication, retries, and
application persistence to higher layers.

## Products

| Product | Module | Purpose |
| --- | --- | --- |
| GitHub Standard | `GitHub_Standard` | GitHub request, response, identifier, pagination, repository, traffic, and stargazer contracts |

## Installation

Add the package and depend on the `GitHub Standard` product:

```swift
dependencies: [
    .package(
        url: "https://github.com/swift-standards/swift-github-standard.git",
        branch: "main"
    )
]
```

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(
            name: "GitHub Standard",
            package: "swift-github-standard"
        )
    ]
)
```

## Usage

Repository traffic and stargazer history are distinct GitHub domains:

```swift
import GitHub_Standard

let views = GitHub.Repository.Traffic.Views.Request(
    owner: .init(rawValue: "swiftlang"),
    repository: .init(rawValue: "swift"),
    interval: .day
)

let stargazers = GitHub.Repository.Stargazers.Request(
    owner: .init(rawValue: "swiftlang"),
    repository: .init(rawValue: "swift"),
    page: .first,
    size: .maximum
)
```

Traffic counts use `UInt64`, timestamps use `RFC_3339.DateTime`, and provider
URIs use `RFC_3986.URI`. The package does not normalize those values into
Foundation or application persistence types.

Repository metadata is returned by both
`GitHub.Repository.Get` and `GitHub.User.Repositories`. The latter models the
authenticated-user repository collection, including GitHub's visibility, type,
sort, direction, and timestamp filters.

## Architecture

`GitHub_Standard` defines contracts only. Typed clients live in
[swift-github](https://github.com/swift-foundations/swift-github), and the HTTP
binding lives in
[swift-github-http](https://github.com/swift-foundations/swift-github-http).

No deprecated `GitHub Types`, `GitHub Traffic`, `GitHub Stargazers`, or
`GitHub Repositories` compatibility products are provided.

## Development

Build and test through the Swift Institute build coordinator:

```bash
/Users/coen/Developer/swift-institute/Scripts/swift-build package build
/Users/coen/Developer/swift-institute/Scripts/swift-build package test
```

## License

This package is available under the MIT license.
