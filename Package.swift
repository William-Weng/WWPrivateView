// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWPrivateView",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWPrivateView", targets: ["WWPrivateView"]),
    ],
    targets: [
        .target(name: "WWPrivateView", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
