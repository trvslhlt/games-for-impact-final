//
//  AppGlobal.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/13/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import Foundation

struct Level {
    let number: Int
    let timeLimit: TimeInterval
    let title: String
    let challenges: [ChallengeNode]
}

struct LevelResult {
    let level: Level
    let scored: Float
    let possible: Float
    let timeElapsed: TimeInterval
}

class LevelTimer {

    private var timer: Timer?
    private let timerInterval: TimeInterval = 0.01
    private var timerTemplate: Timer {
        return Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: { t in
            self.elapsedTime += t.timeInterval
            self.didUpdateElapsedTime?(self.elapsedTime)
        })
    }
    var pausedTimes = [TimeInterval]()
    var elapsedTime: TimeInterval = 0
    var didUpdateElapsedTime: ((TimeInterval) -> ())?
    private var isPaused = true
    
    func start() {
        guard self.timer == nil else { return }
        unpause()
    }
    
    func pause() {
        guard !isPaused else { return }
        self.timer?.invalidate()
        pausedTimes.append(elapsedTime)
        isPaused = true
    }
    
    func unpause() {
        guard isPaused else { return }
        self.timer = self.timerTemplate
        isPaused = false
    }
    
}
