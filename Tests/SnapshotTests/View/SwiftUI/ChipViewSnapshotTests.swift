//
//  ChipViewSnapshotTests.swift
//  SparkChipSnapshotTests
//
//  Created by michael.zimmermann on 26.10.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@testable import SparkChip
import SparkTheming
import SparkTheme

final class ChipViewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ChipScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: true)
            for configuration in configurations {
                let view = ChipView(
                    theme: self.theme,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    icon: configuration.icon?.rightValue,
                    title: configuration.text)
                    .component(configuration.badge?.rightValue)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}
