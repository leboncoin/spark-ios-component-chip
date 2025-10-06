//
//  ChipUIViewModelTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) @testable import SparkComponentChipTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class ChipUIViewModelTests: XCTestCase {

    // MARK: - Initialization Test

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: ChipBorder(),
            otherColors: ChipColors(),
            otherDim: 0,
            otherIsReversed: false,
            otherLayout: ChipLayout(),
            otherTitleFont: TypographyFontTokenClear()
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    // MARK: - Load Tests

    func test_load_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load()

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.defaultIntent,
            givenVariant: stub.defaultVariant,
            givenIsSelected: stub.defaultIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ChipGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: stub.defaultVariant,
            expectedReturnValue: stub.expectedBorder
        )

        ChipGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.defaultIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        ChipGetIsReversedUseCaseableMockTest.XCTAssert(
            stub.getIsReversedUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: stub.defaultAlignment,
            expectedReturnValue: stub.expectedIsReversed
        )

        ChipGetLayoutUseCaseableMockTest.XCTAssert(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        ChipGetTitleFontUseCaseableMockTest.XCTAssert(
            stub.getTitleFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleFont
        )
    }

    // MARK: - Property Change Tests

    func test_themeChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getIsReversedUseCase: true
        )

        ChipGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.defaultIntent,
            givenVariant: stub.defaultVariant,
            givenIsSelected: stub.defaultIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ChipGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenVariant: stub.defaultVariant,
            expectedReturnValue: stub.expectedBorder
        )

        ChipGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsEnabled: stub.defaultIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        ChipGetLayoutUseCaseableMockTest.XCTAssert(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        ChipGetTitleFontUseCaseableMockTest.XCTAssert(
            stub.getTitleFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTitleFont
        )
    }

    func test_alignmentChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenAlignment = ChipAlignment.trailingIcon

        // WHEN
        viewModel.alignment = givenAlignment

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetIsReversedUseCaseableMockTest.XCTAssert(
            stub.getIsReversedUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: givenAlignment,
            expectedReturnValue: stub.expectedIsReversed
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    func test_intentChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenIntent = ChipIntent.danger

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenVariant: stub.defaultVariant,
            givenIsSelected: stub.defaultIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    func test_variantChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenVariant = ChipVariant.dashed

        // WHEN
        viewModel.variant = givenVariant

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.defaultIntent,
            givenVariant: givenVariant,
            givenIsSelected: stub.defaultIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ChipGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    func test_isSelectedChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenIsSelected = !stub.defaultIsSelected

        // WHEN
        viewModel.isSelected = givenIsSelected

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.defaultIntent,
            givenVariant: stub.defaultVariant,
            givenIsSelected: givenIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    func test_isPressedChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenIsPressed = !stub.defaultIsPressed

        // WHEN
        viewModel.isPressed = givenIsPressed

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.defaultIntent,
            givenVariant: stub.defaultVariant,
            givenIsSelected: stub.defaultIsSelected,
            givenIsPressed: givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    func test_isEnabledChanged_shouldUpdateDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenIsEnabled = !stub.defaultIsEnabled

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    func test_propertiesChanged_withoutLoadBefore_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.alignment = .trailingIcon
        viewModel.intent = .danger
        viewModel.variant = .dashed
        viewModel.isSelected = !stub.defaultIsSelected
        viewModel.isPressed = !stub.defaultIsPressed
        viewModel.isEnabled = !stub.defaultIsEnabled

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: ChipBorder(),
            otherColors: ChipColors(),
            otherDim: 0,
            otherIsReversed: false,
            otherLayout: ChipLayout(),
            otherTitleFont: TypographyFontTokenClear()
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    func test_propertiesChanged_withoutChange_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.alignment = stub.defaultAlignment
        viewModel.intent = stub.defaultIntent
        viewModel.variant = stub.defaultVariant
        viewModel.isSelected = stub.defaultIsSelected
        viewModel.isPressed = stub.defaultIsPressed
        viewModel.isEnabled = stub.defaultIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub: ChipUIViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let defaultAlignment = ChipAlignment.default
    let defaultIntent = ChipIntent.default
    let defaultVariant = ChipVariant.default
    var defaultIsSelected: Bool = false
    var defaultIsPressed: Bool = false
    var defaultIsEnabled: Bool = true

    // MARK: - Expected Properties

    let expectedColors = ChipColors(
        background: ColorTokenGeneratedMock.blue(),
        border: ColorTokenGeneratedMock.green(),
        content: ColorTokenGeneratedMock.orange()
    )
    let expectedBorder = ChipBorder(width: 1, radius: 2, dash: 3)
    let expectedDim: CGFloat = 0.5
    let expectedIsReversed = true
    let expectedLayout = ChipLayout(spacing: 10, padding: 11)
    let expectedTitleFont = TypographyFontTokenGeneratedMock.mocked(.body)

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = ChipGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentAndVariantAndIsSelectedAndIsPressedReturnValue = self.expectedColors

        let getBorderUseCaseMock = ChipGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndVariantReturnValue = self.expectedBorder

        let getDimUseCaseMock = ChipGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getIsReversedUseCaseMock = ChipGetIsReversedUseCaseableGeneratedMock()
        getIsReversedUseCaseMock.executeWithAlignmentReturnValue = self.expectedIsReversed

        let getLayoutUseCaseMock = ChipGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getTitleFontUseCaseMock = ChipGetTitleFontUseCaseableGeneratedMock()
        getTitleFontUseCaseMock.executeWithThemeReturnValue = self.expectedTitleFont

        let viewModel = ChipUIViewModel(
            theme: self.givenTheme,
            getColorsUseCase: getColorsUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getIsReversedUseCase: getIsReversedUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getTitleFontUseCase: getTitleFontUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getBorderUseCaseMock: getBorderUseCaseMock,
            getDimUseCaseMock: getDimUseCaseMock,
            getIsReversedUseCaseMock: getIsReversedUseCaseMock,
            getLayoutUseCaseMock: getLayoutUseCaseMock,
            getTitleFontUseCaseMock: getTitleFontUseCaseMock
        )
    }
}

// MARK: - XCT Helpers

private func XCTAssertNotCalled(
    on stub: Stub,
    getBorderUseCase getBorderUseCaseNotCalled: Bool = false,
    getColorsUseCase getColorsUseCaseNotCalled: Bool = false,
    getDimUseCase getDimUseCaseNotCalled: Bool = false,
    getIsReversedUseCase getIsReversedUseCaseNotCalled: Bool = false,
    getLayoutUseCase getLayoutUseCaseNotCalled: Bool = false,
    getTitleFontUseCase getTitleFontUseCaseNotCalled: Bool = false
) {
    ChipGetBorderUseCaseableMockTest.XCTCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndVariantCalled: !getBorderUseCaseNotCalled
    )

    ChipGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentAndVariantAndIsSelectedAndIsPressedCalled: !getColorsUseCaseNotCalled
    )

    ChipGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCaseNotCalled
    )

    ChipGetIsReversedUseCaseableMockTest.XCTCalled(
        stub.getIsReversedUseCaseMock,
        executeWithAlignmentCalled: !getIsReversedUseCaseNotCalled
    )

    ChipGetLayoutUseCaseableMockTest.XCTCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCaseNotCalled
    )

    ChipGetTitleFontUseCaseableMockTest.XCTCalled(
        stub.getTitleFontUseCaseMock,
        executeWithThemeCalled: !getTitleFontUseCaseNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherBorder: ChipBorder? = nil,
    otherColors: ChipColors? = nil,
    otherDim: CGFloat? = nil,
    otherIsReversed: Bool? = nil,
    otherLayout: ChipLayout? = nil,
    otherTitleFont: (any TypographyFontToken)? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.border,
        otherBorder ?? stub.expectedBorder,
        "Wrong border value"
    )
    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )
    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )
    XCTAssertEqual(
        viewModel.isReversed,
        otherIsReversed ?? stub.expectedIsReversed,
        "Wrong isReversed value"
    )
    XCTAssertEqual(
        viewModel.layout,
        otherLayout ?? stub.expectedLayout,
        "Wrong layout value"
    )
    XCTAssertTrue(
        viewModel.titleFont.equals(otherTitleFont ?? stub.expectedTitleFont),
        "Wrong titleFont value"
    )
}
