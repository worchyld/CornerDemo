//
//  Enums.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

enum UnitSpeed : String {
    case mph
    case g
}

enum FightState : String {
    case rest
    case fight
}

struct Constants {
    public static let restTime : TimeInterval = 60.0 // 1 minute
    public static let fightTime : TimeInterval = 180.0 // 3 minutes
    public static let expectedPunches: Float = 8.33 // not used

    struct Colours {
        public static let bgColor = "#000000"
        public static let panelBGColor = "#0f0f14"
        public static let verticalLine = "#161619"
        public static let graphHighPeak = "#3bd500"
        public static let graphMidPeak = "#cba600"
        public static let graphLowPeak = "#c40000"
        public static let greenUpArrow = "#07d000"
        public static let orangeMinus = "#fbb12e"
        public static let green = "#23b731"
        public static let blue = "#1a98e5"
        public static let progressBarRed = "#e30000"
        public static let dullWhite = "#d6d6d7"
        public static let grayText = "#878787"
    }

    struct ImageName {
        public static let arrowUp = "arrow-up"
        public static let arrowDown = "arrow-down"
        public static let arrowUnchanged = "minus"
    }
}

/* Left hand punches: 0 - Jab, 1 - Hook, 2 - Uppercut */
/* Right hand punches: 3 - Cross, 4 - Hook, 5 - Uppercut */

enum HandError : Error {
    case unknownPunchType
}

enum PunchType : Int {
    case leftJab = 0
    case leftHook = 1
    case leftUppercut = 2
    case rightCross = 3
    case rightHook = 4
    case rightUpperCut = 5    
}




