//
//  CalculateHelper.swift
//  CornerDemo
//
//  Created by Amarjit on 11/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

struct CalculateAverage {
    private let rounds: [FightRound]
    public private (set) var speed : Double = 0
    let speedUnit : UnitSpeed = .mph

    public private (set) var power : Double = 0
    let powerUnit : UnitSpeed = .g

    init(rounds: [FightRound]) {
        self.rounds = rounds

        let speedTotal = self.rounds.reduce(0) {
            $0 + ($1.speed)
        }
        let powerTotal = self.rounds.reduce(0) {
            $0 + ($1.power)
        }
        guard speedTotal > 0 else {
            return
        }
        guard powerTotal > 0 else {
            return
        }
        guard rounds.count > 0 else {
            return
        }

        self.speed = (speedTotal / Double(rounds.count))
        self.power = (powerTotal / Double(rounds.count))
    }

}
