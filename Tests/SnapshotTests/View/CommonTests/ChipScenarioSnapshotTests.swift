//
//  ChipScenarioSnapshotTests.swift
//  SparkComponentChipSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentChip
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum ChipScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [ChipConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents & variants & isSelected
    ///
    /// Content:
    ///  - intents: all
    ///  - variant: all
    ///  - alignment: default
    ///  - content: icon + text
    ///  - isSelected: all
    ///  - isDisabled: default
    ///  - mode: all
    ///  - size: default
    private func test1() -> [ChipConfigurationSnapshotTests] {
        let intents = ChipIntent.allCases
        let variants = ChipVariant.allCases
        let areSelected = Bool.allCases

        return intents.flatMap { intent in
            variants.flatMap { variant in
                areSelected.map { isSelected in
                        .init(
                            scenario: self,
                            intent: intent,
                            variant: variant,
                            isIcon: true,
                            isSelected: isSelected,
                            modes: Constants.Modes.all
                        )
                }
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test all alignments
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - alignment: default
    ///  - content: icon + text + badge
    ///  - isSelected: default
    ///  - isDisabled: default
    ///  - mode: default
    ///  - size: default
    private func test2() -> [ChipConfigurationSnapshotTests] {
        let alignments = ChipAlignment.allCases
        let areBadge = Bool.allCases

        return alignments.flatMap { alignment in
            areBadge.map { isBadge in
                    .init(
                        scenario: self,
                        alignment: alignment,
                        isIcon: true,
                        isBadge: isBadge
                    )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test content
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - alignment: default
    ///  - content: all
    ///  - isSelected: all
    ///  - isDisabled: false
    ///  - mode: default
    ///  - size: default
    private func test3() -> [ChipConfigurationSnapshotTests] {
        let labels = ChipLabel.allCases
        let areIcon = Bool.allCases
        let areBadge = Bool.allCases

        return labels.flatMap { label in
            areIcon.flatMap { isIcon in
                areBadge.compactMap { isBadge in

                    if label == .withoutText && !isIcon && !isBadge {
                        nil
                    } else {
                        .init(
                            scenario: self,
                            label: label,
                            isIcon: isIcon,
                            isBadge: isBadge
                        )
                    }
                }
            }
        }
    }

    /// Test 4
    ///
    /// Description: To test is disabled
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - alignment: default
    ///  - content: icon + text + badge
    ///  - isSelected: default
    ///  - isDisabled: true
    ///  - mode: default
    ///  - size: default
    private func test4() -> [ChipConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                isIcon: true,
                isBadge: true,
                isDisabled: true
            )
        ]
    }

    /// Test 5
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - alignment: default
    ///  - content: icon + text
    ///  - isSelected: default
    ///  - isDisabled: default
    ///  - mode: default
    ///  - size: all
    private func test5() -> [ChipConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                isIcon: true,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [ChipConfigurationSnapshotTests] {
        var items: [ChipConfigurationSnapshotTests] = []

        // Text only
        let labels = ChipLabel.allCases.filter { $0 != .withoutText }
        items.append(contentsOf: labels.map { label in
            ChipConfigurationSnapshotTests(
                scenario: self,
                label: label,
                documentationName: "component_with_\(label.documentationName)"
            )
        })

        // Icon
        items.append(.init(
            scenario: self,
            label: .withoutText,
            isIcon: true,
            documentationName: "component_with_icon"
        ))

        // Icon & Badge
        items.append(.init(
            scenario: self,
            label: .withoutText,
            isIcon: true,
            isBadge: true,
            documentationName: "component_with_icon_and_extra_content"
        ))

        // Text & Icons
        items.append(.init(
            scenario: self,
            label: .text,
            isIcon: true,
            documentationName: "component_with_text_and_icon"
        ))

        // All contents
        items.append(.init(
            scenario: self,
            isIcon: true,
            isBadge: true,
            documentationName: "component_with_text_and_icon_and_extra_content"
        ))

        // Selected
        items.append(.init(
            scenario: self,
            isIcon: true,
            isBadge: true,
            isSelected: true,
            documentationName: "component_selected"
        ))

        // Disabled
        items.append(.init(
            scenario: self,
            isIcon: true,
            isBadge: true,
            isDisabled: true,
            documentationName: "component_disabled"
        ))

        return items
    }
}
