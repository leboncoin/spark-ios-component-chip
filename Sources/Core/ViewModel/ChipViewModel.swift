//
//  ChipViewModel.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 24/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming

/// ViewModel only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: titleFont = "Identical"
final internal class ChipViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = ChipColors()
    @Published private(set) var border = ChipBorder()
    @Published private(set) var dim: CGFloat = 0
    @Published private(set) var isReversed: Bool = false
    @Published private(set) var layout = ChipLayout()
    @Published private(set) var titleFont: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
            self.setDim()
            self.setSpacing()
            self.setTitleFont()
        }
    }

    var alignment: ChipAlignment? {
        didSet {
            guard oldValue != self.alignment, self.alreadyUpdateAll else { return }

            self.setIsReversed()
        }
    }

    var intent: ChipIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var variant: ChipVariant? {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
        }
    }

    var isSelected: Bool? {
        didSet {
            guard oldValue != self.isSelected, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var isPressed: Bool = false {
        didSet {
            guard oldValue != self.isPressed, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    // MARK: - Use Case Properties

    private let getColorsUseCase: any ChipGetColorsUseCaseable
    private let getBorderUseCase: any ChipGetBorderUseCaseable
    private let getDimUseCase: any ChipGetDimUseCaseable
    private let getIsReversedUseCase: any ChipGetIsReversedUseCaseable
    private let getLayoutUseCase: any ChipGetLayoutUseCaseable
    private let getTitleFontUseCase: any ChipGetTitleFontUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any ChipGetColorsUseCaseable = ChipGetColorsUseCase(),
        getBorderUseCase: any ChipGetBorderUseCaseable = ChipGetBorderUseCase(),
        getDimUseCase: any ChipGetDimUseCaseable = ChipGetDimUseCase(),
        getIsReversedUseCase: any ChipGetIsReversedUseCaseable = ChipGetIsReversedUseCase(),
        getLayoutUseCase: any ChipGetLayoutUseCaseable = ChipGetLayoutUseCase(),
        getTitleFontUseCase: any ChipGetTitleFontUseCaseable = ChipGetTitleFontUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getBorderUseCase = getBorderUseCase
        self.getDimUseCase = getDimUseCase
        self.getIsReversedUseCase = getIsReversedUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getTitleFontUseCase = getTitleFontUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        alignment: ChipAlignment,
        intent: ChipIntent,
        variant: ChipVariant,
        isSelected: Bool,
        isEnabled: Bool
    ) {
        self.theme = theme
        self.alignment = alignment
        self.intent = intent
        self.variant = variant
        self.isSelected = isSelected
        self.isEnabled = isEnabled

        self.setColors()
        self.setBorder()
        self.setDim()
        self.setIsReversed()
        self.setSpacing()
        self.setTitleFont()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme,
              let intent,
              let variant,
              let isSelected else {
            return
        }

        self.colors = getColorsUseCase.execute(
            theme: theme,
            intent: intent,
            variant: variant,
            isSelected: isSelected,
            isPressed: self.isPressed
        )
    }

    private func setBorder() {
        guard let theme, let variant else { return }

        self.border = getBorderUseCase.execute(
            theme: theme,
            variant: variant
        )
    }

    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }

    private func setIsReversed() {
        guard let alignment else { return }

        self.isReversed = self.getIsReversedUseCase.execute(
            alignment: alignment
        )
    }

    private func setSpacing() {
        guard let theme else { return }

        self.layout = getLayoutUseCase.execute(
            theme: theme
        )
    }

    private func setTitleFont() {
        guard let theme else { return }

        self.titleFont = getTitleFontUseCase.execute(
            theme: theme
        )
    }
}
