//
//  ChipUIViewModel.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 24/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkTheming

/// ViewModel only used by **UIKit** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: titleFont = "Identical"
final internal class ChipUIViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = ChipColors()
    @Published private(set) var border = ChipBorder()
    @Published private(set) var dim: CGFloat = 0
    @Published private(set) var isReversed: Bool = false
    @Published private(set) var layout = ChipLayout()
    @Published private(set) var titleFont: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var theme: any Theme {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
            self.setDim()
            self.setSpacing()
            self.setTitleFont()
        }
    }

    var alignment: ChipAlignment = .default {
        didSet {
            guard oldValue != self.alignment, self.alreadyUpdateAll else { return }

            self.setIsReversed()
        }
    }

    var intent: ChipIntent = .default {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var variant: ChipVariant = .default {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
        }
    }

    var isSelected: Bool = false {
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

    var isEnabled: Bool = true {
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
        theme: any Theme,
        getColorsUseCase: any ChipGetColorsUseCaseable = ChipGetColorsUseCase(),
        getBorderUseCase: any ChipGetBorderUseCaseable = ChipGetBorderUseCase(),
        getDimUseCase: any ChipGetDimUseCaseable = ChipGetDimUseCase(),
        getIsReversedUseCase: any ChipGetIsReversedUseCaseable = ChipGetIsReversedUseCase(),
        getLayoutUseCase: any ChipGetLayoutUseCaseable = ChipGetLayoutUseCase(),
        getTitleFontUseCase: any ChipGetTitleFontUseCaseable = ChipGetTitleFontUseCase()
    ) {
        self.theme = theme

        self.getColorsUseCase = getColorsUseCase
        self.getBorderUseCase = getBorderUseCase
        self.getDimUseCase = getDimUseCase
        self.getIsReversedUseCase = getIsReversedUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getTitleFontUseCase = getTitleFontUseCase
    }

    // MARK: - Load

    func load() {
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
        self.colors = self.getColorsUseCase.execute(
            theme: self.theme,
            intent: self.intent,
            variant: self.variant,
            isSelected: self.isSelected,
            isPressed: self.isPressed
        )
    }

    private func setBorder() {
        self.border = self.getBorderUseCase.execute(
            theme: self.theme,
            variant: self.variant
        )
    }

    private func setDim() {
        self.dim = self.getDimUseCase.execute(
            theme: self.theme,
            isEnabled: self.isEnabled
        )
    }

    private func setIsReversed() {
        self.isReversed = self.getIsReversedUseCase.execute(
            alignment: self.alignment
        )
    }

    private func setSpacing() {
        self.layout = self.getLayoutUseCase.execute(
            theme: self.theme
        )
    }

    private func setTitleFont() {
        self.titleFont = self.getTitleFontUseCase.execute(
            theme: self.theme
        )
    }
}
