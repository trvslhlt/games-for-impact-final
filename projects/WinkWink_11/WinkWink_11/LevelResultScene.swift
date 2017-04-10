//
//  LevelResultScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class LevelResultScene: SKScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = Configuration.color.backgroundPrimary
        let levelLabel = childNode(withName: "levelNode") as! SKLabelNode
        levelLabel.text = "Level: 1000"
    }

}
