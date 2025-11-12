//  ShakeMotionManager.swift
//  Magic8Ball
//
//  Created by yuriy on 11. 11. 25.
//

import Combine
import Foundation
import CoreMotion

final class ShakeMotionManager: ObservableObject {
    @Published var shakeTrigger: Int = 0

    private let motion = CMMotionManager()
    private let queue = OperationQueue()
    private var lastShakeDate: Date = .distantPast
    private let debounceInterval: TimeInterval = 0.8
    private let threshold: Double = 1.8

    func start() {
        guard motion.isDeviceMotionAvailable else { return }
        motion.deviceMotionUpdateInterval = 1.0 / 60.0
        motion.startDeviceMotionUpdates(to: queue) { [weak self] motion, _ in
            guard let self, let motion else { return }

            let a = motion.userAcceleration
            let magnitude = sqrt(a.x * a.x + a.y * a.y + a.z * a.z)

            if magnitude > self.threshold {
                let now = Date()
                if now.timeIntervalSince(self.lastShakeDate) > self.debounceInterval {
                    self.lastShakeDate = now
                    DispatchQueue.main.async {
                        self.shakeTrigger &+= 1
                    }
                }
            }
        }
    }

    func stop() {
        motion.stopDeviceMotionUpdates()
    }
}

