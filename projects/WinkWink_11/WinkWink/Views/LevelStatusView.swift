//
//  LevelStatusView.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/14/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class LevelStatusView: AppView {
    
    private let progressView = UIProgressView()
    private var incrementView: IncrementView?
    private let incrementViewSize = CGSize(width: 100, height: 50)
    
    override func commonInit() {
        super.commonInit()
        progressView.trackTintColor = Configuration.color.incomplete
        progressView.progressTintColor = Configuration.color.complete
        addSubview(progressView)
    }
    
    func setChallengeCount(_ count: Int) {
        incrementView?.removeFromSuperview()
        incrementView = nil
        incrementView = IncrementView(
            increments: count,
            completeColor: Configuration.color.complete,
            incompleteColor: Configuration.color.incomplete)
        addSubview(incrementView!)
    }
    
    func setChallenge(number: Int) {
        incrementView?.set(increment: number)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        incrementView?.frame = CGRect(
            origin: CGPoint(
                x: bounds.midX - incrementViewSize.width / 2,
                y: bounds.midY - incrementViewSize.height / 2),
            size: incrementViewSize)
        progressView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 10)
    }
    
    func set(progress: Float) {
        self.progressView.progress = progress
    }
    
}
