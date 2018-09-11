//
//  Round.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

protocol FightRoundProtocol {
    var ts: TimeInterval { get }
    var punch_type_id : Int { get }
    var speed : Double { get }
    var power : Double { get }
}

struct FightRound : CustomStringConvertible, FightRoundProtocol {
    public private (set) var ts: TimeInterval
    public private (set) var punch_type_id: Int
    public private (set) var speed: Double
    public private (set) var power: Double

    init(ts: TimeInterval, punch_type_id: Int, speed: Double, power: Double) {
        self.ts = ts
        self.punch_type_id = punch_type_id
        self.speed = speed
        self.power = power
    }
}

extension FightRound {
    var description: String {
        return ("Round: \(String(describing: ts)), \(punch_type_id), \(speed), \(power)\n")
    }
}
