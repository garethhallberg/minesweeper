//
//  MinesweepGameUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class MinesweepGameUnitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testSetupPlayerPosition()
    {
        let game = MinesweepGame()
        let playerPosition = game.playerPosition
        
        XCTAssert(playerPosition != [4,4])
    }
    
    
    

}
