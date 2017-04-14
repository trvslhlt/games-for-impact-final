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
    
    override func commonInit() {
        super.commonInit()
        
        progressView.trackTintColor = Configuration.color.backgroundSecondary
        progressView.progressTintColor = .black
        addSubview(progressView)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        progressView.frame = progressViewRect()
    }
    
    private func progressViewRect() -> CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: 5)
    }
    
    func set(progress: Float) {
        self.progressView.progress = progress
    }
    
}
