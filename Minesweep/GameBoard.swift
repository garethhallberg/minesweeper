//
//  Board.swift
//  Minesweep
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation


class GameBoard
{
    private var boardWidth = 8
    private var boardHeight = 8
    var tileArray = [Tile]()
//    private let tileFactory = TileFactory()
    
    init(width: Int, height: Int) {
        boardWidth = width
        boardHeight = height
        generateInitialTiles()
    }
    
    
    func checkIfTileHasMine(playerPosition: [Int]) -> Bool
    {
        let pos = playerPosition[0] * getBoardWidth() + playerPosition[1]

        let tile = tileArray[pos]
        let tileHasMine = tile.hasMine()
        if tileHasMine {
            tile.mineHasBeenHit()
            return true
        }
        
        return false
    }
    
    func getBoardHeight() -> Int
    {
        return boardHeight
    }
    
    func getBoardWidth() -> Int
    {
        return boardWidth
    }
    
    
    private func generateInitialTiles()
    {
        let max = boardWidth * boardHeight - 1
        for _ in 0...max {
            let tile = TileFactory().createTile()
            tileArray.append(tile)
        }
    }
    
    
    
}
