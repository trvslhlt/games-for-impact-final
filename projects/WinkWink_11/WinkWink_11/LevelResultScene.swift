//
//  LevelResultScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class LevelResultScene: AppScene {
    
    var level = "<???>"
    var score = "??? / ???"
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let levelLabel = AppLabelNode()
        levelLabel.text = "Level: " + level
        levelLabel.position = view.center.offset(x: 0, y: 50)
        addChild(levelLabel)
        
        let scoreLabel = AppLabelNode()
        scoreLabel.text = "Score: " + score
        scoreLabel.position = view.center.offset(x: 0, y: -50)
        addChild(scoreLabel)
    }

}
