//
//  Tile.swift
//  Minesweep
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation

class Tile
{
    private var hasMineInTile: Bool
    
    init(hasMine: Bool) {
        hasMineInTile = hasMine
    }
    
    func hasMine() -> Bool {
        return hasMineInTile
    }
    
    func mineHasBeenHit()
    {
        hasMineInTile = false
    }
}


class TileFactory
{
    func createTile() -> Tile
    {
        return Tile(hasMine: shouldHaveMine())
    }
    
    
    private func shouldHaveMine() -> Bool
    {
        let randomNumber = Int.random(in: 0 ..< 4)
        if randomNumber == 3
        {
            return true
        }
         return false
    }
    
}
