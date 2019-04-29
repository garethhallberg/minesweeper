//
//  LivesUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class LivesUnitTest: XCTestCase {
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLivesLeftAfterInit20And2DeathsTrue(){
        let lives = Lives(lives: 20)
        lives.didDie()
        lives.didDie()
        
        XCTAssert(lives.getLivesLeft() == 18)
    }
    
    func testLivesLeftAfterInit20And2DeathsFalse(){
        let lives = Lives(lives: 20)
        lives.didDie()
        lives.didDie()
        
        XCTAssert(lives.getLivesLeft() != 6)
    }

}
