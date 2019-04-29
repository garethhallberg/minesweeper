//
//  MovesUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class MovesUnitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMovesMovesLeft(){
        let moves = Moves(moves: 20)
        XCTAssert(moves.getMovesLeft() == 20)
    }
    
    
    func testMovesMovesLeftAfterInitWith20AndUse2Equals18(){
        let moves = Moves(moves: 20)
        moves.didMove()
        moves.didMove()
        XCTAssert(moves.getMovesLeft() == 18)
    }
    
    func testMovesMovesLeftAfterInitWith20AndUse2NotEquals10(){
        let moves = Moves(moves: 20)
        moves.didMove()
        moves.didMove()
        XCTAssert(moves.getMovesLeft() != 10)
    }
    
    func testMovesMovesTakenAfterInitAnd3Moves(){
        let moves = Moves(moves: 20)
        moves.didMove()
        moves.didMove()
        moves.didMove()
        XCTAssert(moves.getMovesTaken() == 3)
    }

}
