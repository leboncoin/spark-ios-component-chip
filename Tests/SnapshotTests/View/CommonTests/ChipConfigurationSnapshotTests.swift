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

    var alignment: ChipAlignment = .default
    var intent: ChipIntent = .default
    var variant: ChipVariant = .default
    var label: ChipLabel = .default
    var isIcon: Bool = false
    var isBadge: Bool = false
    var isSelected: Bool = false
    var isDisabled: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    var documentationName: String?

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.alignment)" + "Alignment",
            "\(self.intent)" + "Intent",
            "\(self.variant)" + "Variant",
            "\(self.label)" + "Content",
            self.isIcon ? "withIcon" : nil,
            self.isBadge ? "withBadge" : nil,
            self.isDisabled ? "disabled" : nil,
            self.isSelected ? "selected" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }
}

// MARK: - Enum

enum ChipLabel: String, CaseIterable {
    case withoutText
    case text
    case other

    static var `default` = Self.text

    var text: String? {
        switch self {
        case .withoutText: nil
        case .text: "My component"
        case .other: nil
        }
    }

    var documentationName: String {
        switch self {
        case .withoutText: ""
        case .text: "text"
        case .other: "label"
        }
    }
}
