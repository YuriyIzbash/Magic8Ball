//
//  ContentView.swift
//  WatchMagic8Ball Watch App
//
//  Created by yuriy on 12. 11. 25.
//

import SwiftUI

struct ContentView: View {
    @State var text = "Ask"
    @StateObject private var shakeManager = ShakeMotionManager()
    @State private var showAnswer = false
    @State private var appear = false
    @State private var dissolve = false
    @State private var isReady = false
    
    var body: some View {
        VStack {
            Image(.ball)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    ZStack {
                        Text("Ask")
                            .magicBallTextStyle(size: 14)
                            .opacity(showAnswer ? 0 : 1)
                            .scaleEffect(showAnswer ? 0.9 : 1.0)
                            .blur(radius: showAnswer ? 6 : 0)

                        Text(text)
                            .magicBallTextStyle(size: 10)
                            .opacity(appear ? (dissolve ? 0 : 1) : 0)
                            .scaleEffect(appear ? (dissolve ? 1.08 : 1.0) : 0.6)
                            .rotation3DEffect(.degrees(appear ? 0 : 30), axis: (x: 1, y: 0, z: 0))
                            .shadow(color: .white.opacity(appear && !dissolve ? 0.6 : 0), radius: 8)
                    }
                )
                .shadow(color: Color.blue.opacity(0.5), radius: 20, x: 0, y: 20)
                .background(
                    Color.black
                    .frame(width: 50, height: 80)
                )
                .background(
                    Image(.background)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .padding(.horizontal, 8)
                .offset(y: -12)
                .contentShape(Rectangle())
                .onTapGesture {
                    #if targetEnvironment(simulator)
                    if isReady && !showAnswer {
                        shakeManager.shakeTrigger &+= 1
                    }
                    #endif
                }
                .onReceive(shakeManager.$shakeTrigger) { _ in
                    guard isReady && !showAnswer else { return }
                    text = Magic8Ball.randomAnswer()
                    dissolve = false
                    showAnswer = true
                    appear = false

                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.2)) {
                        appear = true
                    }

                    Task {
                        try? await Task.sleep(nanoseconds: 2_000_000_000)
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
                .onAppear {
                    isReady = false
                    Task {
                        try? await Task.sleep(nanoseconds: 300_000_000)
                        isReady = true
                        shakeManager.start()
                    }
                }
                .onDisappear {
                    isReady = false
                    shakeManager.stop()
                }
        }
        .overlay(alignment: .bottom) {
            Text("Shake to see the answer!")
                .foregroundColor(.white)
                .font(Font.custom("Magic School One", size: 16))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 12)
        }
    }
}

#Preview {
    ContentView()
}
