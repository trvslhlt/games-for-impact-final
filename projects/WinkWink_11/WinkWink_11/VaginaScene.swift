//
//  VaginaScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/8/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol SceneDelegate: class {
    func sceneDone(scene: SKScene)
}

class VaginaScene: SKScene {
    
    let vulva = SKSpriteNode(imageNamed: "vulvaDrawing")
    let vagina = SKSpriteNode()
    let text = SKLabelNode(text: "Tap the vagina.")
    weak var sceneDelegate: SceneDelegate?
    
    override func didMove(to view: SKView) {
        backgroundColor = Configuration.color.backgroundMain
        vulva.position = view.center
        vulva.name = "vulva"
        vulva.size = CGSize(width: 200, height: 200)
        addChild(vulva)
        
        vagina.name = "vagina"
        vagina.size = CGSize(width: 40, height: 40)
        vagina.position = CGPoint(x: vagina.position.x, y: vagina.position.y - 40)
        vulva.addChild(vagina)
        
        text.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY + 200)
        addChild(text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let positionInScene = touch.location(in: self)
        if let touchedNode = nodes(at: positionInScene).first, let name = touchedNode.name {
            if name == vagina.name {
                showCorrect()
            } else if name == vulva.name {
                showWrong()
            }
        }
    }
    
    func showCorrect() {
        let successText = SKLabelNode(text: "GREAT!")
        successText.fontSize = 150
        successText.position = vulva.position
        addChild(successText)
        vulva.removeFromParent()
        transitionToNext()
    }
    
    func showWrong() {
        let failureText = SKLabelNode(text: "NOPE")
        failureText.fontSize = 150
        failureText.position = vulva.position
        addChild(failureText)
        vulva.removeFromParent()
        transitionToNext()
    }
    
    func transitionToNext() {
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.sceneDelegate?.sceneDone(scene: self)
        }
    }
    
    func change() {
        print("change")
    }

}
