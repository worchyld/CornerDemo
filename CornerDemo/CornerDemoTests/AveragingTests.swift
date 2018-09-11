//
//  AveragingTests.swift
//  CornerDemoTests
//
//  Created by Amarjit on 11/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import XCTest

@testable import CornerDemo

class AveragingTests: XCTestCase {
    
    var roundData : RoundData!

    override func setUp() {
        super.setUp()
        self.roundData = RoundData.init()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCSVLoad() {
        // Expect 82 rows
        XCTAssertTrue(self.roundData.rounds.count == 82, "\(self.roundData.rounds.count)")
    }

    func testAverage() {
        let avg = CalculateAverage(rounds: self.roundData.rounds)
        print (avg.speed)
        print (avg.power)
    }
    
    
}
