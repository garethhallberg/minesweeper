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
    
    
    init() {
        
        movesTaken = 0
    }
    
    
    
    func getMovesTaken() -> Int
    {
        return movesTaken
    }
    
    func didMove()
    {
        movesTaken += 1
    }
    
    
}
