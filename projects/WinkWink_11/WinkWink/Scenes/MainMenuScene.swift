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
    var pictureNode: AppSpriteNode?
    var linksNode: AppSpriteNode?
    var settingsNode: AppSpriteNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)

        addChild(backgroundNode)
        
        pictureNode = AppSpriteNode(imageNamed: "picture")
        pictureNode?.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectLevel(number: 1)
        }
        backgroundNode.addChild(pictureNode!)
        
        let scaleDownAction = SKAction.scale(to: 0.9, duration: 0.2)
        let scaleUpAction = SKAction.scale(to: 1, duration: 1)
        let scaleSequence = SKAction.sequence([scaleDownAction, scaleUpAction])
        let repeatedAction = SKAction.repeatForever(scaleSequence)
        pictureNode?.run(repeatedAction)
        
        linksNode = AppSpriteNode(color: .clear, size: CGSize(width: 80, height: 50))
        linksNode?.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectLinks()
        }
        backgroundNode.addChild(linksNode!)
        
        settingsNode = AppSpriteNode(color: .clear, size: CGSize(width: 70, height: 90))
        settingsNode?.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectSettings()
        }
        backgroundNode.addChild(settingsNode!)
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        
        let sizeChange = size.width / oldSize.width
        if let linksNode = linksNode, let settingsNode = settingsNode, let pictureNode = pictureNode {
            for node in [linksNode, settingsNode, pictureNode] {
                let previousSize = node.size
                let newSize = CGSize(width: previousSize.width * sizeChange, height: previousSize.height * sizeChange)
                node.size = newSize
            }
        }
        layoutNodes()
    }
    
    private func layoutNodes() {
        backgroundNode.size = size
        backgroundNode.position = size.centerPoint()
        pictureNode?.position = backgroundNode.size.pointAtPortion(x: 0.25, y: 0.35)
        linksNode?.position = backgroundNode.size.pointAtPortion(x: 0.13, y: -0.46)
        settingsNode?.position = backgroundNode.size.pointAtPortion(x: 0.25, y: -0.3)
        

    }

}
