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

    
    func testCreateGameHas4Lives()
    {
        let game = MinesweepGame(width: 10, height: 10, lives: 4)
        
        XCTAssert(game.getLivesLeft() == 4)
    }
    
    
    func testValidInputTrue()
    {
        let game = MinesweepGame()
        let validInput = game.verifyInputIsValid(input: "up")
        
        XCTAssert(validInput.isValid == true)
    }
    
    func testValidInputFalse()
    {
        let game = MinesweepGame()
        let validInput = game.verifyInputIsValid(input: "aa")
        
        XCTAssert(validInput.isValid == false)
    }
    
    
    
    func testValidInputExplanationWithIncorrectCharacters()
    {
        let game = MinesweepGame()
        let invalidInput = game.verifyInputIsValid(input: "b")
        
        XCTAssert(invalidInput.invalidExplanation == "The input should be either \"up\", \"down\", \"left\", or \"right\"")
    }
    
    func testSetupPlayerPosition()
    {
        let game = MinesweepGame()
        let playerPosition = game.playerPosition
        
        XCTAssert(playerPosition != [4,4])
    }
    
    func testCannotDoDownMoveWhenStarting() {
        let game = MinesweepGame()
        let direction = Direction.down
        let playerPosition = [0, 1]
        let valid = game.checkMoveIsValid(direction: direction, playerPosition: playerPosition)
        XCTAssert(valid.isValid == false)
        
    }
    
    func testCannotDoLeftMoveWhenAtLeftOfBoard() {
        let game = MinesweepGame()
        let direction = Direction.left
        let playerPosition = [1, 0]
        let valid = game.checkMoveIsValid(direction: direction, playerPosition: playerPosition)
        XCTAssert(valid.isValid == false)
    }
    
    func testCannotDoRightMoveWhenAtLeftOfBoard() {
        let game = MinesweepGame()
        let direction = Direction.right
        let playerPosition = [1, 7]
        let valid = game.checkMoveIsValid(direction: direction, playerPosition: playerPosition)
        XCTAssert(valid.isValid == false)
    }
    

}
