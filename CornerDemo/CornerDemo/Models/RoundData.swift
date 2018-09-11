//
//  Rounds.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation
import CSV

extension TimeInterval {
    public static func parseDuration(_ timeString:String) -> TimeInterval {
        guard !timeString.isEmpty else {
            return 0
        }

        var interval:Double = 0

        let parts = timeString.components(separatedBy: ":")
        for (index, part) in parts.reversed().enumerated() {
            interval += (Double(part) ?? 0) * pow(Double(60), Double(index))
        }

        return interval
    }
}

class RoundData {

    public private(set) var rounds : [FightRound]!

    init() {
        loadCSV { (completed: Bool, rounds:[FightRound]) -> Void in
            if (completed) {
                print ("Completed handler")
                self.rounds = rounds
            }
            else {
                assertionFailure("Could not complete handler")
            }
        }
    }

    private func loadCSV(completionHandler:@escaping (_ success:Bool, _ rounds:[FightRound] ) -> Void) {
        // pre-load rounds from CSV

        guard let filepath = Bundle.main.path(forResource: "Round1", ofType: "csv") else {
            print ("no filepath found")
            return
        }

        let stream = InputStream(fileAtPath: filepath)!
        let csv = try! CSVReader(stream: stream, hasHeaderRow: true, trimFields: true, delimiter: ",", whitespaces: NSCharacterSet.whitespaces)

        var rounds: [FightRound] = [FightRound]()

        while csv.next() != nil {

            guard let ts = csv["ts"] else {
                return
            }
            guard let str_punch_type_id = (csv["punch_type_id"]) else {
                return
            }
            guard let str_speed_mph = (csv["speed_mph"]) else {
                return
            }
            guard let str_power_g = (csv["power_g"]) else {
                return
            }

            let tsInterval : TimeInterval = TimeInterval.parseDuration(ts)

            let punch_type_id:Int = (Int(str_punch_type_id))!
            let speed : Double = (Double(str_speed_mph))!
            let power : Double = (Double(str_power_g))!

            //  Add round
            rounds.append( FightRound(ts: tsInterval, punch_type_id: punch_type_id, speed: speed, power: power) )
        }

        //print (rounds.description)

        completionHandler(true, rounds)
    }
}
