//
//  PlayScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class PlayScene: AppScene {

    private let challengeNodes: [ChallengeNode]
    
    init(challengeNodes: [ChallengeNode], size: CGSize) {
        self.challengeNodes = challengeNodes
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
