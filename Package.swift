// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GreemSwiftPackage",
    platforms: [.iOS(.v15),.macCatalyst(.v14),.visionOS(.v1),.watchOS(.v8),.macOS(.v14),.driverKit(.v20),.tvOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GreemSwiftPackage",
            targets: ["GreemSwiftPackage"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GreemSwiftPackage"),
        .testTarget(
            name: "GreemSwiftPackageTests",
            dependencies: ["GreemSwiftPackage"]),
    ]
)
