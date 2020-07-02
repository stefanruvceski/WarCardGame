//
//  ContentView.swift
//  WarCardGame
//
//  Created by Stefan on 02/07/2020.
//  Copyright © 2020 stefan ruvceski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var num1 = 2
    @State private var num2 = 2
    
    @State private var card1 = "back"
    @State private var card2 = "back"
    
    @State private var score1 = 0
    @State private var score2 = 0
    
    @State private var showingAlert = false
    
    @State private var playerNum = 1

    var body: some View {
         ZStack{
            Image("blackbackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
           
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(self.card1)
                    Spacer()
                    Image(self.card2)
                    Spacer()
                }
                Spacer()
                Button(action:{
                    self.num1 = Int.random(in: 2...14)
                    self.num2 = Int.random(in: 2...14)
                    
                    self.card1 = "card" + String(self.num1)
                    self.card2 = "card" + String(self.num2)
                    
                    if self.num1 > self.num2{
                        self.score1+=1
                    }
                    else if self.num2 > self.num1{
                        self.score2+=1
                    }
                    
                    if(self.score1 == 10 ){
                        self.showingAlert = true
                        self.playerNum = 1
                    }
                    
                    if(self.score2 == 10){
                        self.showingAlert = true
                        self.playerNum = 2
                    }
                })
                {
                    Image("dealbutton").renderingMode(.original)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Winner"), message: Text("Player "+String(self.playerNum)), dismissButton: .default(Text("OK"), action: {
                        self.showingAlert = false
                        self.card1 = "back"
                        self.score1 = 0
                        self.card2 = "back"
                        self.score2 = 0
                    }))
                }
                
                Spacer()
                
                HStack{
                    VStack{
                        Text("Player1")
                            .bold()
                            .padding(.bottom, 20)
                            .font(.system(size: 20))
                        Text(String(self.score1))
                    }
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                    Spacer()
                    VStack{
                        Text("Player2")
                            .bold()
                            .padding(.bottom, 20)
                            .font(.system(size: 20))
                        Text(String(self.score2))
                    }
                    .padding(.trailing, 20)
                    .foregroundColor(.white)
                }
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
