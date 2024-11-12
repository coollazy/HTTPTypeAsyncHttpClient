// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HTTPTypeAsyncHttpClient",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "HTTPTypeAsyncHttpClient",
            targets: ["HTTPTypeAsyncHttpClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/coollazy/HTTPType.git", from: "1.0.0"),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.23.1"),
    ],
    targets: [
        .target(
            name: "HTTPTypeAsyncHttpClient",
            dependencies: [
                .product(name: "HTTPType", package: "HTTPType"),
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
            ]
        ),
    ]
)
