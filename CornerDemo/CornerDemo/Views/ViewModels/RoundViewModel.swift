//
//  RoundViewModel.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

// ViewModel for page
class RoundViewModel {
    var pageTitle: String
    var rounds : [FightRound]!
    var roundNumber: Int = 0

    lazy var punches : Int = {
        return self.rounds.count
    }()

    lazy var power : Double = {
        let powerTotal = self.rounds.reduce(0) {
            $0 + ($1.power)
        }
        if ((powerTotal == 0) || (self.rounds.count == 0)) {
            return 0
        }
        return (powerTotal / Double(rounds.count))
    }()

    lazy var speed : Double = {
        let speedTotal = self.rounds.reduce(0) {
            $0 + ($1.speed)
        }
        if ((speedTotal == 0) || (self.rounds.count == 0)) {
            return 0
        }
        return (speedTotal / Double(rounds.count))
    }()

    func find(punch_type_id: Int) -> [FightRound] {
        let results = self.rounds.filter { (fr: FightRound) -> Bool in
            return (fr.punch_type_id == punch_type_id)
        }
        return results
    }

    init() {
        self.roundNumber += 1
        self.pageTitle = NSLocalizedString("pageTitle", tableName: nil, bundle: Bundle.main, value: "Round \(roundNumber)", comment: "Page title")

        loadCSV()
    }

    private func loadCSV() {
        CSVLoader.parseCSV { (completed: Bool, rounds:[FightRound]) -> Void in
            if (completed) {
                self.rounds = rounds
            }
            else {
                assertionFailure("Could not complete handler")
            }
        }
    }

}
