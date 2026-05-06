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
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetBorderUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetBorderUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = ChipGetBorderUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_outlined_variant() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .outlined,
            removeShapeFeatureToggle: false
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, 0)
    }

    func test_execute_with_tinted_variant() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .tinted,
            removeShapeFeatureToggle: false
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, 0)
    }

    func test_execute_with_dashed_variant() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .dashed,
            removeShapeFeatureToggle: false
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, ChipConstants.dashLength)
    }

    func test_execute_with_removeShapeFeatureToggle_true() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .outlined,
            removeShapeFeatureToggle: true
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.full)
        XCTAssertEqual(result.dash, 0)
    }

    func test_execute_with_removeShapeFeatureToggle_false() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .tinted,
            removeShapeFeatureToggle: false
        )

        // THEN
        XCTAssertEqual(result.width, self.theme.border.width.small)
        XCTAssertEqual(result.radius, self.theme.border.radius.medium)
        XCTAssertEqual(result.dash, 0)
    }
}
