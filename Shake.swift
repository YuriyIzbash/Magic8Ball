//
//  Shake.swift
//  Magic8Ball
//
//  Created by yuriy on 11. 11. 25.
//

import SwiftUI
import UIKit

final class ShakeView: UIView {
    var onShake: (() -> Void)?

    override var canBecomeFirstResponder: Bool { true }

    override func didMoveToWindow() {
        super.didMoveToWindow()

        becomeFirstResponder()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            onShake?()
        }
    }
}

struct ShakeDetector: UIViewRepresentable {
    let onShake: () -> Void

    func makeUIView(context: Context) -> ShakeView {
        let view = ShakeView()
        view.onShake = onShake
        return view
    }

    func updateUIView(_ uiView: ShakeView, context: Context) {
        uiView.onShake = onShake
    }
}

// A convenient modifier to use anywhere in SwiftUI.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        background(ShakeDetector(onShake: action))
    }
}
