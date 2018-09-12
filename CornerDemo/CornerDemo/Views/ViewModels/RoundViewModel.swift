//
//  RoundViewModel.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

struct PunchModel : CustomStringConvertible {
    struct LeftHand  : CustomStringConvertible {
        var jab: Int = 0
        var hook: Int = 0
        var uppercut: Int = 0

        var description: String {
            return ("Jab - \(jab), Hook - \(hook), Uppercut - \(uppercut)")
        }
    }
    struct RightHand : CustomStringConvertible {
        var cross: Int = 0
        var hook: Int = 0
        var uppercut: Int = 0

        var description: String {
            return ("Jab - \(cross), Hook - \(hook), Uppercut - \(uppercut)")
        }
    }

    var left: LeftHand!
    var right: RightHand!

    var description: String {
        return ("Left: \(self.left.description),\n Right: \(self.right.description)")
    }
}

// ViewModel for page
class RoundViewModel {
    var pageTitle: String
    var rounds : [FightRound]!
    var roundNumber: Int = 0
    var punch: PunchModel!

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

    let maxProgress: Float = 20
    

    // MARK: Main functions

    init() {
        self.roundNumber += 1
        self.pageTitle = NSLocalizedString("pageTitle", tableName: nil, bundle: Bundle.main, value: "Round \(roundNumber)", comment: "Page title")

        loadCSV()
        print (self.punch.description)
    }

    func find(punch_type_id: Int) -> [FightRound] {
        let results = self.rounds.filter { (fr: FightRound) -> Bool in
            return (fr.punch_type_id == punch_type_id)
        }
        return results
    }


    // MARK: (Private) functions
    private func loadCSV() {
        CSVLoader.parseCSV { (completed: Bool, rounds:[FightRound]) -> Void in
            if (completed) {
                self.rounds = rounds
                self.preparePunchModel()
            }
            else {
                assertionFailure("Could not complete handler")
            }
        }
    }

    private func preparePunchModel() {
        var left = PunchModel.LeftHand()
        left.jab = self.find(punch_type_id: PunchType.leftJab.rawValue).count
        left.hook = self.find(punch_type_id: PunchType.leftHook.rawValue).count
        left.uppercut = self.find(punch_type_id: PunchType.leftUppercut.rawValue).count

        var right = PunchModel.RightHand()
        right.cross = self.find(punch_type_id: PunchType.rightCross.rawValue).count
        right.hook = self.find(punch_type_id: PunchType.rightHook.rawValue).count
        right.uppercut = self.find(punch_type_id: PunchType.rightUpperCut.rawValue).count

        self.punch = PunchModel.init(left: left, right: right)

        //print (self.punch.description)
    }

}
