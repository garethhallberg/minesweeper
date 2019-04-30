//
//  InputValidatorUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class InputValidatorUnitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testValidInputUpTrue()
    {
        
        let validInput = InputValidator().verifyInputIsValid(input: "up")
        
        XCTAssert(validInput.isValid == true)
    }
    
    func testValidInputDownTrue()
    {
        
        let validInput = InputValidator().verifyInputIsValid(input: "down")
        
        XCTAssert(validInput.isValid == true)
    }
    
    func testValidInputLeftTrue()
    {
        
        let validInput = InputValidator().verifyInputIsValid(input: "left")
        
        XCTAssert(validInput.isValid == true)
    }
    
    func testValidInputRightTrue()
    {
        
        let validInput = InputValidator().verifyInputIsValid(input: "right")
        
        XCTAssert(validInput.isValid == true)
    }
    
    func testValidInputFalse()
    {
        
        let validInput = InputValidator().verifyInputIsValid(input: "aa")
        
        XCTAssert(validInput.isValid == false)
    }
    
    
    
    func testValidInputExplanationWithIncorrectCharacters()
    {
        
        let invalidInput = InputValidator().verifyInputIsValid(input: "b")
        
        XCTAssert(invalidInput.invalidExplanation == "The input should be either \"up\", \"down\", \"left\", or \"right\"")
    }

}
