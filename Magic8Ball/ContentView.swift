//
//  ContentView.swift
//  Magic8Ball
//
//  Created by yuriy on 11. 11. 25.
//

import SwiftUI

struct ContentView: View {
    @State var text = "Ask"
    
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
                    .padding(.bottom, 40)
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
