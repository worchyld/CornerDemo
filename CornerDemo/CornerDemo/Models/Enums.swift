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

/* Left hand punches: 0 - Jab, 1 - Hook, 2 - Uppercut */
/* Right hand punches: 3 - Cross, 4 - Hook, 5 - Uppercut */

enum HandError : Error {
    case unknownPunchType
}

public struct Hand {
    struct Left {
        enum Punch : Int {
            case jab = 0
            case hook = 1
            case uppercut = 2
        }
    }
    struct Right {
        enum Punch : Int {
            case cross = 3
            case hook = 4
            case uppercut = 5
        }
    }

    
}
