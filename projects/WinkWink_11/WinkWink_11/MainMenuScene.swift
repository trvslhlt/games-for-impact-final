//
//  MainMenuScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/16/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import SpriteKit

class MainMenuScene: AppScene {
    
    let backgroundNode = AppSpriteNode(imageNamed: "room")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)

        backgroundNode.size = size
        backgroundNode.position = size.centerPoint()
        addChild(backgroundNode)
        
        let pictureNode = AppSpriteNode(imageNamed: "picture")
        pictureNode.position = backgroundNode.size.portionOf(x: -0.25, y: 0.35)
        backgroundNode.addChild(pictureNode)
        
        let pictureLabel = AppLabelNode(text: "1")
        pictureLabel.verticalAlignmentMode = .center
        pictureNode.addChild(pictureLabel)
        
        let scaleDownAction = SKAction.scale(to: 0.8, duration: 0.2)
        let scaleUpAction = SKAction.scale(to: 1, duration: 0.5)
        let scaleSequence = SKAction.sequence([scaleDownAction, scaleUpAction])
        let repeatedAction = SKAction.repeatForever(scaleSequence)
        pictureNode.run(repeatedAction)
    }

}
