//
//  TileUnitTest.swift
//  MinesweepTestTarget
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import XCTest
@testable import Minesweep

class TileUnitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMyTileHasMineEqualsTrue() {
        let myTile = Tile(hasMine: true)
        let myTileHasMine = myTile.hasMine()
        XCTAssert(myTileHasMine == true, "The tile is a mine")
    }
    
    
    func testMyTileHasMineEqualsFalse() {
        let myTile = Tile(hasMine: false)
        let myTileHasMine = myTile.hasMine()
        XCTAssert(myTileHasMine == false, "The tile is not a mine")
    }
    
    func testMyTileHadAMineThatExpodedAndNowHasNoMineEqualsTrue() {
        let myTile = Tile(hasMine: true)
        myTile.mineHasBeenHit()
        let myTileHasMine = myTile.hasMine()
        XCTAssert(myTileHasMine == false, "The tile no longer has a mine")
    }

}
