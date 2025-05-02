// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IgniteSamples",
    platforms: [.macOS(.v14)],
    dependencies: [
        // The line below makes Ignite Samples use
        // the main Ignite repository.
//        .package(url: "https://github.com/twostraws/Ignite.git", branch: "main")
        .package(url: "https://github.com/twostraws/Ignite.git", branch: "site-search")

        // This line makes Ignite Samples use a local
        // copy of Ignite, placed one folder up
        // from Ignite Samples, which is helpful when
        // trying things out locally.
        // .package(path: "../Ignite")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "IgniteSamples",
            dependencies: ["Ignite"]),
    ]
)
