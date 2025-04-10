//
//  ChipUIViewSnapshotTests.swift
//  Spark
//
//  Created by michael.zimmermann on 26.10.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkChip
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SparkTheming
import SparkTheme

final class ChipUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ChipScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: false)
            for configuration in configurations {
                let view = ChipUIView(
                    theme: self.theme,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    optionalLabel: configuration.text,
                    optionalIconImage: configuration.icon?.leftValue)

                view.component = configuration.badge?.leftValue

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
