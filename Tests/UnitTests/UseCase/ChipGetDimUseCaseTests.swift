//
//  ChipGetDimUseCaseTests.swift
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

final class ChipGetDimUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_when_isEnabled() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = ChipGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_when_isDisabled() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = ChipGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: false
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim3)
    }
}
