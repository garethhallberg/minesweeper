//
//  MinesweepGame.swift
//  Minesweep
//
//  Created by gareth15 on 29/04/2019.
//  Copyright © 2019 gareth15. All rights reserved.
//

import Foundation


enum Direction
{
    case up
    case down
    case right
    case left
}


class MinesweepGame {
    
    
    private var moves: Moves?
    private var lives: Lives?
    var board: GameBoard?
    
    var playerPosition = [4,4]
//    var startingNumberOfLives = 2
//    var startingNumberOfMoves = 20

    
    
    init(width: Int = 8, height: Int = 10, lives: Int = 5) {
        board = GameBoard(width: width, height: height)
        moves = Moves()
        setupLives(numLives: lives)
        setupPlayerPosition()
        print("You are at position \(playerPosition) on the board")
    }
    
    
    
    func hasGameEnded() -> Bool
    {
        if hasPlayerWon()
        {
            print("Well done you have won. Your score was \(getMovesTaken())")
            return true
        }
        
        if getLivesLeft() <= 0 {
            print("You have run out of lives. Try again.")
            return true
        }
        
        
        return false
    }
    
    func hasPlayerWon() -> Bool
    {
        var hasWon = false
        
        if playerPosition[0] == board?.getBoardHeight()
        {
            hasWon = true
        }
    
        return hasWon
    }
    
    
    func doMove(input: String)
    {
        let validInput = verifyInputIsValid(input: input)
        
        if validInput.isValid == false
        {
            printInvalidExplanation(invalid: validInput)
            return
        }
        
        let direction = convertInputToDirection(input: input)
        let validMove = checkMoveIsValid(direction: direction, playerPosition: playerPosition)
        if validMove.isValid == false {
            printInvalidExplanation(invalid: validMove)
            return
        }
        
        
        if let board = board
        {
            if board.checkIfTileHasMine(playerPosition: playerPosition) == false
            {
                updatePlayerPosition(direction: direction)
            }
            else
            {
                playerHitsMine()
            }
        }
        
        
        moves?.didMove()
        print("You are at \(playerPosition). You have taken \(getMovesTaken()) moves. You have \(getLivesLeft()) lives left.")
    }
    
    
    
    func playerHitsMine()
    {
        lives?.didDie()
        print("You have hit a mine. You have lost one life and have \(getLivesLeft())")
    }
    
    
    func updatePlayerPosition(direction: Direction)
    {
        //in a swift switch statement we always need a default value so I've in this case its the left move
        switch direction {
        case .down:
            playerPosition[0] = playerPosition[0] - 1
        case .up:
            playerPosition[0] = playerPosition[0] + 1
        case .right:
            playerPosition[1] = playerPosition[1] + 1
        default:
            playerPosition[1] = playerPosition[1] - 1
        }
        
    }
    
    
    func printInvalidExplanation(invalid: Valid)
    {
        if let explanation = invalid.invalidExplanation
        {
            print(explanation)
        }
    }
    
    
    func setupPlayerPosition()
    {
        if let board = board
        {
            let randomXPosition = Int.random(in: 1 ... board.getBoardWidth())
            playerPosition = [0, randomXPosition]
        }
    }
    
    
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
    
    
    func checkMoveIsValid(direction: Direction, playerPosition: [Int]) -> Valid
    {
        if direction == .down {
            if playerPosition[0] == 0
            {
                return Valid(valid: false, explanation: "You cannot move down when you are on the bottom row of the board")
            }
        }
        
        if direction == .left {
            if let board = board
            {
                if playerPosition[1] % board.getBoardWidth() == 0
                {
                    return Valid(valid: false, explanation: "You cannot move left when you are on the left column of the board")
                }
            }
            
        }
        
        if direction == .right {
            if let board = board
            {
                if playerPosition[1] % board.getBoardWidth() == board.getBoardWidth() - 1
                {
                    return Valid(valid: false, explanation: "You cannot move right when you are on the right column of the board")
                }
            }
            
            
        }
        
        return Valid(valid: true, explanation: nil)
    }
    
    
    func verifyInputIsValid(input: String) -> Valid
    {
        if input == "up" || input == "left" || input == "down" || input == "right"
        {
            return Valid(valid: true, explanation: nil)
        }
        
        return Valid(valid: false, explanation: "The input should be either \"up\", \"down\", \"left\", or \"right\"")
    }
    
    
    func getLivesLeft() -> Int
    {
        if let lives = lives
        {
            return lives.getLivesLeft()
        }
        
        return 0
    }
    
    func getMovesTaken() -> Int
    {
        if let moves = moves
        {
            return moves.getMovesTaken()
        }
        return 0
    }
    
    
    private func setupLives(numLives: Int)
    {
        lives = Lives(lives: numLives)
    }
    
    
    
    
}
