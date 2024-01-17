//
//  ContentView.swift
//  clicker
//
//  Created by Evan Martho on 17/01/2024.
//

import SwiftUI


struct ContentView: View {
    @State var score = 0
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.title)
                .padding()
            Image(systemName: "plus.square")
                .font(.title)
                .onTapGesture {
                    score = score+1
                }
            Spacer()
            Button("New game"){
                score = 0
            }.padding()
        }
    }
}

//func addingScore(score) -> <#return type#> {
//    <#function body#>
//}

#Preview {
    ContentView()
}
