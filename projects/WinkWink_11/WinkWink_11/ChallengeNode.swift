//
//  ChallengeNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol ChallengeNodeDelegate: class {
    func didComplete(points: Float, ofPossible possible: Float)
}

class ChallengeNode: SKNode {

    weak var delegate: ChallengeNodeDelegate?
    
    func start() {
        assertionFailure("override start in ChallengeNode subclasses")
    }
    
    func stop() {
        assertionFailure("override start in ChallengeNode subclasses")
    }
//    override init() {
//        super.init()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
