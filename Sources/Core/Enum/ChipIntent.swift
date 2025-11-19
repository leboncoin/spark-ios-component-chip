//
//  ChipIntentColor.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 02.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The various intent color a chip may have.
public enum ChipIntent: CaseIterable {
    case accent
    case alert
    case basic
    case danger
    case info
    case main
    case neutral
    case success
    case support
    case surface

    // MARK: - Properties

    /// The default case. Equals to **.basic**.
    public static var `default`: Self = .basic
}
