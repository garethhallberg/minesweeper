//
//  Moves.swift
//  Minesweep
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation


class Moves
{
    private var movesTaken: Int
    private var movesLeft: Int
    
    init(moves: Int) {
        movesLeft = moves
        movesTaken = 0
    }
    
    func getMovesLeft() -> Int
    {
        return movesLeft
    }
    
    func getMovesTaken() -> Int
    {
        return movesTaken
    }
    
    func didMove()
    {
        movesLeft -= 1
        movesTaken += 1
    }
    
    
}
