//
//  TapTheVaginaNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class TapTheVaginaNode: ChallengeNode {
    
    let vulvaNode = AppSpriteNode(imageNamed: "vulvaDrawing")
    let vaginaNode = AppSpriteNode()
    let textNode = AppLabelNode(text: "Tap the vagina.")
    
    override func commonInit() {
        super.commonInit()
        
        vulvaNode.position = CGPoint.zero
        vulvaNode.size = CGSize(width: 200, height: 200)
        vulvaNode.color = .white
        vulvaNode.didTap = {
            self.didSubmitAnswer(correct: false)
        }

        vaginaNode.size = CGSize(width: 40, height: 40)
        vaginaNode.position = CGPoint(x: vulvaNode.position.x, y: vulvaNode.position.y - 40)
        vaginaNode.didTap = {
            self.didSubmitAnswer(correct: true)
        }
        
        textNode.position = CGPoint(x: 0, y: 200)
        
        addChild(textNode)
        addChild(vulvaNode)
        vulvaNode.addChild(vaginaNode)
    }
    
    override func start() {
        print("TapTheVagina:start")
    }
    
    override func stop() {
        print("TapTheVaginaNode:stop")
    }

}
