// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkChip",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SparkChip",
            targets: ["SparkChip"]
        ),
        .library(
            name: "SparkChipTesting",
            targets: ["SparkChipTesting"]
        )
    ],
    dependencies: [
       .package(
           url: "https://github.com/adevinta/spark-ios-common.git",
           // path: "../spark-ios-common"
           /*version*/ "0.1.0"..."999.999.999"
       ),
       .package(
           url: "https://github.com/adevinta/spark-ios-theming.git",
           // path: "../spark-ios-theming"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/adevinta/spark-ios-component-badge.git",
           // path: "../spark-ios-theming"
           /*version*/ "0.0.1"..."999.999.999"
       )
    ],
    targets: [
        .target(
            name: "SparkChip",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                )
            ]
        ),
        .target(
            name: "SparkChipTesting",
            dependencies: [
                "SparkChip",
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
            ]
        ),
        .testTarget(
            name: "SparkChipUnitTests",
            dependencies: [
                "SparkChip",
                "SparkChipTesting",
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                )
            ]
        ),
        .testTarget(
            name: "SparkChipSnapshotTests",
            dependencies: [
                "SparkChip",
                "SparkChipTesting",
                .product(
                    name: "SparkCommonSnapshotTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkBadge",
                    package: "spark-ios-component-badge"
                ),
            ]
        ),
    ]
)
