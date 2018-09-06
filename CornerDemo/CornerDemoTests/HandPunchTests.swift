//
//  HandPunchTests.swift
//  CornerDemoTests
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import XCTest

@testable import CornerDemo

class HandPunchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPunchType() {
        // if punch_type_id = 0, expect left hook
        let punch_type_id = 0
        XCTAssertEqual(PunchType(rawValue: punch_type_id), PunchType.leftJab)
    }

    func testLeftHooks() {
        // Expect 3 left jabs to be found
        let punches = [0,0,0,1]

        let results = (punches.filter({ (i: Int) -> Bool in
            return (i == PunchType.leftJab.rawValue)
        }).count)

        XCTAssertTrue(results == 3)
    }
    
}
