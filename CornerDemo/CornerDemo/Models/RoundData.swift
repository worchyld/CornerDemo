//
//  Rounds.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

class RoundData {
    static var instance = RoundData()

    var rounds: [Round]?
    var fightState: FightState = .rest

    init() {
        // pre-load rounds from CSV
    }
}
