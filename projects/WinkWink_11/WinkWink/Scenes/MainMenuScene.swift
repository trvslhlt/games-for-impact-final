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
    
    let backgroundNode = AppSpriteNode(imageNamed: "menu_room")
    weak var sceneDelegate: MainMenuSceneDelegate?
    var pictureNode: AppSpriteNode?
    var linksNode: AppSpriteNode?
    var settingsNode: AppSpriteNode?
    var trinketNode: AppSpriteNode?
    var lampNode: AppSpriteNode?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(backgroundNode)
        
        pictureNode = AppSpriteNode(imageNamed: "menu_picture")
        pictureNode?.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectLevel(number: 1)
        }
        backgroundNode.addChild(pictureNode!)
        let rotateAction = SKAction.rotate(toAngle: 0.05, duration: 0.2)
        let unrotateAction = SKAction.rotate(toAngle: 0, duration: 0.2)
        let rotateWait = SKAction.wait(forDuration: 2)
        let scaleSequence = SKAction.sequence([rotateAction, unrotateAction, rotateWait])
        let repeatScaleAction = SKAction.repeatForever(scaleSequence)
        pictureNode?.run(repeatScaleAction)
        
        linksNode = AppSpriteNode(imageNamed: "menu_messy_book")
        let slideAction = SKAction.moveBy(x: -2, y: 0, duration: 0.1)
        let unslideAction = SKAction.moveBy(x: 2, y: 0, duration: 0.2)
        let slideWait = SKAction.wait(forDuration: 3.5)
        let slideSequence = SKAction.sequence([slideAction, unslideAction, slideWait])
        let repeatedSlideAction = SKAction.repeatForever(slideSequence)
        linksNode?.run(repeatedSlideAction)
        linksNode?.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectLinks()
        }
        backgroundNode.addChild(linksNode!)
        
        settingsNode = AppSpriteNode(imageNamed: "menu_books")
        let jumpAction = SKAction.moveBy(x: 0, y: 3, duration: 1)
        let unjumpAction = SKAction.moveBy(x: 0, y: -3, duration: 0.1)
        let jumpWait = SKAction.wait(forDuration: 3)
        let jumpSequence = SKAction.sequence([jumpAction, unjumpAction, jumpWait])
        let repeatedJumpAction = SKAction.repeatForever(jumpSequence)
        settingsNode?.run(repeatedJumpAction)
        settingsNode?.didTap = {
            self.sceneDelegate?.mainMenuSceneDidSelectSettings()
        }
        backgroundNode.addChild(settingsNode!)
        
        trinketNode = AppSpriteNode(imageNamed: "menu_slay")
        let swingAction = SKAction.rotate(toAngle: 0.05, duration: 1)
        let unswingAction = SKAction.rotate(toAngle: -0.05, duration: 1)
        let swingSequence = SKAction.sequence([swingAction, unswingAction])
        let repeatedSwingAction = SKAction.repeatForever(swingSequence)
        trinketNode?.run(repeatedSwingAction)
        trinketNode?.anchorPoint = CGPoint(x: 0.5, y: 1)
        backgroundNode.addChild(trinketNode!)
        
        lampNode = AppSpriteNode(imageNamed: "menu_lava_lamp")
        let rockAction = SKAction.rotate(toAngle: 0.05, duration: 2.2)
        let unrockAction = SKAction.rotate(toAngle: -0.04, duration: 2.2)
        let rockSequence = SKAction.sequence([rockAction, unrockAction])
        let repeatedRockAction = SKAction.repeatForever(rockSequence)
        lampNode?.run(repeatedRockAction)
        lampNode?.anchorPoint = CGPoint(x: 0.5, y: 0)
        backgroundNode.addChild(lampNode!)
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
        linksNode?.position = backgroundNode.size.pointAtPortion(x: 0.10, y: -0.46)
        settingsNode?.position = backgroundNode.size.pointAtPortion(x: 0.27, y: -0.26)
        trinketNode?.position = backgroundNode.size.pointAtPortion(x: 0.23, y: 0.21)
        lampNode?.position = backgroundNode.size.pointAtPortion(x: 0, y: -0.05)
    }
    
}
