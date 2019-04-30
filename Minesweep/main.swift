//
//  main.swift
//  Minesweep
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation





print("Hello and welcome to Swift Minesweep!")



let game = MinesweepGame(width: 8, height: 8, lives: 3)
var done = false
print("Avoid the mines. Type up, down, right or left to move.")
while(done != true)
{
    
    let input = readLine()
    if let input = input
    {
        game.doMove(input: input)
    }
    
    done = game.hasGameEnded()
    
}



