//
//  PlayScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class PlayScene: AppScene {

    private var challengeNodes: [ChallengeNode]
    var currentChallengeNode: ChallengeNode?
    
    init(challengeNodes: [ChallengeNode], size: CGSize) {
        self.challengeNodes = challengeNodes
        super.init(size: size)
        view?.layer.borderWidth = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        start()
    }
    
    private func start() {
        guard currentChallengeNode == nil else { return }
        
        if challengeNodes.count == 0 {
            print("no challenges to play")
            return
        }
        startNextChallenge()
    }
    
    private func stop() {
        print("need to implement wrapUp in PlayScene")
    }
    
    private func startNextChallenge() {
        guard challengeNodes.count > 0 else {
            stop()
            return
        }
        currentChallengeNode = challengeNodes.remove(at: 0)
        if let node = currentChallengeNode {
            node.size = self.size
            node.position = CGPoint(x: node.size.width / 2, y: node.size.height / 2)
            addChild(node)
            node.start()
        }
    }
    
}
