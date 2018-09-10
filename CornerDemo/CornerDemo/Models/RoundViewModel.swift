//
//  RoundViewModel.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation

// ViewModel for page
struct RoundViewModel {
    var pageTitle: String
    var roundData: RoundData
    var roundNumber: Int

    init(withRound round:Int = 1) {
        self.roundNumber = round
        self.pageTitle = NSLocalizedString("pageTitle", tableName: nil, bundle: Bundle.main, value: "Round \(roundNumber)", comment: "Page title")
        self.roundData = RoundData()
    }
}
