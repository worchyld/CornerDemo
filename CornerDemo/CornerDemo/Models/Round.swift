//
//  Round.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

struct Round : CustomStringConvertible {
    let ts: TimeInterval
    let punch_type_id: Int
    let speed: Double // in mph
    let power: Double // in g

    init(ts: TimeInterval, punch_type_id: Int, speed: Double, power: Double) {
        self.ts = ts
        self.punch_type_id = punch_type_id
        self.speed = speed
        self.power = power
    }
}

extension Round {
    var description: String {
        return ("Round: \(ts), \(punch_type_id), \(speed), \(power)")
    }
}
