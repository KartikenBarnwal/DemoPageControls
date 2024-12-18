// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "InfinitePageControls",
    platforms: [
        .iOS(.v13) // Specify the minimum iOS version
    ],
    products: [
        .library(
            name: "InfinitePageControls",
            targets: ["InfinitePageControls"]
        ),
    ],
    dependencies: [
        // Add dependencies here if needed
    ],
    targets: [
        .target(
            name: "InfinitePageControls",
            dependencies: [],
            path: "Sources/"
        ),
        .testTarget(
            name: "InfinitePageControlsTests",
            dependencies: ["InfinitePageControls"],
            path: "Tests/InfinitePageControlsTests"
        ),
    ]
)

