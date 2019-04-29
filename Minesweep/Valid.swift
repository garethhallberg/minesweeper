//
//  Valid.swift
//  Minesweep
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation

class Valid {
    var isValid: Bool
    var invalidExplanation: String?
    
    init(valid: Bool, explanation: String?) {
        isValid = valid
        invalidExplanation = explanation
    }
    
    
    
}
