//
//  ChallengeResultNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/13/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol ChallengeResultNodeDelegate: class {
    func challengeResultDidComplete()
}

class ChallengeResultNode: AppSpriteNode {

    weak var delegate: ChallengeResultNodeDelegate?
    let correct: Bool
    
    init(correct: Bool) {
        self.correct = correct
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func commonInit() {
        let container = AppSpriteNode(color: Configuration.color.backgroundSecondary, size: CGSize(width: 250, height: 250))
        container.position = CGPoint(x: size.width / 2, y: size.height / 2)
        container.didTap = {
            self.delegate?.challengeResultDidComplete()
        }
        addChild(container)
        
        let resultText = AppLabelNode(text: correct ? "GREAT!" : "NOPE")
        resultText.fontSize = Configuration.font.size.big
        resultText.position = CGPoint.zero
        container.addChild(resultText)
    }

    func start() {
        print("ChallengeResultNode: start")
    }
    
    func stop() {
        print("ChallengeResultNode: stop")
    }
    
    private func disableInteraction() {
        let cover = SKSpriteNode(color: .clear, size: size)
        addChild(cover)
    }

}
