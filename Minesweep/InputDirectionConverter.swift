//
//  InputDirectionConverter.swift
//  Minesweep
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation


class InputDirectionConverter
{
    func convertInputToDirection(input: String) -> Direction
    {
        if input == "up" {
            return Direction.up
        }
        
        if input == "left" {
            return Direction.left
        }
        
        if input == "right" {
            return Direction.right
        }
        
        return Direction.down
    }
}
