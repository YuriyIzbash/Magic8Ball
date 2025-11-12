import Foundation
import WatchKit

final class HapticsManager {
    static let shared = HapticsManager()
    private init() {}

    private let device = WKInterfaceDevice.current()

    /// Light feedback when a shake is detected in the simulator or hardware
    func shakeDetected() {
        play(.click)
    }

    /// Stronger confirmation when the answer is revealed
    func answerRevealed() {
        play(.success)
    }

    /// A gentle end feedback when the answer dissolves
    func answerDissolve() {
        play(.stop)
    }

    private func play(_ type: WKHapticType) {
        device.play(type)
    }
}
