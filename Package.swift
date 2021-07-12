// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PopTarts",
     platforms: [
              .macOS(.v10_15),
              .iOS(.v13),
              .watchOS(.v6)
         ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PopTarts",
            targets: ["PopTarts"]),
    ],
	dependencies: [
		  .package(url: "https://github.com/bengottlieb/Suite.git", from: "0.10.75"),
	],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "PopTarts", dependencies: ["Suite"]),
    ]
)
