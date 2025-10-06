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

    // MARK: - Tests

    func test_execute_returns_correct_layout() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = ChipGetLayoutUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        XCTAssertEqual(result.spacing, theme.layout.spacing.medium)
        XCTAssertEqual(result.subSpacing, theme.layout.spacing.small)
        XCTAssertEqual(result.padding, theme.layout.spacing.medium)
    }
}
