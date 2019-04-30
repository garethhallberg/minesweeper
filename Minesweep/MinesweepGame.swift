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
        let validInput = InputValidator().verifyInputIsValid(input: input)
        
        if validInput.isValid == false
        {
            printInvalidExplanation(invalid: validInput)
            return
        }
        
        let direction = InputDirectionConverter().convertInputToDirection(input: input)
        
        
        if let board = board
        {
            let validMove = ValidateMove().checkMoveIsValid(board: board, direction: direction, playerPosition: playerPosition)
            if validMove.isValid == false {
                printInvalidExplanation(invalid: validMove)
                return
            }
        
        
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
    
    func setupPlayerPosition()
    {
        if let board = board
        {
            let maxValue = board.getBoardWidth() - 1
            let randomXPosition = Int.random(in: 1 ... maxValue)
            playerPosition = [0, randomXPosition]
        }
    }
    
    
    //MARK:- Private
    private func playerHitsMine()
    {
        lives?.didDie()
        print("You have hit a mine. You have lost one life and have \(getLivesLeft()) life left.")
    }
    
    
    private func updatePlayerPosition(direction: Direction)
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
    
    
    private func printInvalidExplanation(invalid: Valid)
    {
        if let explanation = invalid.invalidExplanation
        {
            print(explanation)
        }
    }
    
    
    
    
    
    private func getLivesLeft() -> Int
    {
        if let lives = lives
        {
            return lives.getLivesLeft()
        }
        
        return 0
    }
    
    private func getMovesTaken() -> Int
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
