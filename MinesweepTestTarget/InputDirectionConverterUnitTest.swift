//
//  InputDirectionConverterUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class InputDirectionConverterUnitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertInputToDirectionUp() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let direction = InputDirectionConverter().convertInputToDirection(input: "up")
        
        XCTAssert(direction == .up)
    }
    
    func testConvertInputToDirectionDown() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let direction = InputDirectionConverter().convertInputToDirection(input: "down")
        
        XCTAssert(direction == .down)
    }
    
    func testConvertInputToDirectionLeft() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let direction = InputDirectionConverter().convertInputToDirection(input: "left")
        
        XCTAssert(direction == .left)
    }
    
    func testConvertInputToDirectionRight() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let direction = InputDirectionConverter().convertInputToDirection(input: "right")
        
        XCTAssert(direction == .right)
    }

    

}
