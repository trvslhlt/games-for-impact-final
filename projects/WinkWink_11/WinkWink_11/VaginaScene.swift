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
    func pointsScored(points: Float, ofPossible possible: Float)
}

class VaginaScene: SKScene {
    
    let challengeNode = SKSpriteNode()
    let resultNode = SKSpriteNode()
    let vagina = "vagina"
    let vulva = "vulva"
    let possiblePoints: Float = 10
    weak var sceneDelegate: SceneDelegate?
    
    override func didMove(to view: SKView) {
        backgroundColor = Configuration.color.backgroundPrimary
        showChallenge(view: view)
    }
    
    func showChallenge(view: SKView) {
        challengeNode.size = view.bounds.size
        challengeNode.position = view.center
        addChild(challengeNode)
        
        let vulvaNode = SKSpriteNode(imageNamed: "vulvaDrawing")
        vulvaNode.position = CGPoint.zero
        vulvaNode.name = vulva
        vulvaNode.size = CGSize(width: 200, height: 200)
        vulvaNode.color = .white
        challengeNode.addChild(vulvaNode)
        
        let vaginaNode = SKSpriteNode()
        vaginaNode.name = vagina
        vaginaNode.size = CGSize(width: 40, height: 40)
        vaginaNode.position = CGPoint(x: vulvaNode.position.x, y: vulvaNode.position.y - 40)
        vulvaNode.addChild(vaginaNode)

        let textNode = SKLabelNode(text: "Tap the vagina.")
        textNode.position = CGPoint(x: 0, y: 200)
        challengeNode.addChild(textNode)
    }
    
    func handleSubmission(correct: Bool) {
        sceneDelegate?.pointsScored(points: correct ? possiblePoints : 0, ofPossible: possiblePoints)
        challengeNode.removeFromParent()
        showResult(view: self.view!, correct: correct)
    }
    
    func showResult(view: SKView, correct: Bool) {
        resultNode.size = view.bounds.size
        resultNode.position = view.center
        addChild(resultNode)
        
        let successText = SKLabelNode(text: correct ? "GREAT!" : "NOPE")
        successText.fontSize = 150
        successText.position = CGPoint.zero
        resultNode.addChild(successText)
        transitionToNext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let positionInScene = touch.location(in: self)
        if let touchedNode = nodes(at: positionInScene).first, let name = touchedNode.name {
            if name == vagina {
                handleSubmission(correct: true)
            } else if name == vulva {
                handleSubmission(correct: false)
            }
        }
    }
    
    func transitionToNext() {
        delay(duration: Configuration.time.defaultDuration) { 
            self.sceneDelegate?.sceneDone(scene: self)
        }
    }
    
    func change() {
        print("change")
    }

}
