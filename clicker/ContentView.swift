//
//  ContentView.swift
//  clicker
//
//  Created by Evan Martho on 17/01/2024.
//

import SwiftUI


struct ContentView: View {
    
    @State var score = 0
    @State var gameIsInProgress = false
    @State var bestScore = 0
    
    var body: some View {
        VStack {
            HStack {
                if score >= bestScore && score != 0 {
                    Image(systemName: "flame")
                }
                Text("Score: \(score)")
                .padding()
            }.font(.title)
            
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        score = score+1
                    }
            }
            Spacer()
            
            if gameIsInProgress == false {
                Button("New game"){
                    score = 0
                    gameIsInProgress = true
                    Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
                        gameIsInProgress = false
                        if score > bestScore {
                            bestScore = score
                        }
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
