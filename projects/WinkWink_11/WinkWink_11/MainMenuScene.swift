//
//  MainMenuScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/16/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import SpriteKit

protocol MainMenuSceneDelegate: class {
    func mainMenuSceneDidSelectLevel(number: Int)
    func mainMenuSceneDidSelectLinks()
    func mainMenuSceneDidSelectSettings()
}

class MainMenuScene: AppScene {
    
    let backgroundNode = AppSpriteNode(imageNamed: "room")
    weak var sceneDelegate: MainMenuSceneDelegate?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)

        backgroundNode.size = size
        backgroundNode.position = size.centerPoint()
        addChild(backgroundNode)
        
        let pictureNode = AppSpriteNode(imageNamed: "picture")
        pictureNode.position = backgroundNode.size.pointAtPortion(x: 0.25, y: 0.35)
        backgroundNode.addChild(pictureNode)
        
        let pictureLabel = AppLabelNode(text: "1")
        pictureLabel.verticalAlignmentMode = .center
        pictureNode.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectLevel(number: 1)
        }
        pictureNode.addChild(pictureLabel)
        
        let scaleDownAction = SKAction.scale(to: 0.9, duration: 0.2)
        let scaleUpAction = SKAction.scale(to: 1, duration: 1)
        let scaleSequence = SKAction.sequence([scaleDownAction, scaleUpAction])
        let repeatedAction = SKAction.repeatForever(scaleSequence)
        pictureNode.run(repeatedAction)
        
        let linksNode = AppSpriteNode(color: .clear, size: CGSize(width: 80, height: 50))
        linksNode.position = backgroundNode.size.pointAtPortion(x: 0.13, y: -0.46)
        linksNode.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectLinks()
        }
        backgroundNode.addChild(linksNode)
        
        let settingsNode = AppSpriteNode(color: .clear, size: CGSize(width: 70, height: 90))
        settingsNode.position = backgroundNode.size.pointAtPortion(x: 0.25, y: -0.3)
        settingsNode.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectSettings()
        }
        backgroundNode.addChild(settingsNode)
    }

}
