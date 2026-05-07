//
//  ChipGetLayoutUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, alignment: ChipAlignment) -> ChipLayout
}

final class ChipGetLayoutUseCase: ChipGetLayoutUseCaseable {

    // MARK: - Properties

    private let featureTogglesService: any SparkFeatureToggleServicing

    // MARK: - Initialization

    init(featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared) {
        self.featureTogglesService = featureTogglesService
    }

    // MARK: - Methods

    func execute(theme: any Theme, alignment: ChipAlignment) -> ChipLayout {
        let spacings = theme.layout.spacing

        let spacing = switch alignment {
        case .leadingIcon: spacings.small
        case .trailingIcon: spacings.medium
        }

        let padding = self.featureTogglesService.rebranding ? spacings.large : spacings.medium

        return .init(
            spacing: spacing,
            extraContentSpacing: spacings.medium,
            padding: padding
        )
    }
}
