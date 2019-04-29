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
    
    private let tileFactory = TileFactory()
    private var moves: Moves?
    private var lives: Lives?
    var tileArray = [Tile]()
    var playerPosition = [4,4]
    var startingNumberOfLives = 2
    var startingNumberOfMoves = 20
    var boardWidth = 8
    var boardHeight = 8
    
    
    init(width: Int = 8, height: Int = 10, moves: Int = 15, lives: Int = 5) {
        boardWidth = width
        boardHeight = height
        startingNumberOfMoves = moves
        startingNumberOfLives = lives
        
        setupGame()
    }
    
    func setupGame()
    {
        setUpMoves()
        setupLives()
        generateInitialTiles()
        setupPlayerPosition()
        print("You are at position \(playerPosition) on the board")
    }
    
    func hasGameEnded() -> Bool
    {
        if hasPlayerWon()
        {
            print("Well done you have won")
            return true
        }
        
        if getLivesLeft() <= 0 {
            print("You have run out of lives. Try again.")
            return true
        }
        
        if getMovesLeft() <= 0 {
            print("You are out of moves. Try again.")
            return true
        }
        
        return false
    }
    
    func hasPlayerWon() -> Bool
    {
        var hasWon = false
        
        if playerPosition[0] == boardHeight
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
        
        if !checkIfTileHasMine()
        {
            updatePlayerPosition(direction: direction)
        }
        else
        {
            playerHitsMine()
        }
        moves?.didMove()
        print("You are at \(playerPosition). You have \(getMovesLeft()) moves left. You have \(getLivesLeft()) lives left.")
    }
    
    func checkIfTileHasMine() -> Bool
    {
        let pos = playerPosition[0] * boardWidth + (playerPosition[1] + 1)
        let tile = tileArray[pos]
        let tileHasMine = tile.hasMine()
        if tileHasMine {
            tile.mineHasBeenHit()
            return true
        }
        
        return false
    }
    
    func playerHitsMine()
    {
        lives?.didDie()
        print("You have hit a mine. You have lost one life and have \(getLivesLeft()) of \(startingNumberOfLives)")
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
        let randomXPosition = Int.random(in: 1 ... boardWidth)
        playerPosition = [0, randomXPosition]
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
            if playerPosition[1] % boardWidth == 0
            {
                return Valid(valid: false, explanation: "You cannot move left when you are on the left column of the board")
            }
        }
        
        if direction == .right {
            if playerPosition[1] % boardWidth == boardWidth - 1
            {
                return Valid(valid: false, explanation: "You cannot move right when you are on the right column of the board")
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
    
    
    func getMovesLeft() -> Int
    {
        if let moves = moves
        {
            return moves.getMovesLeft()
        }
        
        return 0
    }
    
    func getLivesLeft() -> Int
    {
        if let lives = lives
        {
            return lives.getLivesLeft()
        }
        
        return 0
    }
    
    
    private func setUpMoves()
    {
        moves = Moves(moves: startingNumberOfMoves)
    }
    
    private func setupLives()
    {
        lives = Lives(lives: startingNumberOfLives)
    }
    
    private func generateInitialTiles()
    {
        let max = boardWidth * boardHeight - 1
        for _ in 0...max {
            let tile = tileFactory.createTile()
            tileArray.append(tile)
        }
    }
    
    
}
