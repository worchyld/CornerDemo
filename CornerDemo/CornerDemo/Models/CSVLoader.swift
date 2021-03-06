//
//  CSVLoader.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation
import CSV

class CSVLoader {

    public static func parseCSV(completionHandler:@escaping (_ success:Bool, _ punches:[Punch] ) -> Void) {
        // pre-load rounds from CSV

        guard let filepath = Bundle.main.path(forResource: "Round1", ofType: "csv") else {
            print ("no filepath found")
            return
        }

        let stream = InputStream(fileAtPath: filepath)!
        let csv = try! CSVReader(stream: stream, hasHeaderRow: true, trimFields: true, delimiter: ",", whitespaces: NSCharacterSet.whitespaces)

        var punches: [Punch] = [Punch]()

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
            //rounds.append( FightRound(ts: tsInterval, punch_type_id: punch_type_id, speed: speed, power: power) )
            punches.append( Punch(ts: tsInterval, punch_type_id: punch_type_id, speed: speed, power: power) )
        }

        //print (punches.description)

        completionHandler(true, punches)
    }
}
