//
//  Lives.swift
//  Minesweep
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation


class Lives
{
    private var livesLeft: Int
    
    init(lives: Int)
    {
        livesLeft = lives
    }
    
    func getLivesLeft() -> Int
    {
        return livesLeft
    }
    
    func didDie()
    {
        livesLeft -= 1
    }
    
    
}
