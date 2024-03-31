//
//  Cell.swift
//  TicTacToeSwiftUI
//
//  Created by /ᐠ-ꞈ-ᐟ\ on 5.03.2024.
//

import SwiftUI

struct Cell{
   
    var tile: Tile
    
    func displayTile() -> String{
        switch tile{
        case Tile.Nought:
            return "🅾️"
        case Tile.Cross:
            return "❎"
        default:
            return " "
        }
    }
    
    func tileColor() -> Color {
        switch tile{
        case Tile.Nought:
            return Color.red
        case Tile.Cross:
            return Color.black
        default:
            return Color.black
        }
    }
}
enum Tile{
    case Nought
    case Cross
    case Empty
}
