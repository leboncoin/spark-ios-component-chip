// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkComponentChip",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SparkComponentChip",
            targets: ["SparkComponentChip"]
        ),
        .library(
            name: "SparkChipTesting",
            targets: ["SparkChipTesting"]
        )
    ],
    dependencies: [
       .package(
           url: "https://github.com/leboncoin/spark-ios-common.git",
           // path: "../spark-ios-common"
           /*version*/ "0.1.0"..."999.999.999"
       ),
       .package(
           url: "https://github.com/leboncoin/spark-ios-theming.git",
           // path: "../spark-ios-theming"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/leboncoin/spark-ios-component-badge.git",
           // path: "../spark-ios-component-badge"
           /*version*/ "0.0.1"..."999.999.999"
       )
    ],
    targets: [
        .target(
            name: "SparkComponentChip",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Core"
        ),
        .target(
            name: "SparkChipTesting",
            dependencies: [
                "SparkComponentChip",
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Testing"
        ),
        .testTarget(
            name: "SparkChipUnitTests",
            dependencies: [
                "SparkComponentChip",
                "SparkChipTesting",
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                )
            ],
            path: "Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkChipSnapshotTests",
            dependencies: [
                "SparkComponentChip",
                "SparkChipTesting",
                .product(
                    name: "SparkCommonSnapshotTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkComponentBadge",
                    package: "spark-ios-component-badge"
                ),
            ],
            path: "Tests/SnapshotTests"
        ),
    ]
)
