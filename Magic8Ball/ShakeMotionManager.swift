//  ShakeMotionManager.swift
//  Magic8Ball
//
//  Created by yuriy on 11. 11. 25.
//

import Combine
import Foundation
import CoreMotion

final class ShakeMotionManager: ObservableObject {
    private let motion = CMMotionManager()
    private let queue = OperationQueue()

    // Increment this to signal a shake event to SwiftUI.
    @Published var shakeTrigger: Int = 0

    // Debounce to avoid multiple triggers per shake.
    private var lastShakeDate: Date = .distantPast
    private let debounceInterval: TimeInterval = 0.8

    // Sensitivity threshold. Typical shakes exceed ~1.5–2.0 on userAcceleration magnitude.
    private let threshold: Double = 1.8

    func start() {
        guard motion.isDeviceMotionAvailable else { return }
        motion.deviceMotionUpdateInterval = 1.0 / 60.0
        motion.startDeviceMotionUpdates(to: queue) { [weak self] motion, _ in
            guard let self, let motion else { return }

            // Use userAcceleration (gravity removed) for reliability.
            let a = motion.userAcceleration
            let magnitude = sqrt(a.x * a.x + a.y * a.y + a.z * a.z)

            if magnitude > self.threshold {
                let now = Date()
                if now.timeIntervalSince(self.lastShakeDate) > self.debounceInterval {
                    self.lastShakeDate = now
                    DispatchQueue.main.async {
                        self.shakeTrigger &+= 1 // wraparound-safe increment
                    }
                }
            }
        }
    }

    func stop() {
        motion.stopDeviceMotionUpdates()
    }
}

