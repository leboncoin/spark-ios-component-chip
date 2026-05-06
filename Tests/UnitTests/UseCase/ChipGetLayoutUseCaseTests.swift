//
//  ChipGetLayoutUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetLayoutUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetLayoutUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = ChipGetLayoutUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_leading_icon_alignment_and_feature_toggle_false() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .leadingIcon,
            removeShapeFeatureToggle: false
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.small)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.medium)
    }

    func test_execute_with_leading_icon_alignment_and_feature_toggle_true() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .leadingIcon,
            removeShapeFeatureToggle: true
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.small)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.large)
    }

    func test_execute_with_trailing_icon_alignment_and_feature_toggle_false() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .trailingIcon,
            removeShapeFeatureToggle: false
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.medium)
    }

    func test_execute_with_trailing_icon_alignment_and_feature_toggle_true() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .trailingIcon,
            removeShapeFeatureToggle: true
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.large)
    }
}
