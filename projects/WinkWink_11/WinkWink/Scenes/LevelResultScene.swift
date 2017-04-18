//
//  LevelResultScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit


class LevelResultScene: AppScene {

    let levelResult: LevelResult
    
    init(levelResult: LevelResult, size: CGSize) {
        self.levelResult = levelResult
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let levelLabel = AppLabelNode()
        levelLabel.text = "\(levelResult.level.number): \(levelResult.level.title)"
        levelLabel.position = view.center.offset(x: 0, y: 50)
        levelLabel.fontSize = Configuration.font.size.medium
        addChild(levelLabel)
        
        let scoreLabel = AppLabelNode()
        scoreLabel.text = "Score: \(levelResult.scored) / \(levelResult.possible)"
        scoreLabel.position = view.center.offset(x: 0, y: 0)
        addChild(scoreLabel)
        
        let timeLabel = AppLabelNode()
        let formattedTime = String(format: "%.1f", levelResult.timeElapsed)
        timeLabel.text = "Elapsed Time: \(formattedTime)s"
        timeLabel.position = view.center.offset(x: 0, y: -50)
        addChild(timeLabel)
    }

}
