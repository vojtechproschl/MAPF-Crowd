// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MAPF-Crowd",
    platforms: [.macOS(.v10_15)],   
    products: [
        .executable(
            name: "CommandLineInterface", 
            targets: ["CommandLineInterface"]
        ),
        .library(
            name: "Topology", 
            targets: ["Topology"]
        ),
        .executable(
            name: "Experimental", 
            targets: ["Experimental"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftlang/swift-testing.git",
            branch: "main"
        )],
    targets: [
        .executableTarget(
            name: "CommandLineInterface",
            dependencies: [
                "Topology"
            ],
            path: "Sources/CommandLineInterface"
        ),
        .target(name: "Topology", path: "Sources/Topology"),
        .testTarget(
            name: "TopologyTests",
            dependencies: [
                .product(
                    name: "Testing", 
                    package: "swift-testing"
                ),
                "Topology",
            ],
            path: "Tests/TopologyTests"
        ),
        .executableTarget(
            name: "Experimental",
            dependencies: [
                "Topology",
            ],
            path: "Sources/Experimental"
        )
    ]
    
)
