//
//  ChipIntentTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentChip

final class ChipIntentTests: XCTestCase {

    // MARK: - Tests

    func test_default_intent_is_support() {
        XCTAssertEqual(ChipIntent.default, .support)
    }
}
