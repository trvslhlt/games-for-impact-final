//
//  PlayScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol PlaySceneDelegate: class {
    func playSceneDone(scene: SKScene)
    func playScenePointsScored(points: Float, ofPossible possible: Float)
}

class PlayScene: SKScene {

    let challengeNode = SKSpriteNode()
    let resultNode = SKSpriteNode()
    var possiblePoints: Float = 0
    weak var playSceneDelegate: PlaySceneDelegate?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.scaleMode = .resizeFill
        backgroundColor = Configuration.color.backgroundPrimary
    }
    
}
