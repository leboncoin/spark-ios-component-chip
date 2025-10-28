//
//  ChipConfigurationSnapshotTests.swift
//  SparkComponentChipSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct ChipConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: ChipScenarioSnapshotTests

    let intent: ChipIntent
    let variant: ChipVariant
    let icon: ImageEither?
    let text: String?
    let badge: ViewEither?
    let state: ChipState

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.variant)",
            self.icon != nil ? "withImage" : "withoutImage",
            self.text != nil ? "withText" : "withoutText",
            self.badge != nil ? "withBadge" : "withoutBadge",
            self.state.isDisabled ? "disabled" : "enabled",
            self.state.isSelected ? "selected" : "notSelected"
        ].joined(separator: "-")
    }
}
