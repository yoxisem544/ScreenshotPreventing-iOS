// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScreenshotPreventing",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "ScreenshotPreventing", targets: ["ScreenshotPreventing"]),
        .library(name: "RxScreenshotPreventing", targets: ["RxScreenshotPreventing"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ScreenshotPreventing",
            dependencies: []
        ),
        .target(
            name: "RxScreenshotPreventing",
            dependencies: [
                "ScreenshotPreventing",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift")
            ]
        ),
        .testTarget(
            name: "ScreenshotPreventingTests",
            dependencies: ["ScreenshotPreventing"]
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
