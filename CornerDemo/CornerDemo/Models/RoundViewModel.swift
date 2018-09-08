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
    var roundData: RoundData

    init() {
        self.pageTitle = NSLocalizedString("Round 2", comment: "Page title")
        self.roundData = RoundData()        
    }
}
