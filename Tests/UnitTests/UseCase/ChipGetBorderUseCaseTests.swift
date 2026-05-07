//
//  ChipGetBorderUseCaseTests.swift
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

final class ChipGetBorderUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetBorderUseCase!
    private var theme: ThemeGeneratedMock!
    private var featureToggleService: SparkFeatureToggleServicingGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.featureToggleService = SparkFeatureToggleServicingGeneratedMock()
        self.sut = ChipGetBorderUseCase(featureTogglesService: self.featureToggleService)
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_outlined_variant() {
        // GIVEN
        self.featureToggleService.rebranding = false

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .outlined
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, 0)
    }

    func test_execute_with_tinted_variant() {
        // GIVEN
        self.featureToggleService.rebranding = false

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, 0)
    }

    func test_execute_with_dashed_variant() {
        // GIVEN
        self.featureToggleService.rebranding = false

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .dashed
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, ChipConstants.dashLength)
    }

    func test_execute_with_rebranding_true() {
        // GIVEN
        self.featureToggleService.rebranding = true

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .outlined
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.full)
        XCTAssertEqual(result.dash, 0)
    }

    func test_execute_with_rebranding_false() {
        // GIVEN
        self.featureToggleService.rebranding = false

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .tinted
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, 0)
    }
}
