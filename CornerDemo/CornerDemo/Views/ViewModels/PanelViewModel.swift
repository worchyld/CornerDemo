//
//  PanelViewModel.swift
//  CornerDemo
//
//  Created by Amarjit on 11/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

struct PanelViewModel {
    let title: String
    private let number: Double
    public var formattedNumber: String? {
        return "99.9"
    }
    let unit: UnitSpeed?

    let showUnit: Bool
    let change: Int

    init(title: String, number: Double, unit: UnitSpeed?, change: Int = 0) {
        self.title = title
        self.number = number
        self.unit = unit

        if let _ = self.unit {
            showUnit = true
        }
        else {
            showUnit = false
        }
        self.change = change
    }
}
