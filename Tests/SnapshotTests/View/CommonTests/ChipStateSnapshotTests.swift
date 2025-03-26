//
//  ChipStateSnapshotTests.swift
//  SparkChipSnapshotTests
//
//  Created by michael.zimmermann on 26.10.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@testable import SparkChip

extension ChipState {
    static let all: [ChipState] =
    [
        .init(isEnabled: true, isPressed: false, isSelected: true),
        .init(isEnabled: false, isPressed: false, isSelected: true),
        .init(isEnabled: false, isPressed: false, isSelected: false),
    ]
}
