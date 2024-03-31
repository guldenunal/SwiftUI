//
//  GameState.swift
//  TicTacToeSwiftUI
//
//  Created by /ᐠ-ꞈ-ᐟ\ on 5.03.2024.
//

import Foundation

class GameState: ObservableObject
{
    
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var xScore = 0
    @Published var oScore = 0
    @Published var showAlert = false
    @Published var message = "Draw!!"
    
    init()
    {
        resetBoard()
    }
    
    func resetBoard(){
        var newBoard = [[Cell]]()
        for _ in 0...2{
            var row = [Cell]()
            for _ in 0...2{
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        turn = Tile.Cross
        board = newBoard
    }
    func placeTile(_ row: Int, _ column: Int){
        
        if(board[row][column].tile != Tile.Empty)
        {
            return
        }
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        
        if(checkVictory()){
            if(turn == Tile.Cross){
                xScore += 1
            }else{
                oScore += 1
            }
            resetBoard()
          /*  let winner = turn == Tile.Cross ? "❌" : "⭕️"
            message = winner + " is the winner!"
            showAlert = true  */
            if xScore == 3 {
                message = "❌ is the winner!"
                showAlert = true
                xScore = 0
                
            }
            else if oScore == 3 {
                message =  "⭕️ is the winner!"
                showAlert = true
                oScore = 0
            }
        }else{
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
        if(checkDraw()){
            message = "Draw!"
            showAlert = true
        }
    }
    
    func checkVictory() -> Bool
    {
        //vertical victories
        if tileTurn(0,0) && tileTurn(1,0) && tileTurn(2,0){
            return true
        }
        if tileTurn(0,1) && tileTurn(1,1) && tileTurn(2,1){
            return true
        }
        if tileTurn(0,2) && tileTurn(1,2) && tileTurn(2,2){
            return true
        }
        //horizontal victories
        if tileTurn(0,0) && tileTurn(0,1) && tileTurn(0,2){
            return true
        }
        if tileTurn(1,0) && tileTurn(1,1) && tileTurn(1,2){
            return true
        }
        if tileTurn(2,0) && tileTurn(2,1) && tileTurn(2,2){
            return true
        }
        //diagonal victories
        if tileTurn(0,0) && tileTurn(1,1) && tileTurn(2,2){
            return true
        }
        if tileTurn(0,2) && tileTurn(1,1) && tileTurn(2,0){
            return true
        }
        return false
    }
    
    func tileTurn(_ row: Int, _ column: Int) -> Bool{
        return board[row][column].tile == turn
    }
    
    func checkDraw() -> Bool{
        for row in board{
            for cell in row{
                if cell.tile == Tile.Empty {
                    return false
                }
                else if checkVictory() == true{
                    return false
                }
             
            }
        }
        return true}
}
