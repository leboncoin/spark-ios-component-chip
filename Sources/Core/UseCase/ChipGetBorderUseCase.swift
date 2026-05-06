//
//  ChipGetBorderUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        variant: ChipVariant,
        removeShapeFeatureToggle: Bool
    ) -> ChipBorder
}

final class ChipGetBorderUseCase: ChipGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        variant: ChipVariant,
        removeShapeFeatureToggle: Bool
    ) -> ChipBorder {
        let border = theme.border

        return .init(
            width: border.width.small,
            radius: removeShapeFeatureToggle ? border.radius.full : border.radius.medium,
            dash: variant == .dashed ? ChipConstants.dashLength : .zero
        )
    }
}
