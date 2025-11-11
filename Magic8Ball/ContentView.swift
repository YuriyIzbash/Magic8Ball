//
//  ContentView.swift
//  Magic8Ball
//
//  Created by yuriy on 11. 11. 25.
//

import SwiftUI

struct ContentView: View {
    @State var text = "Ask"
    
    let answerArray = [
        "It is certain",
        "Without a doubt",
        "You may rely on it",
        "Yes, definitely",
        "It is decidedly so",
        "As I see it, yes",
        "Most likely",
        "Outlook good",
        "Yes",
        "Signs point to yes",
        "Reply hazy, try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again",
        "Don’t count on it",
        "My reply is no",
        "My sources say no",
        "Outlook not so good",
        "Very doubtful"
    ]
    
    var body: some View {
        Image(.ball)
            .resizable()
            .scaledToFit()
            .frame(width: 400, height: 400)
            .frame(maxWidth: .infinity, alignment: .center)
            .overlay(
                Text(text)
                    .font(Font.custom("Magic School One", size: 24))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                    .animation(Animation.spring(), value: text)
                    .onShake {
                        text = answerArray[Int.random(in: 0..<answerArray.count)]
                    }
            )
            .shadow(color: Color.blue.opacity(0.5), radius: 20, x: 0, y: 20)
            .background(Color.black.frame(width: 200, height: 200))
            .background(Image(.background))
            .padding()
        
        Text("Shake to see the answer!")
            .foregroundColor(.white)
            .font(Font.custom("Magic School One", size: 42))
            .shadow(color: .red, radius: 10)
            .padding()
    }
}

#Preview {
    ContentView()
}
