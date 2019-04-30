//
//  ValidateMove.swift
//  Minesweep
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation

class ValidateMove
{
    func checkMoveIsValid(board: GameBoard, direction: Direction, playerPosition: [Int]) -> Valid
    {
        if direction == .down {
            if playerPosition[0] == 0
            {
                return Valid(valid: false, explanation: "You cannot move down when you are on the bottom row of the board")
            }
        }
        
        if direction == .left {
            
            if playerPosition[1] % board.getBoardWidth() == 0
            {
                return Valid(valid: false, explanation: "You cannot move left when you are on the left column of the board")
            }
            
        }
        
        if direction == .right {
            
            if playerPosition[1] % board.getBoardWidth() == board.getBoardWidth() - 1
            {
                return Valid(valid: false, explanation: "You cannot move right when you are on the right column of the board")
            }
            
        }
        
        return Valid(valid: true, explanation: nil)
    }
    
    
    
}
