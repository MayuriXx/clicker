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
    @State var newGame = false
    @State var userName:String = ""
    @AppStorage("userNameStorage") var userNameStorage: String = ""
    
    var body: some View {
        VStack {
            // Manage text field and the button on the right
            HStack{
                TextField("Please enter user name",text: $userName)
                if(userName == ""){
                    Image(systemName: "plus.circle")
                        .padding()
                        .onSubmit {
                            userNameStorage = userName
                        }
                }else{
                    Image(systemName: "minus.circle")
                        .padding()
                        .onTapGesture {
                            userName = ""
                        }
                }
            }.padding()
            //Manage the best score system
            HStack {
                if score >= bestScore && score != 0 {
                    Image(systemName: "flame.fill")
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
            //Display the username of best score
            if(bestScore != 0){
                HStack{
                    Image(systemName: "plus.square")
                    Text("\(userName) - \(bestScore)")
                    Image(systemName: "plus.square")
                    
                }
            }
            Spacer()
            //Manage the new game
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
