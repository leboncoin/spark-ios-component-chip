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
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetLayoutUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetLayoutUseCase!
    private var theme: ThemeGeneratedMock!
    private var featureToggleService: SparkFeatureToggleServicingGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.featureToggleService = SparkFeatureToggleServicingGeneratedMock()
        self.sut = ChipGetLayoutUseCase(featureTogglesService: self.featureToggleService)
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_leading_icon_alignment_and_rebranding_false() {
        // GIVEN
        self.featureToggleService.rebranding = false

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .leadingIcon
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.small)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.medium)
    }

    func test_execute_with_leading_icon_alignment_and_rebranding_true() {
        // GIVEN
        self.featureToggleService.rebranding = true

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .leadingIcon
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.small)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.large)
    }

    func test_execute_with_trailing_icon_alignment_and_rebranding_false() {
        // GIVEN
        self.featureToggleService.rebranding = false

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .trailingIcon
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.medium)
    }

    func test_execute_with_trailing_icon_alignment_and_rebranding_true() {
        // GIVEN
        self.featureToggleService.rebranding = true

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .trailingIcon
        )

        // THEN
        XCTAssertEqual(result.spacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.extraContentSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.padding, self.theme.layout.spacing.large)
    }
}
