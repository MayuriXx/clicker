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
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.title)
                .padding()
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
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
