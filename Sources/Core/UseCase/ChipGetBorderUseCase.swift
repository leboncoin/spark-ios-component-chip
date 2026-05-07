//
//  ChipGetBorderUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        variant: ChipVariant
    ) -> ChipBorder
}

final class ChipGetBorderUseCase: ChipGetBorderUseCaseable {

    // MARK: - Properties

    private let featureTogglesService: any SparkFeatureToggleServicing

    // MARK: - Initialization

    init(featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared) {
        self.featureTogglesService = featureTogglesService
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        variant: ChipVariant
    ) -> ChipBorder {
        let border = theme.border

        return .init(
            width: border.width.small,
            radius: self.featureTogglesService.rebranding ? border.radius.full : border.radius.medium,
            dash: variant == .dashed ? ChipConstants.dashLength : .zero
        )
    }
}
