// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "InfinitePageControls",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "InfinitePageControls",
            targets: ["InfinitePageControls"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "InfinitePageControls",
            dependencies: [],
            path: "Sources/InfinitePageControls"
        ),
        .testTarget(
            name: "InfinitePageControlsTests",
            dependencies: ["InfinitePageControls"],
            path: "Tests/InfinitePageControlsTests"
        ),
    ]
)
