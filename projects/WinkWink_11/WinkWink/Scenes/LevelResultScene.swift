//
//  LevelResultScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol LevelResultSceneDelegate: class {
    func levelResultDidComplete()
}

class LevelResultScene: AppScene {

    let levelResult: LevelResult
    weak var sceneDelegate: LevelResultSceneDelegate?
    
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
        
        let marksLabel = AppLabelNode()
        marksLabel.text = "\(levelResult.marks.correct) / \(levelResult.marks.possible)"
        marksLabel.position = levelLabel.position.offset(x: 0, y: -50)
        addChild(marksLabel)
        
        let scoreLabel = AppLabelNode()
        scoreLabel.text = "Score: \(levelResult.score.earned)"
        scoreLabel.position = marksLabel.position.offset(x: 0, y: -50)
        addChild(scoreLabel)
        
        let timeLabel = AppLabelNode()
        let formattedTime = String(format: "%.1f", levelResult.timeElapsed)
        timeLabel.text = "Time Remaining: \(formattedTime)s"
        timeLabel.position = scoreLabel.position.offset(x: 0, y: -50)
        addChild(timeLabel)
        
        let backgroundNode = AppSpriteNode(color: .clear, size: view.bounds.size)
        backgroundNode.didTap = {
            self.sceneDelegate?.levelResultDidComplete()
        }
        backgroundNode.position = view.center
        addChild(backgroundNode)
    }

}
