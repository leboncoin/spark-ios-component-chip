//
//  ChipGetLayoutUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> ChipLayout
}

final class ChipGetLayoutUseCase: ChipGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> ChipLayout {
        return .init(
            spacing: theme.layout.spacing.medium,
            subSpacing: theme.layout.spacing.small,
            padding: theme.layout.spacing.medium
        )
    }
}
