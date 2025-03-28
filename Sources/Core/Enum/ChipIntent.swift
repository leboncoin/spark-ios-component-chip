//
//  ChipIntentColor.swift
//  SparkChip
//
//  Created by michael.zimmermann on 02.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The various intent color a chip may have.
public enum ChipIntent: CaseIterable {
    case main
    case support
    case surface
    case success
    case danger
    case alert
    case neutral
    case info
    case accent
    case basic
}
