// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAsk",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftAsk",
            targets: ["SwiftAsk"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.0"),
        .package(url: "https://github.com/skunkrocker/SwiftExt.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-tools-support-core.git", .upToNextMajor(from: "0.4.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftAsk",
            dependencies: [
                .product(name: "Rainbow", package: "Rainbow"),
                .product(name: "SwiftExt", package: "SwiftExt"),
                .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core")
            ]),
        .testTarget(
            name: "SwiftAskTests",
            dependencies: ["SwiftAsk"]),
    ]
)
