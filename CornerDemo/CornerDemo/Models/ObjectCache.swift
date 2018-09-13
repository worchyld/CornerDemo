//
//  ObjectCache.swift
//  CornerDemo
//
//  Created by Amarjit on 10/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

struct ObjectCache {

    static let stopWatchFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.calendar = Calendar.current
        formatter.allowsFractionalUnits = true
        formatter.allowedUnits = [ .minute, .second, .nanosecond ]
        formatter.zeroFormattingBehavior = [ .pad ]
        return formatter
    }()

    static let formattedNumber: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.alwaysShowsDecimalSeparator = false
        return numberFormatter
    }()


}
