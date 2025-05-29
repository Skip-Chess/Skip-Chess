// swift-tools-version: 6.0
// This is a Skip (https://skip.tools) package.
import PackageDescription

let package = Package(
    name: "Skip-Chess",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .macCatalyst(.v17)],
    products: [
        .library(name: "SkipChess", type: .dynamic, targets: ["SkipChess"]),
        .library(name: "SkipChessModel", type: .dynamic, targets: ["SkipChessModel"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.5.18"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", "0.0.0"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-fuse.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "1.0.0"),
        .package(url: "https://github.com/Skip-Chess/ChessKit.git", branch: "develop"),
        .package(url: "https://github.com/Skip-Chess/ChessboardKit.git", branch: "main"),
    ],
    targets: [
        .target(name: "SkipChess", dependencies: [
            "SkipChessModel",
            .product(name: "SkipFuseUI", package: "skip-fuse-ui"),
            .product(name: "ChessboardKit", package: "ChessboardKit")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipChessModel", dependencies: [
            .product(name: "SkipFuse", package: "skip-fuse"),
            .product(name: "SkipModel", package: "skip-model"),
            .product(name: "ChessKit", package: "ChessKit"),
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipChessModelTests", dependencies: [
            "SkipChessModel",
            .product(name: "SkipTest", package: "skip")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
