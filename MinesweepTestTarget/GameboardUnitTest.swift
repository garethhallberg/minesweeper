//
//  GameboardUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class GameboardUnitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateGameWithNoParametersHas80Tiles()
    {
        let game = MinesweepGame()
        
        XCTAssert(game.board!.tileArray.count == 80)
    }

}
