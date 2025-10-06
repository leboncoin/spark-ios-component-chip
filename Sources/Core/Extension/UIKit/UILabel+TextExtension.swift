//
//  UILabel+TextExtension.swift
//  SparkChip
//
//  Created by robin.lemaire on 01/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UILabel {

    func text(_ value: String?) {
        self.isHidden = value == nil
        self.attributedText = nil
        self.text = value
    }

    func attributedText(_ value: NSAttributedString?) {
        self.isHidden = value == nil
        self.text = nil
        self.attributedText = value
    }
}
