//
//  ObjectCache.swift
//  CornerDemo
//
//  Created by Amarjit on 10/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

struct ObjectCache {

    static let dateComponentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second, .nanosecond ]
        formatter.zeroFormattingBehavior = [ .pad ]
        //let formatted = formatter.string(from: ts)
        return formatter
    }()


    static let currencyRateFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.alwaysShowsDecimalSeparator = false
        return numberFormatter
    }()


}