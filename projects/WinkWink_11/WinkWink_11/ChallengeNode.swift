//
//  ChallengeNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol ChallengeNodeDelegate: class {
    func challengeNodeDidComplete(node: ChallengeNode, correct: Bool)
}

class ChallengeNode: AppSpriteNode {

    weak var delegate: ChallengeNodeDelegate?
    var potentialValue: Float = 10
    
    func start() {
        assertionFailure("override start in ChallengeNode subclasses")
    }
    
    func stop() {
        assertionFailure("override start in ChallengeNode subclasses")
    }
    
    func didSubmitAnswer(correct: Bool) {
        disableInteraction()
        delegate?.challengeNodeDidComplete(node: self, correct: correct)
    }
    
    private func disableInteraction() {
        let cover = SKSpriteNode(color: Configuration.color.backgroundDisabled, size: size)
        addChild(cover)
    }
    
}
