//
//  ContentView.swift
//  TicTacToeSwiftUI
//
//  Created by /ᐠ-ꞈ-ᐟ\ on 5.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    
    var body: some View {
        Text("❌|⭕️|❌")
            .font(.system(size: 60))
       
      let borderSize = CGFloat(5)
        VStack(spacing: borderSize)
        {
            ForEach(0...2, id: \.self)
            {
                row in
                HStack(spacing: borderSize)
                {
                    ForEach(0...2, id: \.self)
                    {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .bold()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .foregroundColor(cell.tileColor())
                            .onTapGesture{
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
           
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $gameState.showAlert)
        {
            Alert(title: Text(gameState.message), dismissButton: .default(Text("OK")){
                gameState.resetBoard()
            })
        }
        Text("X: \(gameState.xScore)       O: \(gameState.oScore)")
            .bold()
            .font(.system(size: 25))
    }
}

#Preview {
    ContentView()
}
