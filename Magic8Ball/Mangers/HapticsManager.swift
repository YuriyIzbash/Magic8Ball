//
//  HapticsManager.swift
//  Magic8Ball
//
//  Created by yuriy on 12. 11. 25.
//

import Foundation

#if os(iOS)
import UIKit

final class HapticsManager {
    static let shared = HapticsManager()

    private let notification = UINotificationFeedbackGenerator()
    private let impactLight = UIImpactFeedbackGenerator(style: .light)
    private let impactRigid = UIImpactFeedbackGenerator(style: .rigid)

    private init() {
        // Prepare common generators for reduced latency
        notification.prepare()
        impactLight.prepare()
        impactRigid.prepare()
    }

    /// Strong tactile cue when a shake/tap is recognized.
    func shakeDetected() {
        impactRigid.impactOccurred(intensity: 0.9)
    }

    /// Positive confirmation when the answer is revealed.
    func answerRevealed() {
        notification.notificationOccurred(.success)
    }

    /// Subtle cue when the answer begins to fade away.
    func answerDissolve() {
        impactLight.impactOccurred(intensity: 0.4)
    }
}

#elseif os(watchOS)
import WatchKit

final class HapticsManager {
    static let shared = HapticsManager()
    private init() {}

    /// Stronger cue for the initial shake/tap.
    func shakeDetected() {
        WKInterfaceDevice.current().play(.start)
    }

    /// Satisfying confirmation when the answer appears.
    func answerRevealed() {
        WKInterfaceDevice.current().play(.success)
    }

    /// Light tick as the answer dissolves.
    func answerDissolve() {
        WKInterfaceDevice.current().play(.click)
    }
}

#else

final class HapticsManager {
    static let shared = HapticsManager()
    private init() {}
    func shakeDetected() {}
    func answerRevealed() {}
    func answerDissolve() {}
}

#endif
