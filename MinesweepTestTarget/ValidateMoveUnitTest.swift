//
//  ValidateMoveUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class ValidateMoveUnitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCannotDoDownMoveWhenStarting() {
        let board = GameBoard(width: 8, height: 8)
        let direction = Direction.down
        let playerPosition = [0, 1]
        let valid = ValidateMove().checkMoveIsValid(board: board, direction: direction, playerPosition: playerPosition)
        XCTAssert(valid.isValid == false)
        
    }
    
    func testCannotDoLeftMoveWhenAtLeftOfBoard() {
        let board = GameBoard(width: 8, height: 8)
        let direction = Direction.left
        let playerPosition = [1, 0]
        let valid = ValidateMove().checkMoveIsValid(board: board, direction: direction, playerPosition: playerPosition)
        XCTAssert(valid.isValid == false)
    }
    
    func testCannotDoRightMoveWhenAtLeftOfBoard() {
        let board = GameBoard(width: 8, height: 8)
        let direction = Direction.right
        let playerPosition = [1, 7]
        let valid = ValidateMove().checkMoveIsValid(board: board, direction: direction, playerPosition: playerPosition)
        XCTAssert(valid.isValid == false)
    }

}
