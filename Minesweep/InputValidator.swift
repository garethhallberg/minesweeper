//
//  InputValidator.swift
//  Minesweep
//
//  Created by gareth15 on 30/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation

class InputValidator
{
    
    
    func verifyInputIsValid(input: String) -> Valid
    {
        if input == "up" || input == "left" || input == "down" || input == "right"
        {
            return Valid(valid: true, explanation: nil)
        }
        
        return Valid(valid: false, explanation: "The input should be either \"up\", \"down\", \"left\", or \"right\"")
    }
    
    
}
