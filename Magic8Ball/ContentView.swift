//
//  ContentView.swift
//  Magic8Ball
//
//  Created by yuriy on 11. 11. 25.
//

import SwiftUI

struct ContentView: View {
    @State var text = "Ask"
    @StateObject private var shakeManager = ShakeMotionManager()
    @State private var showAnswer = false
    @State private var appear = false
    @State private var dissolve = false
    
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
                ZStack {
                    Text("Ask")
                        .font(Font.custom("Magic School One", size: 24))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 20)
                        .opacity(showAnswer ? 0 : 1)
                        .scaleEffect(showAnswer ? 0.9 : 1.0)
                        .blur(radius: showAnswer ? 6 : 0)

                    Text(text)
                        .font(Font.custom("Magic School One", size: 24))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 20)
                        .opacity(appear ? (dissolve ? 0 : 1) : 0)
                        .scaleEffect(appear ? (dissolve ? 1.08 : 1.0) : 0.6)
                        .rotation3DEffect(.degrees(appear ? 0 : 30), axis: (x: 1, y: 0, z: 0))
                        .shadow(color: .white.opacity(appear && !dissolve ? 0.6 : 0), radius: 8)
                }
            )
            .shadow(color: Color.blue.opacity(0.5), radius: 20, x: 0, y: 20)
            .background(Color.black.frame(width: 200, height: 200))
            .background(Image(.background))
            .padding()
            .onReceive(shakeManager.$shakeTrigger) { _ in
                // Pick a new answer and run the appear -> wait -> dissolve sequence
                text = answerArray[Int.random(in: 0..<answerArray.count)]
                dissolve = false
                showAnswer = true
                appear = false

                withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.2)) {
                    appear = true
                }

                Task {
                    try? await Task.sleep(nanoseconds: 3_000_000_000)
                    withAnimation(.easeOut(duration: 1.2)) {
                        dissolve = true
                    }
                    try? await Task.sleep(nanoseconds: 1_300_000_000)
                    showAnswer = false
                    text = "Ask"
                    appear = false
                    dissolve = false
                }
            }
            .onAppear { shakeManager.start() }
            .onDisappear { shakeManager.stop() }
        
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
